# 1. Création d'un Security Group (Firewall) pour autoriser SSH et K3s/Kubernetes
resource "aws_security_group" "k3s_sg" {
  name        = "${var.project_name}-sg"
  description = "Autoriser le trafic SSH et K3s"

  # SSH (Port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # API Kubernetes / K3s (Port 6443)
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Trafic sortant libre
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}

# 2. Instance EC2 pour le Master Node (Control Plane)
resource "aws_instance" "k3s_master" {
  ami           = "ami-00c71bd4d220aa22a" # Ubuntu 22.04 LTS (eu-west-3 / Paris)
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.k3s_sg.id]

  tags = {
    Name = "${var.project_name}-master"
    Role = "master"
  }
}

# 3. Instance EC2 pour le Worker Node (Edge / Agent)
resource "aws_instance" "k3s_worker" {
  ami           = "ami-00c71bd4d220aa22a"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.k3s_sg.id]

  tags = {
    Name = "${var.project_name}-worker-1"
    Role = "worker"
  }
}