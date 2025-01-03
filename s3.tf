resource "aws_s3_bucket" "my-bucket" {
    bucket = "my-bucket-02012025"
    tags = {
        Name = "db bucket"
    }
}