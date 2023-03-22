# get-envs_action

GitHub actions to pull down secrets from Azure Key Vaults.

| Variable | Description | Required | `[Default]` |
|----|----|:----:|----|
| `azurecredentials` | Credentials to login to Azure. This is usually set to `${{ secrets.AZURE_CREDENTIALS }}` | x | `N/A` |
| `environmentKeyVault` | Azure Key Vault Name. If this value is given, the action will search for a Key Vault with a matching name. Otherwise, the action will automatically use the `repositoryName` and the `environment` options to get the Key Vault name. |  | `N/A` |
| `repositoryName` | GitHub Repository Name |  | `${{ github.event.repository.name }}` |
| `environment` | Deployment environment | x | `N/A` |
## Example

```
- uses: Andrews-McMeel-Universal/get-envs@v1.1
  with:
    azurecredentials: ${{ secrets.AZURE_CREDENTIALS }}
    environment: development
```