SHELL=/bin/sh

re-generate:
	rm -rf index.yaml && rm -rf *.tgz
	helm package ../qe-commons-charts/
	helm repo index --url https://pjgg.github.io/helm-charts-parent/  .
	

