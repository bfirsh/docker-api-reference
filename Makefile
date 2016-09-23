.PHONY: validate
validate:
	docker build -t docker-api-reference-yamllint -f Dockerfile.yamllint .
	docker run -v `pwd`:/code -w /code docker-api-reference-yamllint yamllint swagger.yaml
	docker build -t docker-api-reference-swagger-tools -f Dockerfile.swagger-tools .
	docker run -v `pwd`:/code -w /code docker-api-reference-swagger-tools swagger-tools validate swagger.yaml

swagger.json: swagger.yaml validate
	python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < swagger.yaml > swagger.json
