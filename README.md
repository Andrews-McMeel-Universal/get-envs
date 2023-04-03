# Get Environment Variables Action

GitHub actions to pull down secrets from Azure Key Vaults.

This will generate a `.env` file within a job and will add all of the secrets to the `$GITHUB_ENV` environment variable.

> NOTE: All values with the following keys, `SECRET|TOKEN|KEY|PASS`, will be masked from the GitHub output.

## Installation

To make `get-envs` a part of your workflow, just add a step to one of your workflows in your `.github/workflows/` directory in your GitHub repository.

### Find Tagged KeyVault

If you'd prefer to not set the `environmentKeyVault` manually, you can just set the `environment` like below. This will automatically find the Azure Key Vault that has matching tags to the `environment` and the `repositoryName` values.

```yml
- uses: Andrews-McMeel-Universal/get-envs@v1.1
  with:
    azurecredentials: ${{ secrets.AZURE_CREDENTIALS }}
    environment: development
```

### Specifying Key Vault Name

To specify a Key Vault to download the Secret values from, you can specify the Key Vault name in the `environmentKeyVault` option when calling the action.

```yml
- uses: Andrews-McMeel-Universal/get-envs@v1.1
  with:
    azurecredentials: ${{ secrets.AZURE_CREDENTIALS }}
    environmentKeyVault: get-envs
```

## Options

| Variable              | Description                                                                                                                                                                                                                           | Required | `[Default]`                           |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: | ------------------------------------- |
| `azurecredentials`    | Credentials to login to Azure. This is usually set to `${{ secrets.AZURE_CREDENTIALS }}`                                                                                                                                              |    x     | `N/A`                                 |
| `environmentKeyVault` | Azure Key Vault Name. If this value is given, the action will search for a Key Vault with a matching name. Otherwise, the action will automatically use the `repositoryName` and the `environment` options to get the Key Vault name. |          | `N/A`                                 |
| `repositoryName`      | GitHub Repository Name                                                                                                                                                                                                                |          | `${{ github.event.repository.name }}` |
| `environment`         | Deployment environment                                                                                                                                                                                                                |          | `N/A`                                 |
