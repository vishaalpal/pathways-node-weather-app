DOCKERFILE = weather-app-dockerfile
export AWS_ACCOUNT_ID
export AWS_REGION 
export ECR_REPO_NAME

.PHONY: build_docker_image
build_docker_image:
	docker build -f $(DOCKERFILE) .

.PHONY: tag_docker_image
tag_docker_image:
	docker tag $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO_NAME):latest 

.PHONY: ecr_login
ecr_login:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

.PHONY: push_docker_image
push_docker_image:
	docker push $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO_NAME):latest 
