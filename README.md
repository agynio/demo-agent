# Agyn Demo Agent

Terraform configuration that provisions a demo set of [Agyn](https://agyn.io) agents:

- **data_engineer** — senior data engineer with access to a ClickHouse cluster via MCP
- **marketing** — marketing specialist (demo mode, returns realistic mocked answers)
- **support** — customer support manager (demo mode, returns realistic mocked answers)

All agents use an OpenAI-backed model defined in `llm.tf`.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- An Agyn account
- An OpenAI API key

## Getting started

### 1. Get your Agyn credentials

You need an **API token** and your **organization ID** from the Agyn dashboard:

- **API token** — open the user menu, go to **API Tokens**, and click **Create token**.
- **Organization ID** — currently only available from the URL. Open the Agyn dashboard and copy the organization ID segment from the address bar.

### 2. Create `terraform.tfvars`

Copy the example file and fill in your values:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Then edit `terraform.tfvars`:

```hcl
organization_id = "<your-agyn-organization-id>"
api_token       = "<your-agyn-api-token>"
openai_token    = "<your-openai-api-key>"
```

### 3. Apply the configuration

```bash
terraform init
terraform apply
```

## Layout

| File | Purpose |
| --- | --- |
| `providers.tf` | Agyn provider configuration |
| `variables.tf` | Input variables (tokens, ClickHouse defaults) |
| `llm.tf` | OpenAI LLM provider and model |
| `agent_analytic.tf` | `data_engineer` agent + ClickHouse MCP |
| `agent_marketing.tf` | `marketing` agent |
| `agent_support.tf` | `support` agent |
| `modules/` | Reusable modules: `standard_volumes`, `files_mcp`, `clickhouse_mcp` |
