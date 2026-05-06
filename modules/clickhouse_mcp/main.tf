
resource "agyn_mcp" "clickhouse_mcp" {
  agent_id    = var.agent_id
  name        = "clickhouse_mcp"
  image       = "ghcr.io/astral-sh/uv:python3.10-bookworm-slim"
  command     = "CLICKHOUSE_MCP_BIND_PORT=$MCP_PORT uv run --with mcp-clickhouse --python 3.10 mcp-clickhouse"
  description = "Clickhouse MCP"
}

resource "agyn_env" "clickhouse_mcp_auth" {
  name   = "CLICKHOUSE_MCP_AUTH_DISABLED"
  mcp_id = agyn_mcp.clickhouse_mcp.id
  value  = "true"
}
resource "agyn_env" "clickhouse_mcp_server_transport" {
  name   = "CLICKHOUSE_MCP_SERVER_TRANSPORT"
  mcp_id = agyn_mcp.clickhouse_mcp.id
  value  = "http"
}
resource "agyn_env" "clickhouse_host" {
  name   = "CLICKHOUSE_HOST"
  mcp_id = agyn_mcp.clickhouse_mcp.id
  value  = "clickhouse.clickhouse.svc.cluster.local"
}
resource "agyn_env" "clickhouse_port" {
  name   = "CLICKHOUSE_PORT"
  mcp_id = agyn_mcp.clickhouse_mcp.id
  value  = "8123"
}
resource "agyn_env" "clickhouse_user" {
  name   = "CLICKHOUSE_USER"
  mcp_id = agyn_mcp.clickhouse_mcp.id
  value  = "reader"
}
resource "agyn_env" "clickhouse_password" {
  name   = "CLICKHOUSE_PASSWORD"
  mcp_id = agyn_mcp.clickhouse_mcp.id
  value  = var.clickhouse_password
}
resource "agyn_env" "clickhouse_secure" {
  name   = "CLICKHOUSE_SECURE"
  mcp_id = agyn_mcp.clickhouse_mcp.id
  value  = var.clickhouse_secure ? "true" : "false"
}
resource "agyn_env" "clickhouse_verify" {
  name   = "CLICKHOUSE_VERIFY"
  mcp_id = agyn_mcp.clickhouse_mcp.id
  value  = "true"
}
resource "agyn_env" "clickhouse_connect_timeout" {
  name   = "CLICKHOUSE_CONNECT_TIMEOUT"
  mcp_id = agyn_mcp.clickhouse_mcp.id
  value  = "30"
}
resource "agyn_env" "clickhouse_send_receive_timeout" {
  name   = "CLICKHOUSE_SEND_RECEIVE_TIMEOUT"
  mcp_id = agyn_mcp.clickhouse_mcp.id
  value  = "30"
}
