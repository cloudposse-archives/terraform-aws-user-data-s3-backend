output "user_data" {
  value = "${data.template_file.default.rendered}"
}

output "policy_arn" {
  value = "${aws_iam_policy.default.arn}"
}
