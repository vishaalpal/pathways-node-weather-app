dockerfile = weather-app-dockerfile
img_name = $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO_NAME)
green_txt_prefix = \033[32;1;4m
green_txt_suffix = \033[0m
export AWS_ACCOUNT_ID
export AWS_REGION 
export ECR_REPO_NAME

.PHONY: build_and_tag_docker_image
build_and_tag_docker_image:
	@echo "${green_txt_prefix}Building and tagging docker image.....\n${green_txt_suffix}"
	docker build -t ${img_name}:latest -f ${dockerfile} .
	@echo "${green_txt_prefix}Successfully created the docker image:\n${img_name}${green_txt_suffix}"

.PHONY: ecr_login
ecr_login:
	@echo "${green_txt_prefix}Logging into Amazon ECR.....\n${green_txt_suffix}"
	aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.$(AWS_REGION).amazonaws.com
	@echo "${green_txt_prefix}Successfully logged into Amazon ECR in AWS Account:\n${AWS_ACCOUNT_ID}${green_txt_suffix}"

.PHONY: push_docker_image
push_docker_image:
	@echo "${green_txt_prefix}Pushing docker image to Amazon ECR.....\n${green_txt_suffix}"
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest 
	@echo "${green_txt_prefix}Successfully pushed the docker image ${img_name} to the Amazon ECR repository:\n${ECR_REPO_NAME}${green_txt_suffix}"