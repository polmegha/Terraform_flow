# GitHub Actions Secrets Configuration

To run the Terraform CI/CD pipeline in GitHub Actions, you need to configure the following secrets in your GitHub repository:

## Required Secrets

Navigate to **Settings > Secrets and variables > Actions** in your GitHub repository and add these secrets:

| Secret Name | Value | Description |
|---|---|---|
| `ARM_CLIENT_ID` | Azure Service Principal Client/App ID | The client ID of your Azure Service Principal |
| `ARM_CLIENT_SECRET` | Azure Service Principal Secret | The secret/password of your Azure Service Principal |
| `ARM_TENANT_ID` | Azure Tenant ID | Your Azure Active Directory Tenant ID |
| `ARM_SUBSCRIPTION_ID` | Azure Subscription ID | Your Azure Subscription ID |

## How to Create an Azure Service Principal

If you don't have a service principal, create one using Azure CLI:

```bash
az ad sp create-for-rbac --name "TerraformServicePrincipal" --role Contributor --scopes /subscriptions/{subscription-id}
```

This command will output:
- `appId` → Use this for `ARM_CLIENT_ID`
- `password` → Use this for `ARM_CLIENT_SECRET`
- `tenant` → Use this for `ARM_TENANT_ID`

## Environment Variables

The following variables are already configured in the workflow and can be modified in the workflow file:

| Variable | Default Value | Description |
|---|---|---|
| `TF_VERSION` | 1.6.6 | Terraform version to use |
| `BACKEND_RG` | rg-dev-001 | Azure resource group for backend state |
| `BACKEND_SA` | tfrgdev001 | Azure storage account for backend state |
| `BACKEND_CONTAINER` | tfstate | Container name in storage account |
| `BACKEND_KEY` | dev.terraform.tfstate | Key for the state file |

## Workflow Behavior

- **Push to master**: Runs `terraform plan` AND `terraform apply`
- **Pull Requests**: Runs `terraform plan` only (no apply)
- All sensitive values are masked in logs for security
