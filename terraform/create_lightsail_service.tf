# lightsailを利用するための設定
terraform {
  required_providers {
    awslightsail = {
      source = "deyoungtech/awslightsail"
    }
  }
}

# リージョンを、アジアパシフィック(東京)に設定
provider "awslightsail" {
  region = "ap-northeast-1"
}

# lightsail containerを作成
resource "aws_lightsail_container_service" "my_container" {
  name        = "container-service-1"
  power       = "micro"
  scale       = 1
}