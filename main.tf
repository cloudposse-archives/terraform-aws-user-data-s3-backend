# Define composite variables for resources
module "label" {
  source    = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.2.1"
  namespace = "${var.namespace}"
  name      = "${var.name}"
  stage     = "${var.stage}"
  attributes = ["s3", "stored"]
}

data "template_file" "default" {
  template = "${file("${path.module}/user_data.sh")}"

  vars {
    s3_path = "${aws_s3_bucket_object.default.bucket}/${aws_s3_bucket_object.default.key}"
  }
}

resource "aws_s3_bucket_object" "default" {
  bucket  = "${var.bucket}"
  key     = "${var.path}/user_data.sh"
  content = "${join("\n", var.user_data)}"
  etag    = "${md5(join("\n", var.user_data))}"
}

## IAM Role Policy that allows access to S3
resource "aws_iam_policy" "default" {
  name = "${module.label.id}"

  lifecycle {
    create_before_destroy = true
  }

  policy = "${data.aws_iam_policy_document.default.json}"
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "s3:ListAllMyBuckets",
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [ "s3:ListBucket" ]

    effect = "Allow"

    resources = "${format("arn:aws:s3:::%v", aws_s3_bucket_object.default.bucket)}"
  }

  statement {
    actions = [ "s3:*" ]

    effect = "Allow"

    resources = [
      "${format("arn:aws:s3:::%v/%v", aws_s3_bucket_object.default.bucket, aws_s3_bucket_object.default.key)}",
      "${format("arn:aws:s3:::%v/%v/*", aws_s3_bucket_object.default.bucket, aws_s3_bucket_object.default.key)}",
    ]
  }
}