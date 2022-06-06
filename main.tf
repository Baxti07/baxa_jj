# I am creating dev users
resource "aws_iam_user" "user1" {
  name = "John"
}

resource "aws_iam_user" "user3" {
  name = "Jenkins"
}

resource "aws_iam_user" "user4" {
  name = "Baxtiyor"
}

# I am creating IAM group
resource "aws_iam_group" "group1" {
  name = "operations"
}
