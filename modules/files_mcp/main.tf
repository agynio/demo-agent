resource "agyn_mcp" "files_mcp" {
  agent_id    = var.agent_id
  name        = "files_mcp"
  image       = "ghcr.io/agynio/files-mcp:0.1.0"
  command     = "/app/files-mcp"
  description = "File access MCP — provides read_file tool"
}
