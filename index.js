const core = require('@actions/core');
const tc = require('@actions/tool-cache');

const url = "https://github.com/vmware-tanzu/tanzu-cli/releases/download/v1.3.0/tanzu-plugins-admin-linux-amd64.tar.gz";

async function setup() {
    // Get version of tool to be installed
    const version = core.getInput('version');

    // Download the specific version of the tool, e.g. as a tarball
    const pathToTarball = await tc.downloadTool(url);

    // Extract the tarball onto the runner
    const pathToCLI = await tc.extractTar(pathToTarball);

    // Expose the tool by adding it to the PATH
    core.addPath(pathToCLI)
}

module.exports = setup

const { exec } = require("child_process");
const apiToken = core.getInput("tanzu_api_token");

exec("TANZU_API_TOKEN=" + apiToken + " tanzu login", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
});
