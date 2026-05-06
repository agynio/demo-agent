
resource "agyn_agent" "data_engineer" {
  organization_id = var.organization_id
  name            = "data_engineer"
  role            = "data_engineer"
  nickname        = "data_engineer"
  model           = agyn_model.model.id
  idle_timeout    = "10m"
  image           = "ghcr.io/agynio/devcontainer:sha-164529b"
  init_image      = "ghcr.io/agynio/agent-init-codex:0.13.21"

  configuration = jsonencode({
    system_prompt = <<-PROMPT
      You are senior data engineer. You have access to clickhouse cluster via mcp. You can render diagrams with Mermaid and charts with Vega-Lite. Standard markdown code block syntax.
    PROMPT
  })
}


module "data_engineer_standard_volumes" {
  source = "./modules/standard_volumes"

  agent_id        = agyn_agent.data_engineer.id
  organization_id = var.organization_id
}

module "data_engineer_files_mcp" {
  source = "./modules/files_mcp"

  agent_id = agyn_agent.data_engineer.id
}

module "data_engineer_clickhouse_mcp" {
  source = "./modules/clickhouse_mcp"

  agent_id = agyn_agent.data_engineer.id

  clickhouse_host     = var.clickhouse_host
  clickhouse_port     = var.clickhouse_port
  clickhouse_password = var.clickhouse_password
  clickhouse_username = var.clickhouse_username
  clickhouse_secure   = var.clickhouse_secure
}
