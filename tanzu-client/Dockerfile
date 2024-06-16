FROM docker:dind

ENV TANZU_CLI_CEIP_OPT_IN_PROMPT_ANSWER no

RUN wget https://github.com/vmware-tanzu/tanzu-cli/releases/download/v1.3.0/tanzu-cli-linux-amd64.tar.gz -O /tmp/tanzu.tar.gz
RUN tar -xvf /tmp/tanzu.tar.gz -C /tmp
RUN install /tmp/v1.3.0/tanzu-cli-linux_amd64 /usr/local/bin/tanzu
RUN tanzu config eula accept
RUN tanzu plugin install --group vmware-tanzu/app-developer



