STACK_NAME = github-self-hosted-runners-ecs

up:
	aws cloudformation create-stack --stack-name $(STACK_NAME) --template-body file://cfn-ecs-stack.yml

down:
	aws ecs delete-service --cluster github-runners-cluster --service github-runners-service --force
	aws cloudformation delete-stack --stack-name (STACK_NAME)
