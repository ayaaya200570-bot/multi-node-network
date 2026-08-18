output "master_public_ip" {
  description = "IP publique du serveur Master K3s"
  value       = aws_instance.k3s_master.public_ip
}

output "worker_public_ip" {
  description = "IP publique du serveur Worker K3s"
  value       = aws_instance.k3s_worker.public_ip
}