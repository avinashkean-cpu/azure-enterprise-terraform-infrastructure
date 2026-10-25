# Project Security Policy

## Supported Versions

We release security patches and updates for the active and supported environments listed below.

| Environment | Supported          | Security SLA |
| ----------- | ------------------ | ------------ |
| `prod`      | :white_check_mark: | < 24 Hours   |
| `preprod`   | :white_check_mark: | < 48 Hours   |
| Modules     | :white_check_mark: | < 72 Hours   |

---

## Reporting a Vulnerability

The integrity and security of our cloud infrastructure is our highest priority. If you identify a security vulnerability or misconfiguration, please follow the responsible disclosure process:

1. **Do NOT open a public GitHub issue.**
2. Send a detailed report to the security team via **GitHub Private Vulnerability Reporting** or email `security-cloud@yourdomain.com`.
3. Include the following details in your report:
   - Impacted Terraform module or environment (`modules/*`, `environments/prod`, `environments/preprod`)
   - Type of vulnerability (e.g., exposed secrets, insecure NSG rule, permissive IAM/RBAC role, unencrypted storage)
   - Step-by-step reproduction guide or Proof of Concept (PoC)
   - Proposed mitigation or remediation steps (if known)

### Response & SLA Timeline

- **Initial Acknowledgment**: Within 12 hours.
- **Triage & Severity Assessment**: Within 24 hours.
- **Patch Development & Testing**: Within 48 hours for Critical / High severity findings.
- **Public Disclosure**: Coordinated after the patch is applied across all production environments.

---

## Automated Security Guardrails

All code committed to this repository is subjected to mandatory automated security scanning:

- **Secret Detection**: [Gitleaks](https://github.com/gitleaks/gitleaks) runs on every commit to block hardcoded API keys, certificates, and credentials.
- **Static IaC Security Analysis**: [tfsec](https://github.com/aquasecurity/tfsec) and [Trivy](https://github.com/aquasecurity/trivy) scan for CIS Azure benchmark compliance and cloud misconfigurations.
- **Linting & Best Practices**: [TFLint](https://github.com/terraform-linters/tflint) enforces cloud naming conventions and deprecated attribute checks.
- **Dependency Auditing**: [Dependabot](https://docs.github.com/en/code-security/dependabot) monitors Terraform providers and GitHub Actions for known vulnerabilities.
