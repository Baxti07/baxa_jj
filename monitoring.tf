resource "aws_sns_topic_subscription" "ec2_sns_target" {
  topic_arn = aws_sns_topic.EC2_STATE.topic.arn
  protocol = "email"
  endpoint = "toshmamatov2000@gmial.com"
}

resource "aws_sns_topic" "EC2_STATE" {
  name = "EC2_STATE_CHANGE"
}

resource "aws_sns_topic_policy" "default" {
  arn = aws_sns_topic.EC2_STATE.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect = "Allow"
    actions = ["SNS:Publish"]
    principals {
      type = "Service"
      identifiers =["events.amazonaws.com"]
    }
    resources = [aws_sns_topic.EC2_STATE.arn]
  }
}