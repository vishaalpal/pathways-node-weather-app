export COMPOSE_FILE
export AWS_ACCOUNT_ID
export AWS_REGION 
export ECR_REPO_NAME
COMPOSE_RUN_TERRAFORM = docker-compose -f docker-compose.yml -f $(COMPOSE_FILE) run --rm tf 
COMPOSE_RUN_BASH = docker-compose -f docker-compose.yml -f $(COMPOSE_FILE) run --rm --entrypoint bash tf
COMPOSE_RUN_AWS = docker-compose -f docker-compose.yml -f $(COMPOSE_FILE) run --rm --entrypoint aws tf
dockerfile = weather-app-dockerfile
img_name = $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO_NAME)
yellow_txt = \033[33;1;3m
green_txt = \033[32;1;3m
colour_suffix = \033[0m

.PHONY: run_plan
run_plan: init plan

.PHONY: run_apply
run_apply: init apply

.PHONY: run_destroy_plan
run_destroy_plan: init destroy_plan

.PHONY: run_destroy_apply
run_destroy_apply: init destroy_apply

.PHONY: version
version:
	$(COMPOSE_RUN_TERRAFORM) --version
	
.PHONY: init
init:
	$(COMPOSE_RUN_TERRAFORM) init -input=false
	-$(COMPOSE_RUN_TERRAFORM) validate
	-$(COMPOSE_RUN_TERRAFORM) fmt

.PHONY: plan
plan:
	$(COMPOSE_RUN_TERRAFORM) plan -out=tfplan -input=false

.PHONY: apply
apply:
	$(COMPOSE_RUN_TERRAFORM) apply "tfplan"

.PHONY: destroy_plan
destroy_plan:
	$(COMPOSE_RUN_TERRAFORM) plan -destroy

.PHONY: destroy_apply
destroy_apply:
	$(COMPOSE_RUN_TERRAFORM) destroy -auto-approve

.PHONY: list_bucket
list_bucket: 
	$(COMPOSE_RUN_AWS) s3 ls

.PHONY: build_and_tag_docker_image
build_and_tag_docker_image:
	@echo "${yellow_txt}Building and tagging docker image...\n${colour_suffix}"
	docker build -t ${img_name}:latest -f ${dockerfile} .
	@echo "${green_txt}Successfully created the docker image:\n${img_name}${colour_suffix}"

.PHONY: ecr_login
ecr_login:
	@echo "${yellow_txt}Logging into Amazon ECR...\n${colour_suffix}"
	aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.$(AWS_REGION).amazonaws.com
	@echo "${green_txt}Successfully logged into Amazon ECR in AWS Account:\n${AWS_ACCOUNT_ID}${colour_suffix}"

.PHONY: push_docker_image
push_docker_image:
	@echo "${yellow_txt}Pushing docker image to Amazon ECR...\n${colour_suffix}"
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest 
	@echo "${green_txt}Successfully pushed the docker image ${img_name} to the Amazon ECR repository:\n${ECR_REPO_NAME}${colour_suffix}"