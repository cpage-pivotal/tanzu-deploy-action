tanzu build config --build-plan-source-type=ucp --containerapp-registry $CONTAINER_REGISTRY
tanzu project use $PROJECT
tanzu space use $SPACE

tanzu deploy -y
