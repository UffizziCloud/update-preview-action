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
