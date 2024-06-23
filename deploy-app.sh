tanzu build config --build-plan-source-type=ucp --containerapp-registry $CONTAINER_REGISTRY
if [[ -z "${BUILD_PLAN_SOURCE}" ]]; then
  tanzu build config --build-plan-source-type=ucp --containerapp-registry $CONTAINER_REGISTRY
else
  tanzu build config --build-plan-source-type=ucp --containerapp-registry $CONTAINER_REGISTRY --build-plan-source $BUILD_PLAN_SOURCE
fi

tanzu project use $PROJECT
tanzu space use $SPACE

tanzu deploy -y
