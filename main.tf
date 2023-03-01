terraform {
required_providers{
aws = {
  source = "hashicorp/aws"
  version = "4.56.0"
}
azurerm = {
  source = "hashicorp/azurerm"
  version = "3.45.0"

}

}
}
 provider "aws" {
  region  = var.region
}
resource "aws_instance" "example" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
}

provider "azurerm" {
 features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}
