.PHONY: validate
validate:
	docker build -t docker-api-reference-yamllint -f dockerfiles/Dockerfile.yamllint dockerfiles/
	docker run -v `pwd`:/code docker-api-reference-yamllint swagger.yaml
	docker build -t docker-api-reference-swagger-tools -f dockerfiles/Dockerfile.swagger-tools dockerfiles/
	docker run -v `pwd`:/code docker-api-reference-swagger-tools swagger.yaml

swagger.json: swagger.yaml validate
	python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < swagger.yaml > swagger.json
