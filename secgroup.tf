resource "aws_security_group" "my_sg"{
	name   = "capstone-sg"
	vpc_id = "aws_vpc.main.id" 

	ingress{
	   description = "Allow https from everywhere"
	   from_port   = "80"
	   to_port     = "80"
	   protocol    = "tcp"
	   cidr_blocks = ["0.0.0.0/0"]
	}

        ingress{
           description = "Allow ssh from everywhere"
           from_port   = "22"
           to_port     = "22"
           protocol    = "tcp"
           cidr_blocks = ["0.0.0.0/0"]
        }

	egress{
	   description = "Allow outgoing traffic"
	   from_port   = 0
	   to_port     = 0
	   cidr_blocks = ["0.0.0.0/0"]
	   protocol    = "-1"
	}
	
	tags = {
	   Name = capstone-sg
	}
}
