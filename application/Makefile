DOCKERFILE = weather-app-dockerfile
export AWS_ACCOUNT_ID
export AWS_REGION 
export ECR_REPO_NAME

.PHONY: build_docker_image
build:
	docker build -t $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO_NAME):1 -f $(DOCKERFILE) .

.PHONY: ecr_login
login:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

.PHONY: push_docker_image
push:
	docker push $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO_NAME):1 
