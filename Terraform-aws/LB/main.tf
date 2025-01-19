resource "aws_lb" "my_alb" {
  name               = "my-terra-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups   = ["${var.security_groups}"]
  subnets            = [var.subnet_id , var.private_subnet_id]

  enable_deletion_protection = true

  access_logs {
    bucket  = "ankit-terra-bucket"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "alb_target_group" {
    name = "aws-lb-tg"
    target_type = "ip"
    port = 443
    protocol = "HTTPS"
    vpc_id = var.vpc_id

    health_check {
      enabled = true
      interval = 300
      path = "/"
      timeout = 60
      matcher = 200
      healthy_threshold = 5
      unhealthy_threshold = 5
    }

    lifecycle {
      create_before_destroy = true
    }
  
}

resource "aws_lb_listener" "http_alb_listener" {
    load_balancer_arn = aws_lb.my_alb.arn
    port = 443
    protocol = "HTTP"

    default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}