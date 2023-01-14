
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

# 3. variable

```tf
variable "NAME"
 [config...]
```

```tf
# config
description: 이 변수에 대한 설명(팀한테 공유)
type: 유형 제약 조건 (지정하지 않아도 됨,그러나 any로 판단됨) - string, number, bool, list, map, set, object, tuple
default: 변수에 값을 전달하는 방법은 다양함 (만약 값이 전달되지 않으면, 해당 기본 값을 사용됨)
    - 명령줄로 보내거나(-var)
    - 선언된 파일로 보내거나(-var-file)
    - 환경 변수로 보내거나(TF_VAR_<variable_name>
```

```tf
variable "list_example" {
    description = "An example of a numeric list in Terraform"
    type = list(number)
    default = [1,2,3]
}
```

```tf
variable "object_example" {
    description = "An example of structural - 제약조건 에러 출력"
    type = object({
        name = string
        age  = number
        tags = list(string)
        enabled = bool
    })
    default = {
        name = "n1"
        age = 42
        tags = ["a", "b", "c"]
        enabled = true
    }
}
```
### 3.1 변수 참조

변수 참조하는 방법
```
var.<VARIABLE_NAME>
```

## 4. output

```
output "<NAME>" {
    value = <VALUE>
    [config...]
}
```

## 참조 사이트

리소스간의 종속성에 대한 데이터 값을 그래프 형태로 보여주는 웹 사이트: http://viz-js.com/
