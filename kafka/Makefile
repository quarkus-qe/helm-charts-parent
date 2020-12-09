SHELL=/bin/sh -e

CHART_VERSION := $(shell grep '^version:' $(PWD)/Chart.yaml | awk '{print $2}')
IS_CHART_INDEXED := $(strip $(shell grep '$(CHART_VERSION)' $(PWD)/../index.yaml | awk '{print $2}'))
CHART_NAME := $(notdir $(shell pwd))

.PHONY: release
release:
	@echo "${CHART_NAME} ${CHART_VERSION}"
ifndef IS_CHART_INDEXED
	@echo -e "Missing chart.\U2388 Indexing new Chart ${CHART_VERSION}"
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm dependency update
	helm package ../${CHART_NAME}/ -d ../releases/
	cd ../releases/ && helm repo index --url https://pjgg.github.io/helm-charts-parent/ --merge ../index.yaml ../
endif
	@echo "done!"

