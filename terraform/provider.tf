// Configure the Google Cloud provider
provider "google" {
    credentials = "${file("terraform-account.json")}"
    project     = "my-project-012345" // change here
    region      = "us-west1"
}