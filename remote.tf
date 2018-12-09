terraform {
	backend "remote" {
		organization = "masa_org"

		workspaces {
			prefix = "jenkins_pipeline_"
		}
	}
}

provider "aws" {
  region     = "ap-northeast-1"
}

resource "aws_instance" "itmstm" {
  ami           = "ami-08847abae18baa040"
  instance_type = "t2.micro"

  # My security setting
  security_groups = ["${aws_security_group.default.name}"]
}

resource "aws_security_group" "default" {
  name        = "terraform_security_group"
  description = "Allow access to SSH port"
}
