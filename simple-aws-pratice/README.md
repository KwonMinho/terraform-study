
# Configure AWS access keys


```
export AWS_ACCESS_KEY_ID=(액세스 키 id
export AWS_SECRET_ACCESS_KEY=(시크릿 액세스 키)
```


# 2. 

## 2.1 provider 

첫번째 단계에서는 공급자를 구성하는 것

main.tf
```tf
# aws 공급자를 사용해서 배포한다는 것
# region은 us-east-2
provider "asw" {
    region = "us-east-2"
}
```

```sh
terrafomr init
```

output: <br>
 .terrafrom ~~~ /darwin_amd64/terraform-provider-aws_v4.49.0_x5 관련 바이너리 파일 생김

## 2.2 add ec2 resource

main.tf
```tf

...

resource "aws_instance" "ec2-server" {
    // AWS MACHINE ID
    ami = "ami-0c55b159cbfafe1f0"

    instance_type = "t2.micro"
}
```


```sh
terraform init
```

output: <br>
.terrafrom.lock.hcl 파일 생성