terraform {
    backend "s3" {
        bucket = "terraform-app-learning"
        key = "statefile/website-statefile.tfstate"
        region = "us-west-2"
    }
}