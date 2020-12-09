SHELL=/bin/sh -e

CHART_VERSION := $(shell grep '^version:' $(PWD)/Chart.yaml | awk '{print $2}')
IS_CHART_INDEXED := $(strip $(shell grep '$(CHART_VERSION)' $(PWD)/index.yaml | awk '{print $2}'))

.PHONY: release
release:
	@echo "${CHART_VERSION}"
ifndef IS_CHART_INDEXED
	@echo -e "Missing chart.\U2388 Indexing new Chart ${CHART_VERSION}"
	helm package ../qe-commons-charts/
	helm repo index --url https://pjgg.github.io/helm-charts-parent/ --merge index.yaml .
endif
	@echo "done!"

	

