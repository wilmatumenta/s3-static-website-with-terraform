# s3-static-website-with-terraform
Lets create a static website with S3 with terraform

1. Create an S3 bucket where the statefile will be stored and reference it in the backend.tf file
2. Create a provider.tf file
3. Create a variable.tf file with region and bucket name
4. Create an s3.tf file with the required code with the appropriate reference from variable.tf file
5. Initialise terraform with "terraform init"
6. To preview the resources to be create "terraform plan"
7. To deploy the resources finally to AWS "terraform apply"
8. To view the website, go to AWS console, then S3 bucket, select index.html and copy url and paste on a browser and WOW!!
9. The statefile will be stored in an S3 bucket
10. To destroy the resources "terraform destroy"
11. Don't forget to manually delete the statefile from your s3 bucket

