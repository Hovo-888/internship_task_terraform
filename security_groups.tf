data "http" "ipinfo" {
  url = "https://ipinfo.io"
}

# Serveri security groupery
resource "aws_security_group" "server-sg" {
  name        = "server-sg"
  description = "server-sg"
  vpc_id      = aws_vpc.task-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [format("%s/32", jsondecode(data.http.ipinfo.response_body).ip)] //SSH mer ip ic
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] // stana bolor ipv4 trafficy 80 port
    ipv6_cidr_blocks = ["::/0"]      // stana bolor ipv6 trafficy 80 port
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] // stana bolor ipv4 trafficy 443 port
    ipv6_cidr_blocks = ["::/0"]      // stana bolor ipv6 trafficy 443 port
  }

  //Outbound rules
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}