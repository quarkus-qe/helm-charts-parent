# QE Commons Charts

This project is a common charts, that allows us to share Helm charts templates between several projects. 

## How to use it

Chart: `qe-quarkus-app`  

Example: 

```
apiVersion: v1
description: Catalog Storage Service
name: catalog-storage-service
version: 0.0.2
dependencies:
  - name: qe-quarkus-app
    version: 0.0.1
    repository: http://quarkus-qe.github.io/helm-charts-parent
```

Where `qe-quarkus-app` is the name of this parent chart, released on github pages. 
If you are gonna use it, don't forget to add this repo to your helm repositories list.

```bash
$ helm repo add qe-quarkus http://quarkus-qe.github.io/helm-charts-parent
```
## How to push a new parent Chart Release

Once you finish with your changes, upgrade your chart by running the following command:

```bash
$ make release
```

## Before you begin

### Prerequisites
- Helm 3+
- Makefile

### Install Helm

Helm is a tool for managing Openshift/k8s charts. Charts are packages of pre-configured Openshift resources.

To install Helm, refer to the [Helm install guide](https://github.com/helm/helm#install) and ensure that the `helm` binary is in the `PATH` of your shell.