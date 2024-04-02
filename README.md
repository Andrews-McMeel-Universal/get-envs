# Get Environment Variables Action

This GitHub action retrieves secrets from Azure Key Vaults and makes them available in your workflows.

## Features

- Generates a `.env` file within a job, adding all the secrets to the `$GITHUB_ENV` environment variable
- Masks values with keys such as `SECRET`, `TOKEN`, `KEY`, `PASS` in the GitHub output for security.

## Quick Start

Clone the repository:

```bash
git clone https://github.com/Andrews-McMeel-Universal/get-envs
```

## Integration

To integrate `get-envs` into your workflow, add a step to a workflow in your `.github/workflows/` directory.

### Auto-detect KeyVault

Set the `environment` to automatically find the Azure Key Vault with matching tags to the `environment` and `repositoryName`.

```yml
- uses: Andrews-McMeel-Universal/get-envs@v1.1
  with:
    azurecredentials: ${{ secrets.AZURE_CREDENTIALS }}
    environment: development
```

### Specify Key Vault Name

To download secrets from a specific Key Vault, specify its name in the `environmentKeyVault` option.

```yml
- uses: Andrews-McMeel-Universal/get-envs@v1.1
  with:
    azurecredentials: ${{ secrets.AZURE_CREDENTIALS }}
    environmentKeyVault: get-envs
```

## Configuration Options

| Variable              | Description                                                                                                        | Required | Default                               |
| --------------------- | ------------------------------------------------------------------------------------------------------------------ | :------: | ------------------------------------- |
| `azurecredentials`    | Azure login credentials. Usually set to `${{ secrets.AZURE_CREDENTIALS }}`.                                        |    ✔️    | `N/A`                                 |
| `environmentKeyVault` | Name of the Azure Key Vault. If provided, the action will search for a matching Key Vault.                         |          | `N/A`                                 |
| `repositoryName`      | GitHub Repository Name.                                                                                            |          | `${{ github.event.repository.name }}` |
| `environment`         | Deployment environment.                                                                                            |          | `N/A`                                 |
