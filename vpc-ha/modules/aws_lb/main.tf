resource "aws_lb" "app-lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [var.sg_id]
  subnets            = [var.subnet1_id, var.subnet2_id]
}

resource "aws_lb_target_group" "app-lb-tg" {
  name     = "app-lb-target-group"
  vpc_id   = var.vpc_id
  port     = 80
  protocol = "HTTP"

  health_check {
    path     = "/health"
    port     = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "app-lb-tg-attachment-1" {
  target_id        = var.instance1_id
  target_group_arn = aws_lb_target_group.app-lb-tg.arn
  port             = 80
}

resource "aws_lb_target_group_attachment" "app-lb-tg-attachment-2" {
  target_id        = var.instance2_id
  target_group_arn = aws_lb_target_group.app-lb-tg.arn
  port             = 80
}

resource "aws_lb_listener" "app-lb-listener" {
  load_balancer_arn = aws_lb.app-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app-lb-tg.arn
  }
}