resource "aws_launch_template" "my_template"{
   name = "capstone-template"
   image_id = "ami-0c7217cdde317cfec"
   instace_type = "t2.micro"
   network_interfaces{
	associate_public_ip_address = "true"
	security_groups = [aws_security_groups.my_sg.id]
   }
}

resource "aws_autoscaling_group" "my_asg"{
   name = "capstone_asg"
   max_size = 3
   min_size = 1
   health_check_type = "EC2"
   desired_capability = 1
   vpc_zone_identifier = [aws_subnet.subnet_a.id, aws_subnet_b.id, aws_subnet.subnet_c.id]
   launch_template{
   id = aws_launch_template.my_template.id
   }
}

resource "aws_autoscaling_policy" "my_as_policy"{
   name = "my_capstone_as_policy"
   policy_type = "TargetTrackingScaling" 
   autoscaling_group_name = "\${aws_autoscaling_mygroup.my_asg.name}"
   estimated_instance_warmup = 200
   target_tracking_configuration {
	predefined_metric_specification {
   	predefined_metric_type = "ASGAverageCPUUtilization"
        }
   target_value = 20
   }
}


   
	
