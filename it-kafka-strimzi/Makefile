SHELL=/bin/sh -e

CHART_VERSION := $(shell grep '^version:' $(PWD)/Chart.yaml | awk '{print $2}')
CHART_NAME := $(notdir $(shell pwd))

.PHONY: release
release:
	@echo "${CHART_NAME} ${CHART_VERSION}"
	helm package ../${CHART_NAME}/ -d ../releases/
	cd ../releases/ && helm repo index --url https://quarkus-qe.github.io/helm-charts-parent/ --merge ../index.yaml ../
	@echo "done!"

