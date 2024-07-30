resource "aws_s3_bucket" "mybucket" {
  bucket = "super-aws-bucket-for-test-321"
}

resource "aws_s3_object" "myfile" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "myfile.txt"
  source = "~/Downloads/my_file.txt"
}