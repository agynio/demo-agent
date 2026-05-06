variable "api_url" {
  type        = string
  description = "Agyn Gateway URL"
  default     = "https://gateway.agyn.dev:2496"
}

variable "organization_id" {
  description = "ID of the Agyn organization"
  type        = string
}

variable "api_token" {
  description = "API Token"
  type        = string
}

variable "openai_token" {
  description = "OpenAI Token"
  type        = string
}

variable "clickhouse_host" {
  type    = string
  default = "sql-clickhouse.clickhouse.com"
}

variable "clickhouse_port" {
  type    = string
  default = "8443"
}

variable "clickhouse_username" {
  type    = string
  default = "demo"
}

variable "clickhouse_password" {
  type    = string
  default = ""
}

variable "clickhouse_secure" {
  type    = bool
  default = true
}
