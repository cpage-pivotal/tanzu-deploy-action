export TANZU_CLI_CEIP_OPT_IN_PROMPT_ANSWER=no
wget https://github.com/vmware-tanzu/tanzu-cli/releases/download/v1.3.0/tanzu-cli-linux-amd64.tar.gz -O /tmp/tanzu.tar.gz
tar -xvf /tmp/tanzu.tar.gz -C /tmp
install /tmp/v1.3.0/tanzu-cli-linux_amd64 /usr/local/bin/tanzu
tanzu config eula accept
tanzu plugin install --group vmware-tanzu/app-developer

tanzu login