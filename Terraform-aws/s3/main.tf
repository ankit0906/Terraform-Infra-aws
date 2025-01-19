



data "aws_canonical_user_id" "current_user" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "mybucket"

  grant {
    id          = data.aws_canonical_user_id.current_user.id
    type        = "CanonicalUser"
    permissions = ["FULL_CONTROL"]
  }

  grant {
    type        = "Group"
    permissions = ["*"]
    uri         = "http://acs.amazonaws.com/groups/s3/LogDelivery"
  }
}
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }





resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.bucket.id

}


resource "aws_dynamodb_table" "my_db_table" {
  name           = "my-terra-db-table"
  hash_key       = "LockId"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockId"
    type = "S"
  }

}
