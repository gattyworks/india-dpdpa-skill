_Engineering aid for evidence-gathering during a DPDPA audit. Last reviewed: 2026-08-15._

# Codebase detection patterns

How to find **evidence** for each checklist dimension in a real repository. Patterns are
`ripgrep` (`rg`); adapt to the stack. A match is a *lead*, not a verdict - read the surrounding
code before scoring. Treat absence as `not found` evidence only after a scoped search. Use `Needs
review` when the control can live in operations, contracts, or another system.

## 1. Map the personal-data surface (do this first)

Find where PII enters, lives, and leaves.

```bash
# PII fields in models / schemas / DTOs
rg -i -n "\b(email|phone|mobile|aadhaar|pan|passport|dob|date_of_birth|address|pincode|gender|location|lat|long|ip_?address|device_?id|fingerprint|biometric)\b" --glob '!**/node_modules/**'
# DB schema / migrations / ORM models
rg -l -i "create table|CREATE TABLE|@Entity|class .*\(models\.Model\)|Schema\(|prisma" 
# Inbound collection points (forms, request bodies, query params)
rg -i -n "req\.(body|query|params)|request\.(POST|GET|data)|formData|@RequestBody"
```
Output: a data inventory with category, storage, purpose, and recipients. It drives dimension **A**.

## 2. Consent & notice (dimensions B)

```bash
# Consent capture / storage
rg -i -n "consent|opt[-_]?in|opt[-_]?out|gdpr|privacy_?(accepted|agreed)|terms_?accepted"
# Pre-ticked consent smell
rg -i -n "checked\s*=\s*[\"']?true|defaultChecked|isChecked\s*=\s*true"
# Withdrawal path (must exist and be easy - B5)
rg -i -n "withdraw|revoke|unsubscribe|delete_?consent|opt_?out"
# Consent audit trail / versioned notice (B6)
rg -i -n "consent_?(log|history|record|version|timestamp)|notice_?version"
```
No consent evidence and no withdrawal route can support **B3/B5/B6** after a scoped search.
Pre-ticked consent is a **B3 High** lead.

## 3. Security safeguards (dimension C1 - the ₹250 cr band)

```bash
# Encryption in transit / at rest
rg -i -n "https|tls|ssl|hsts|encrypt|aes|kms|crypto\.|bcrypt|argon2|scrypt|pbkdf2"
# Plaintext-password / weak-hash smells
rg -i -n "md5|sha1\b|password\s*=\s*[\"']|plain_?text|base64.*pass"
# Secrets in code (also a breach risk)
rg -i -n "(api[_-]?key|secret|token|password|aws_access)\s*[:=]\s*[\"'][A-Za-z0-9/\+]{12,}"
# Access control / authz
rg -i -n "authorize|rbac|permission|role|isAdmin|@PreAuthorize|require_auth|middleware.*auth"
# Audit logging present
rg -i -n "audit_?log|access_?log|logger\.(info|audit)|winston|pino|log4j"
```
Hardcoded secrets or weak password hashing can support a **C1 Critical** finding. Confirm how TLS,
storage encryption, and authorisation are enforced before treating a missing repository match as a gap.

## 4. PII in logs (silent breach risk - D/C1)

```bash
# Logging that may leak PII
rg -i -n "(log|console\.(log|info)|print|printf|logger)\s*\(.*\b(email|phone|password|token|aadhaar|user)\b"
```
PII written to logs/analytics in plaintext is a confidentiality compromise - flag it.

## 5. Breach handling (dimension D)

```bash
rg -i -n "breach|incident|data_?leak|notify.*(board|authority|user)|security_?event"
```
If response controls should be in the repository and are not found, record **D1/D5** evidence.
Otherwise ask operations and use `Needs review`.

## 6. Children's data (dimension E)

```bash
rg -i -n "age|birth_?date|dob|under_?18|minor|child|parental|guardian|coppa|age_?gate|age_?verif"
# Tracking/ads SDKs that must NOT target children
rg -i -n "google.*analytics|gtag|facebook.*pixel|fbq|mixpanel|amplitude|segment|adsense|admob|appsflyer"
```
Ad or tracking SDKs plus a plausibly under-18 audience require review under **E1/E3**. Check Rule
12 exemptions and the actual control before scoring.

## 7. Data Principal rights endpoints (dimension F)

```bash
# Access response; export terms are useful search leads but DPDPA has no general portability right
rg -i -n "export.*data|download.*data|data_?export|gdpr.*export|/me\b|account/data"
# Correction / erasure / account deletion
rg -i -n "delete_?account|erase|right_?to_?(access|erasure)|/(dsar|data-request)|forget"
```
No access-response or erasure path can support **F1/F2 High** after a scoped search.

## 8. Retention & erasure (dimension I)

```bash
# Scheduled erasure / TTL
rg -i -n "retention|ttl|expire|purge|cron|scheduler|cleanup_?job|soft_?delete|deleted_?at"
```
"Soft delete only / keep forever", no purge job, or no TTL can support **I1/I2**. Look for the three-year
inactivity rule if the app is e-commerce / gaming / social media at scale (**I3**).

## 9. Cross-border transfer (dimension H)

```bash
# Cloud regions / external data sinks
rg -i -n "us-east|us-west|eu-west|region\s*[:=]|s3\.amazonaws|cdn|cloudfront|firebase|mongodb\+srv|datacenter"
# Third-party data egress
rg -i -n "fetch\(|axios|httpclient|webhook|export.*to|send.*to.*(api|partner|vendor)"
```
Map every external sink to a country and identify foreign-State access paths. Check current Act 16
notifications and Rule 15 orders before scoring **H1**.

## 10. Governance artifacts (dimension J)

```bash
# Published policy pages / files
rg -l -i "privacy[-_ ]?policy|privacy\.(md|html|tsx|jsx|vue)|terms|cookie[-_ ]?policy|data[-_ ]?protection"
# DPA / vendor agreements in repo or docs
rg -l -i "data processing agreement|\bDPA\b|sub-?processor|vendor agreement"
```
Missing repository artifacts can support **J1** or **J4**, but policies and contracts can live outside
the codebase. Use `Needs review` until their absence is confirmed.

---

## Stack hints

- **Next.js / React:** check `app/privacy`, `pages/privacy`, consent banners in `_app`/layout, API routes under `app/api`.
- **Django:** `models.py` for PII, `settings.py` for `SECURE_*`/`SESSION_COOKIE_SECURE`, `django-gdpr`/`django-consent`.
- **Rails:** `schema.rb`, `has_secure_password`, `paranoia`/soft-delete gems, `config/initializers`.
- **Spring:** `@Entity`, `application.yml` TLS, `@PreAuthorize`.
- **Mobile:** check tracking SDKs (AppsFlyer, Firebase, Facebook), age gates, and OS permission prompts.

Always pair a code finding with the checklist item it satisfies/violates in
[audit-checklist.md](audit-checklist.md), and the section cite from [act-2023.md](act-2023.md).
