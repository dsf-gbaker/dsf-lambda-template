# DSF Lambda Template
A template project for creating GO lambdas

## How to Use This Template
- Create a new repo based off this template
- Edit the `src/main.go` file
  - Change the name of the `DoSomething` function
  - Add your custom logic
- Edit the `iac/main.tf` file
  - Uncomment the backend storage block
  - Update the `key` property by replacing `<my-lambda-name>`
- Edit the `iac/lambda.tf`
  - Change the resource names and references as necessary

> You shouldn't need to change the `src/build.ps1` script
> 
> This project assumes your lambda's primary entry point
> is the main function and assuming you don't change that
> everything should just work

## Usage PreRequisite(s)

- go v1.17.x
- *build-lambda-zip* tool
  - `go.exe get -u github.com/aws/aws-lambda-go/cmd/build-lambda-zip`
- Terraform

## Compile & Deploy Steps

- Open Powershell prompt in the `src` folder
  - `./build.ps1`
- In powershell, navigate to the `iac` folder
  - `terraform apply`
