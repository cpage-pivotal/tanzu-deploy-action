tanzu build config --build-plan-source-type=file --build-plan-source ${BUILD_PLAN_SOURCE} --containerapp-registry ${CONTAINER_REGISTRY@L}
tanzu app config build non-secret-env set BP_JVM_VERSION=${JAVA_VERSION}

tanzu build --output-dir /tanzu-build
