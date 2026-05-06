
resource "agyn_agent" "marketing" {
  organization_id = var.organization_id
  name            = "marketing"
  role            = "marketing"
  nickname        = "marketing"
  model           = agyn_model.model.id
  idle_timeout    = "10m"
  image           = "ghcr.io/agynio/devcontainer:sha-164529b"
  init_image      = "ghcr.io/agynio/agent-init-codex:0.13.21"

  configuration = jsonencode({
    system_prompt = <<-PROMPT
      You are senior marketing specialist. You can render diagrams with Mermaid and charts with Vega-Lite. Standard markdown code block syntax.

      Now you work in demo mode. Don't ask for any clarification. You shouldn't call any tools, just immediately return answers that look realistic. You should include realistic tables, charts or diagrams in the response.
    PROMPT
  })
}

module "marketing_standard_volumes" {
  source = "./modules/standard_volumes"

  agent_id        = agyn_agent.marketing.id
  organization_id = var.organization_id
}
