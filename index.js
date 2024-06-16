import {exec} from "child_process";

const core = require('@actions/core');
const tc = require('@actions/tool-cache');

const url = "https://github.com/vmware-tanzu/tanzu-cli/releases/download/v1.3.0/tanzu-cli-linux-amd64.tar.gz";

export async function setup() {
    // Get version of tool to be installed
    const version = core.getInput('version');

    console.log( "Downloading tool" );
    // Download the specific version of the tool, e.g. as a tarball
    const pathToTarball = await tc.downloadTool(url);
    console.log( "Path to tarball: " + pathToTarball)

    console.log( "Extracting tar" );
    // Extract the tarball onto the runner
    const pathToCLI = await tc.extractTar(pathToTarball);
    console.log( "Path to CLI:" + pathToCLI );

    console.log("Adding to path");
    // Expose the tool by adding it to the PATH
    core.addPath(pathToCLI + "/v1.3.0")
}

export async function run() {

    try {
        await setup()
    } catch (error) {
        if (/\bprocess\b.+\bfailed\b/.test(error.message)) {
            core.setFailed(error.message)
        } else {
            core.setFailed(error.stack)
        }
    }

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
}

run()
