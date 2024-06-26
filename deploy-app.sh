if [[ -z "${BUILD_PLAN_SOURCE}" ]]; then
  tanzu build config --build-plan-source-type=ucp --containerapp-registry ${CONTAINER_REGISTRY@L}
else
  tanzu build config --build-plan-source-type=ucp --containerapp-registry ${CONTAINER_REGISTRY@L} --build-plan-source $BUILD_PLAN_SOURCE
fi

tanzu project use $PROJECT
tanzu space use $SPACE

tanzu deploy -y
