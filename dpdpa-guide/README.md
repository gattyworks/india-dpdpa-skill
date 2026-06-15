# AI Guide: Using the DPDPA Toolkit Repository

Welcome, AI Agent! If you are reading this file, you have been tasked with interacting with this repository to build, audit, or extend systems related to India's **Digital Personal Data Protection Act (DPDPA), 2023**.

This README acts as your prompt guide, establishing the circumstances in which you should use this repository and how you should approach building solutions.

## 1. When to Use This Repository

You should reference this repository and its tools when the human user asks you to:
- **Build New Features:** Implement data collection pipelines, consent management platforms, or user profile pages.
- **Audit Existing Code:** Review a codebase for DPDPA compliance, looking for hardcoded personal data, lack of data minimization, or improper consent flows.
- **Extend Legal Frameworks:** Create new privacy policies, cookie banners, or breach notification protocols specifically tailored for Indian citizens.
- **Automate Compliance:** Write scripts that manage the "Right to Erasure" or data portability for Data Principals.

## 2. How to Build (Architecture Guidelines)

When instructed to write code or build systems based on this repo, strictly adhere to these DPDPA principles:
1. **Consent-First Architecture:** Before any data ingestion logic is written, ensure there is an API or UI layer that captures affirmative, granular consent. Do not use pre-ticked boxes.
2. **Data Minimization by Default:** Only request data strictly necessary for the immediate function. If building a weather app, do not ask for a phone number.
3. **Role-Based Access:** When building database schemas or APIs, ensure that access to PII (Personally Identifiable Information) is heavily restricted and logged.
4. **Erasure Hooks:** Any data model you create for a user must have a corresponding `.delete()` or similar lifecycle hook that permanently removes all traces of the user upon request.

## 3. Demo Runs & Multiple Use Cases

Here are examples of how you (the AI) should respond to different user prompts when operating in this workspace.

### Use Case 1: Building a Consent Prompt
**User Prompt:** *"I need a signup form for our new e-commerce app."*
**AI Action Plan:**
1. Do not just build a standard email/password form.
2. Implement an explicit DPDPA-compliant notice.
3. Generate a UI component that lists exactly what data is collected (Name, Address) and the purpose (Shipping goods).
4. Add a non-pre-checked "I consent" checkbox. Provide a link to the Data Fiduciary's grievance officer.

### Use Case 2: Handling a Data Breach
**User Prompt:** *"Our database was accessed by an unauthorized IP. Write a response script."*
**AI Action Plan:**
1. Write a script to immediately lock down the compromised database tables.
2. Generate an automated email template informing the affected Data Principals about the breach, the nature of data lost, and mitigation steps.
3. Generate a formal notification draft addressed to the **Data Protection Board of India (DPBI)** as required by the DPDPA.

### Use Case 3: Implementing Data Principal Rights
**User Prompt:** *"A user requested to delete their account. Build the backend logic."*
**AI Action Plan:**
1. Build a cascading delete function that removes the user's data from the primary relational database.
2. Ensure the logic also reaches out to any third-party Data Processors (e.g., mailing lists, analytics tools) via their APIs to issue a delete command.
3. Send a confirmation email to the user indicating successful erasure.

---

**⚠️ FAIR WARNING: This document and the processes described within it are designed to be consumed and executed by AI assistants. The guidance provided is based on AI interpretation of the Digital Personal Data Protection Act (DPDPA), 2023. It does not constitute legal advice. Human oversight, particularly by qualified legal professionals, is strictly required before deploying any compliance-related code or processes into production.**
