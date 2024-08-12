terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "${var.user_name}"
  tenant_id = "${var.tenant_id}"
  tenant_name = "BMaaS-Service"
  password    = "${var.password}"
  auth_url    = "${var.auth_url}"
  region      = "${var.region}"
}

data "openstack_compute_instance_v2" "instance" {
  # Randomly generated UUID, for demonstration purposes
  id = "caf61c6a-1070-462a-a9a4-256eeb857c2a"
}

output "instance_detail" {
  value = data.openstack_compute_instance_v2.instance
}

# Network  
#data "openstack_networking_network_v2" "provider_net" {  
#  name = "${var.external_network}"  
#}  
#  
#resource "openstack_networking_router_v2" "webapp_router" {  
#  name                = "webapp_router"  
#  admin_state_up      = true  
#  external_network_id = data.openstack_networking_network_v2.provider_net.id  
#}  
#  
#resource "openstack_networking_network_v2" "webapp_network" {  
#  name           = "webapp_network"  
#  admin_state_up = true  
#}  
#  
#resource "openstack_networking_subnet_v2" "webapp_subnet" {  
#  name            = "webapp_subnet"  
#  network_id      = openstack_networking_network_v2.webapp_network.id  
#  cidr            = "10.0.0.0/24"  
#  ip_version      = 4  
#  dns_nameservers = ["1.1.1.1"]  
#}  
#  
#resource "openstack_networking_router_interface_v2" "webapp_router_interface" {  
#  router_id = openstack_networking_router_v2.webapp_router.id  
#  subnet_id = openstack_networking_subnet_v2.webapp_subnet.id  
#}  
#  
#resource "openstack_compute_secgroup_v2" "webapp_secgroup" {  
#  name        = "webapp_secgroup"  
#  description = "Allow web traffic"  
#  rule {  
#    from_port   = 80  
#    to_port     = 80  
#    ip_protocol = "tcp"  
#    cidr        = "0.0.0.0/0"  
#  }  
#  rule {  
#    from_port   = 22  
#    to_port     = 22  
#    ip_protocol = "tcp"  
#    cidr        = "0.0.0.0/0"  
#  }  
#}  
#  
#resource "openstack_compute_floatingip_v2" "webapp_floatingip" {  
#  pool = "provider-net5"  
#}  
#  
## Volume  
#data "openstack_images_image_v2" "ubuntu_image" {  
#  name = "UBUNTU-22.04-25092023"  
#}  
#  
#resource "openstack_blockstorage_volume_v3" "webapp_volume" {  
#  name        = "webapp_volume"  
#  description = "Volume for webapp"  
#  size        = 40  
#  volume_type = "Premium-SSD_floor5"  
#  image_id    = data.openstack_images_image_v2.ubuntu_image.id  
#}  
#  
## Instance  
#data "openstack_compute_keypair_v2" "webapp_key" {  
#  name = "webapp_key"  
#}  
#  
#data "openstack_compute_flavor_v2" "s2_medium_1" {  
#  name = "2C2G"  
#}  
#  
#/* Userdata  
##cloud-config  
#package_update: true  
#chpasswd:  
#  list: |    root:Welcome***123packages:  
#  - nginx  - gitruncmd:  
#  - systemctl enable nginx  - systemctl start nginx  - git clone https://github.com/cloudacademy/static-website-example.git  - cp -r ./static-website-example/* /var/www/html/  - rm -r ./static-website-example*/  
#  
#resource "openstack_compute_instance_v2" "webapp_instance" {  
#  name            = "webapp_instance"  
#  image_id        = data.openstack_images_image_v2.ubuntu_image.id  
#  flavor_id       = data.openstack_compute_flavor_v2.s2_medium_1.id  
#  key_pair        = data.openstack_compute_keypair_v2.webapp_key.name  
#  security_groups = [openstack_compute_secgroup_v2.webapp_secgroup.name]  
#  availability_zone = "floor5"  
#  
#  user_data = "#cloud-config\npackage_update: true\nchpasswd:\n  list: |\n    root:Welcome***123\npackages:\n  - nginx\n  - git\nruncmd:\n  - systemctl enable nginx\n  - systemctl start nginx\n  - git clone https://github.com/cloudacademy/static-website-example.git\n  - cp -r ./static-website-example/* /var/www/html/\n  - rm -r ./static-website-example"  
#  network {  
#    name = openstack_networking_network_v2.webapp_network.name  
#  }  
#  block_device {  
#    uuid                  = openstack_blockstorage_volume_v3.webapp_volume.id  
#    source_type           = "volume"  
#    destination_type      = "volume"  
#    boot_index            = 0  
#    delete_on_termination = true  
#  }  
#}  
#  
#resource "openstack_compute_floatingip_associate_v2" "webapp_floatingip_associate" {  
#  floating_ip = openstack_compute_floatingip_v2.webapp_floatingip.address  
#  instance_id = openstack_compute_instance_v2.webapp_instance.id  
#}
#  
#output "webapp_public_ip" {  
#  value       = openstack_compute_floatingip_v2.webapp_floatingip.address  
#  description = "Web Application URL"  
#}  
#  
#output "webapp_private_ip" {  
#  value       = openstack_compute_instance_v2.webapp_instance.access_ip_v4  
#  description = "Web Application Private IP"  
#}
