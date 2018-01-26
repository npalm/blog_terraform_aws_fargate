resource "aws_security_group" "awsvpc_sg" {
  name   = "blog-awsvpc-cluster-sg"
  vpc_id = "${module.vpc.vpc_id}"

  ingress {
    protocol  = "tcp"
    from_port = 0
    to_port   = 65535

    cidr_blocks = [
      "${module.vpc.vpc_cidr}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "blog-ecs-cluster-sg"
    Environment = "blog"
  }
}

resource "aws_ecs_service" "service" {
  name            = "blog"
  cluster         = "${aws_ecs_cluster.cluster.id}"
  task_definition = "${aws_ecs_task_definition.task.arn}"
  desired_count   = 1

  load_balancer = {
    target_group_arn = "${aws_alb_target_group.main.arn}"
    container_name   = "blog"
    container_port   = 80
  }

  launch_type = "FARGATE"

  network_configuration {
    security_groups = ["${aws_security_group.awsvpc_sg.id}"]
    subnets         = ["${module.vpc.private_subnets}"]
  }

  depends_on = ["aws_alb_listener.main"]
}
