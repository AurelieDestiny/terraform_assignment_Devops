provider "aws" {
  region = "us-east-1"

}
resource "aws_iam_user" "admin-user" {
  name = "Makell"
  tags = {
    Description = "project lead"
  }
}

resource "aws_iam_policy" "adminUser" {
  name = "AdministrativeUsers"
  policy = jsonencode({
   Version = "2012-10-17"
    Statement = [
      {
        Action = ["*",]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "Makell-admin-access" {
  users      = [aws_iam_user.admin-user.name]
  policy_arn = aws_iam_policy.AdministrativeUsers.arn
}
  
