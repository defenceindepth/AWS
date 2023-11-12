output "production_group_arn" {
  value = aws_iam_group.production_group.arn
}

output "lolu_user_arn" {
  value = aws_iam_user.lolu_user.arn
}

output "desola_user_arn" {
  value = aws_iam_user.desola_user.arn
}
