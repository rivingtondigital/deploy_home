# sqs.tf

resource "aws_sqs_queue" "rescan_q"{
  name                        = "post_rescan"
  message_retention_seconds   = 1209600
}


