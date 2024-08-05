terraform {
    backend "s3" {
        bucket = "my-iquant-test-bucket"
        key = "dev/mystatefile/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
    }
}

