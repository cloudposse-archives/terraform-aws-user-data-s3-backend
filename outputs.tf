output "user_data" {
  value       = "${data.template_file.default.rendered}"
  description = "User data script that should be executed on startup"
}

output "policy_arn" {
  value       = "${aws_iam_policy.default.arn}"
  description = "User data script iam policy that should be executed on startup"
}
