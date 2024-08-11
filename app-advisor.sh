curl -L -H "Authorization: Bearer $ARTIFACTORY_TOKEN" -o /tmp/advisor-cli.tar -X GET https://packages.broadcom.com/artifactory/spring-enterprise/com/vmware/tanzu/spring/application-advisor-cli-linux/0.0.9/application-advisor-cli-linux-0.0.9.tar
tar -xf /tmp/advisor-cli.tar --strip-components=1 -C /tmp
install /tmp/advisor /usr/local/bin/advisor

cat $(date) > .gitkeep

advisor build-config get
advisor build-config publish --url=${APP_ADVISOR_SERVER}
advisor upgrade-plan get --url=${APP_ADVISOR_SERVER}
advisor upgrade-plan apply --push --from-yml --url=${APP_ADVISOR_SERVER}