---
name: flink-oss-setup
description: Guided setup for Apache Flink OSS locally using Kubernetes Operator. Use this skill to orchestrate the creation of local Flink Docker images, setup Minikube/Kubernetes environments, and deploy the Flink Kubernetes Operator with version-specific configurations.
---

# Flink OSS Setup Skill

This skill provides a dynamic workflow to set up Apache Flink locally using the Flink Kubernetes Operator (FKO). It handles version-specific logic by fetching assets directly from the official `flink-docker` repository.

## Workflow

### 1. Version Selection
Begin by asking the user which versions of Flink and the Flink Kubernetes Operator they wish to use. 
- **Flink Version**: e.g., `1.18`, `2.0`
- **Operator Version**: e.g., `1.14.0`
- **Action**: Ask if they want to build a **local image** (from source or using a custom entrypoint) or **pull** a specific one from a registry.

### 2. Fetching Docker Assets
Clone the official `flink-docker` repository to a temporary directory to retrieve version-specific `docker-entrypoint.sh` and `Dockerfile` templates.

```bash
# Example extraction logic
TMP_DIR=$(mktemp -d)
git clone https://github.com/apache/flink-docker "$TMP_DIR"
# Navigate to the specific version directory within $TMP_DIR
```

### 3. Local Image Build (Optional)
If a local image is requested:
- Configure Minikube to use the local Docker daemon: `eval $(minikube -p minikube docker-env)`.
- Apply version-specific patches (especially for Flink 2.0+ which uses `config.yaml` instead of `flink-conf.yaml`).
- Build the image: `docker build -t flink:local .`.

### 4. Kubernetes Environment Setup
- **Minikube**: Ensure it's running with sufficient resources (recommended: 6 CPUs, 8GB RAM).
- **Helm**: Add the Flink Operator repo and install the operator.
- **Flink 2.0+ Patch**: If using Flink 2.0+, patch the operator's ConfigMap to use the `YAML` configuration format:
  ```bash
  kubectl patch configmap flink-operator-config --type merge -p '{"data":{"kubernetes.operator.flink.configuration.format":"YAML"}}'
  kubectl rollout restart deployment flink-kubernetes-operator
  ```

### 5. Deployment
Generate and apply a `FlinkDeployment` YAML. Ensure it matches the chosen Flink version's configuration schema.

## Troubleshooting
- Check `kubectl logs` for the operator or the Flink pods.
- Verify `FLINK_CONF_DIR` if `IllegalConfigurationException` occurs.
