provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_group" "production_group" {
  name = "Production"
}

resource "aws_iam_user" "lolu_user" {
  name = "Lolu"
}

resource "aws_iam_user" "desola_user" {
  name = "Desola"
}

resource "aws_iam_group_membership" "lolu_membership" {
  name  = aws_iam_group.production_group.name
  users = [aws_iam_user.lolu_user.name]
  group = aws_iam_group.production_group.name
}

resource "aws_iam_group_membership" "desola_membership" {
  name  = aws_iam_group.production_group.name
  users = [aws_iam_user.desola_user.name]
  group = aws_iam_group.production_group.name
}

resource "aws_iam_user_policy_attachment" "lolu_admin_attachment" {
  user       = aws_iam_user.lolu_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "desola_admin_attachment" {
  user       = aws_iam_user.desola_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
terraform {
  backend "s3" {
    bucket         = "desolalolu-terraform-bucket"
    key            = "terraform.tfstate"
    region         = "your-aws-region"
    encrypt        = true
    dynamodb_table = "terraform_locks"
  }
}