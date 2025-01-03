module "dev-app" {
    source = "./aws-infrastructure"
    my-env = "dev"
    instance-type = "t2.micro"
    ami-id = "ami-0e2c8caa4b6378d8c"
    instance-count = 1
}

module "staging-app" {
    source = "./aws-infrastructure"
    my-env = "staging"
    instance-type = "t2.medium"
    ami-id = "ami-0e2c8caa4b6378d8c"
    instance-count = 1
}

module "prod-app" {
    source = "./aws-infrastructure"
    my-env = "prod"
    instance-type = "t2.large"
    ami-id = "ami-0e2c8caa4b6378d8c"
    instance-count = 2
}