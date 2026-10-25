## 📋 Infrastructure Change Summary

### Description
<!-- Provide a concise description of the changes introduced in this PR -->

### Related Issue / Ticket
- Resolves #<!-- Issue number or Jira/ADO Ticket link -->

---

## 🎯 Impacted Components & Environments

- [ ] `modules/azurerm_application_gateway`
- [ ] `modules/azurerm_bastion`
- [ ] `modules/azurerm_key_vault`
- [ ] `modules/azurerm_load_balancer`
- [ ] `modules/azurerm_virtual_network` / `modules/azurerm_subnet`
- [ ] `modules/azurerm_virtual_machine`
- [ ] `environments/preprod`
- [ ] `environments/prod`
- [ ] CI/CD Pipeline (`.github/workflows` / `azure-pipelines.yml`)

### Blast Radius Assessment
- [ ] **Low**: Additive change (new tags, read-only data source, documentation).
- [ ] **Medium**: Modification of non-critical resource attributes without downtime.
- [ ] **High**: Network routing, NSG alterations, subnet resizing, Key Vault policies.
- [ ] **Critical**: Resource replacement/destruction, VM recreations, production state modification.

---

## 🛡️ Security & Compliance Verification

- [ ] `terraform fmt -check` passed cleanly across all modified paths.
- [ ] `tflint` passed without warnings or errors.
- [ ] `gitleaks` passed: No secrets, passwords, or private keys committed.
- [ ] `tfsec` / `trivy` scans passed with 0 High or Critical severity findings.
- [ ] State backend access complies with least-privilege RBAC.

---

## 🧪 Terraform Plan & Verification

```text
<!-- Paste output summary from `terraform plan` here (e.g., Plan: 2 to add, 1 to change, 0 to destroy) -->
```

---

## ✅ Deployment Checklist

- [ ] Code reviewed by designated [CODEOWNER](.github/CODEOWNERS).
- [ ] Pre-production validation completed successfully.
- [ ] Rollback strategy verified in the event of pipeline failure.
- [ ] Change window approved (if impacting `prod`).
