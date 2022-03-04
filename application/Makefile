dockerfile = weather-app-dockerfile
img_name = $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO_NAME)
export AWS_ACCOUNT_ID
export AWS_REGION 
export ECR_REPO_NAME

.PHONY: build_and_tag_docker_image
build_and_tag_docker_image:
	@echo "\033[32;1;4mBuilding and tagging docker image.....\n\033[0m"
	docker build -t ${img_name}:latest -f ${dockerfile} .
	@echo "\033[32;1;4m\nSuccessfully created the docker image:\n${img_name}\033[0m"

.PHONY: ecr_login
ecr_login:
	@echo "\033[32;1;4mLogging into Amazon ECR.....\n\033[0m"
	aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.$(AWS_REGION).amazonaws.com
	@echo "\033[32;1;4mSuccessfully logged into Amazon ECR in AWS Account:\n${AWS_ACCOUNT_ID}033[0m"

.PHONY: push_docker_image
push_docker_image:
	@echo "\033[32;1;4mPushing docker image to Amazon ECR.....\n\033[0m"
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest 
	@echo "\033[32;1;4m\nSuccessfully pushed the docker image ${img_name} to the Amazon ECR repository:\n${ECR_REPO_NAME}\033[0m"