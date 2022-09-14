build-images:
	docker build -t quay.io/pmacik/sbo-gitops-pipeline:ubi8-base -f base.Dockerfile .

push-images:
	docker push quay.io/pmacik/sbo-gitops-pipeline:ubi8-base

deploy-pipelines:
	for i in pipelines/*.yaml; do oc apply -f $$i; done

deploy-tasks:
	for i in tasks/*.yaml; do oc apply -f $$i; done

deploy-resources:
	for i in resources/*.yaml; do oc apply -f $$i; done

deploy-triggers:
	for i in triggers/*.yaml; do oc apply -f $$i; done

deploy-secrets:
	for i in secrets/*.yaml; do oc apply -f $$i; done

deploy-all: deploy-resources deploy-secrets deploy-tasks deploy-pipelines deploy-triggers