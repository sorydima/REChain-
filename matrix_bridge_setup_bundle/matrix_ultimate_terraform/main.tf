
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "matrix" {
  name   = "matrix-ultimate"
  region = "fra1"
  size   = "s-2vcpu-4gb"
  image  = "docker-20-04"
  ssh_keys = [var.ssh_key_fingerprint]

  user_data = <<-EOF
              #cloud-config
              runcmd:
                - git clone https://github.com/sorydima/REChain-/tree/main/matrix_bridge_setup_bundle /opt/matrix
                - docker-compose -f /opt/matrix/docker-compose.yml up -d
              EOF
}
