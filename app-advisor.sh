curl -L -H "Authorization: Bearer $ARTIFACTORY_TOKEN" -o advisor-cli.tar -X GET https://packages.broadcom.com/artifactory/spring-enterprise/com/vmware/tanzu/spring/application-advisor-cli-linux/0.0.8/application-advisor-cli-linux-0.0.9.tar
tar -xf advisor-cli.tar --strip-components=1 --exclude=./META-INF -C /tmp
install /tmp/advisor /usr/local/bin/advisor

advisor build-config get
advisor build-config publish --url=${APP_ADVISOR_SERVER}
advisor upgrade-plan apply --push --from-yml --url=${APP_ADVISOR_SERVER}