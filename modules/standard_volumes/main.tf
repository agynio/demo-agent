resource "agyn_volume" "state" {
  organization_id = var.organization_id
  persistent      = true
  mount_path      = "/root"
  size            = "1Gi"
  description     = "agn thread persistence"
}

resource "agyn_volume_attachment" "state" {
  volume_id = agyn_volume.state.id
  agent_id  = var.agent_id
}


resource "agyn_volume" "workspace" {
  organization_id = var.organization_id
  persistent      = true
  mount_path      = "/workspace"
  size            = "5Gi"
  description     = "workspace persistence"
}

resource "agyn_volume_attachment" "workspace" {
  volume_id = agyn_volume.workspace.id
  agent_id  = var.agent_id
}
