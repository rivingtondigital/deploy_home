# default_role.tf

resource "aws_iam_role" "default_role" {
  name = "${var.project_domain}-role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

  
resource "aws_iam_policy" "policy" {
  name        = "${var.project_domain}-route53-policy"
  description = "give route53 access to instance for letsencrypt dns"
  
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "route53:ListHostedZones",
                "route53:GetChange"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect" : "Allow",
            "Action" : [
                "route53:ChangeResourceRecordSets"
            ],
            "Resource" : [
                "arn:aws:route53:::hostedzone/Z125YGKA7OYJSF"
            ]
          }
      ]
  }
  EOF
}

# This is a really terrible idea :/ can != should

resource "aws_iam_role_policy_attachment" "route53_attach" {
  role        = aws_iam_role.default_role.name
  policy_arn  = aws_iam_policy.policy.arn 
}

