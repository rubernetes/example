# Custom Operator Controller

This is a containerized Ruby script that creates a custom operator using the Rubernetes Gem and makes use of helm to deploy the operator into a kubernetes cluster.  The custom operator handles events callbacks for a custom resource definition (CRD) specified by `crd_group`, `crd_version`, and `crd_plural`. The script also has logging functionality using a logger exposed by the Rubernetes Gem.

# Getting Started

## Prerequisites

* [helm](https://helm.sh/)
* [docker](https://www.docker.com/)
* A Kubernetes cluster

## Usage

* Installing a clustered custom operator in a k8s cluster:

```sh
helm upgrade <release_name> ./helm-clustered -i                                                                    
```

* Installing a namespaced custom operator in a k8s cluster:  
```sh
helm upgrade -i --create-namespace <release_name> ./helm-namespaced -n <namespace>
```

The script will start the operator and listen for add, modify, and delete events on the specified custom resource definition.