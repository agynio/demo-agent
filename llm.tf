resource "agyn_llm_provider" "openai" {
  organization_id = var.organization_id
  endpoint        = "https://api.openai.com/v1/responses"
  auth_method     = "bearer"
  token           = var.openai_token
}

resource "agyn_model" "model" {
  organization_id = var.organization_id
  name            = "gpt-5.2"
  llm_provider_id = agyn_llm_provider.openai.id
  remote_name     = "gpt-5.2"
}
