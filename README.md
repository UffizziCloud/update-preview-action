# Update Full-Stack Preview Environment to K8s

Uses Open Source Uffizzi CLI `uffizzi preview update` to update an on-demand, ephemeral test environment onto your Kubernetes cluster.

## Inputs

### `server`

URL of your Uffizzi installation (default: https://app.uffizzi.com)

### `username`

**Required** Uffizzi username

### `password`

**Required** Your Uffizzi password. Specify a GitHub Encrypted Secret and use it! See example below.

### `project`

**Required** Uffizzi project name

### `compose-file`

Path to a compose file within your repository (default: docker-compose.yaml)

### `preview-id`

**Required** ID of Uffizzi existing preview

### `ghcr-username` and `ghcr-access-token`

Your GitHub username and the value of a [Github personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) with access to the `read:packages` scope.

This option is provided as a convenience to get started quickly. For sensitive repositories, we recommend instead connecting your Uffizzi account to GHCR via the web interface or by executing `uffizzi connect ghcr` from a trusted environment.

## Example usage

```yaml
uses: UffizziCloud/update-preview-action@v1
with:
  server: 'https://app.uffizzi.com'
  username: 'admin@uffizzi.com'
  password: ${{ secrets.UFFIZZI_PASSWORD }}
  project: 'default'
  compose-file: 'docker-compose.uffizzi.yaml'
  preview-id: 1
```
