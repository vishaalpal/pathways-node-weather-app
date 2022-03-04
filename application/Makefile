dockerfile = weather-app-dockerfile
img_name = $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO_NAME)
export AWS_ACCOUNT_ID
export AWS_REGION 
export ECR_REPO_NAME

.PHONY: build_and_tag_docker_image
build_and_tag_docker_image:
	echo '::set-output name=SELECTED_COLOR::green'
	@echo "\nBuilding and tagging docker image.....\n"
	docker build -t ${img_name}:latest -f ${dockerfile} .
	@echo "\nSuccessfully created the docker image:\n${img_name}!"

.PHONY: ecr_login
ecr_login:
	echo '::set-output name=SELECTED_COLOR::green'
	@echo "\nLogging into Amazon ECR.....\n"
	aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.$(AWS_REGION).amazonaws.com
	@echo "\nSuccessfully logged into Amazon ECR in AWS Account:\n${AWS_ACCOUNT_ID}!"

.PHONY: push_docker_image
push_docker_image:
	echo '::set-output name=SELECTED_COLOR::green'
	@echo "\nPushing docker image to Amazon ECR.....\n"
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest 
	@echo "\nSuccessfully pushed the docker image ${img_name} to the Amazon ECR repository:\n${ECR_REPO_NAME}!"