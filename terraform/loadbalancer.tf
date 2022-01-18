resource "aws_alb" "Democrance-LoadBalancer" {
  name                       = "democrance-lb"
  security_groups            = [aws_security_group.ALB-SG.id]
  subnets		     = ["${aws_subnet.Democrance-Public-1.id},${aws_subnet.Democrance-Public-2.id}"]
  enable_deletion_protection = true
  tags                       = {
    "Name"                   = "Democrance LoadBalancer"
        }
}

resource "aws_alb_target_group" "Democrance-TG" {
  name     = "Democrance-ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.Democrance.id}"
  stickiness {
    type = "lb_cookie"
  }
  # Alter the destination of the health check to be the login page.
  health_check {
    path = "/"
    port = 80
  }
}

resource "aws_alb_target_group_attachment" "demo1" {
  target_group_arn   = aws_alb_target_group.Democrance-TG.arn
  target_id          = aws_instance.Democrance-APP.id
  port               = 80
}

resource "aws_alb_target_group_attachment" "demo2" {
  target_group_arn   = aws_alb_target_group.Democrance-TG.arn
  target_id          = aws_instance.Democrance-APP.id
  port               = 443
}

resource "aws_alb_listener" "listener_http" {
  load_balancer_arn  = "${aws_alb.Democrance-LoadBalancer.arn}"
  port               = "80"
  protocol           = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.Democrance-TG.arn}"
    type             = "forward"
  }
}

resource "aws_alb_listener" "listener_https" {
  load_balancer_arn = "${aws_alb.Democrance-LoadBalancer.arn}"
  port              = "443"
  protocol          = "HTTPS"
  default_action {
    target_group_arn = "${aws_alb_target_group.Democrance-TG.arn}"
    type             = "forward"
  }
}
