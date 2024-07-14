tanzu build config --build-plan-source-type=ucp --containerapp-registry ${CONTAINER_REGISTRY@L} --build-plan-source $BUILD_PLAN_SOURCE
tanzu app config build non-secret-env set BP_JVM_VERSION=${JAVA_VERSION}

tanzu project use $PROJECT
tanzu space use $SPACE

tanzu deploy -y
