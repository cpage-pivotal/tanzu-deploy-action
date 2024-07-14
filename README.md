# Tanzu Deploy Action for Github Workflows

### About

Github Action to deploy your application to Tanzu Platform for Kubernetes

![tanzu-deploy-action](images/preview.png)

### Prerequisites

To use this action with your application, you must have the following:

**Tanzu API Token.** Generate a token that the action will use to authenticate with Tanzu Platform. See [How to generate a Tanzu API Token](tanzu-api-token.md).

**ContainerApp configuration.** In the root of your application directory, run `tanzu app init` to generate a default configuration in the `.tanzu/config` subfolder. If you want to deploy other resources with your application, like an `HttpRoute`, add those to the `.tanzu/config` directory. Be sure to commit these resources to Git.

### Create the workflow secret

You can create your secrets at the repo or organization level for use with your Github Workflow. Here are the steps for creating at the repo level:

From your source repo, click on Settings, and select Secrets and Variables / Actions

![Secrets](images/secrets.png)

Using the "New Repository Secret" button, generate a secret with the following name:

* **TanzuApiToken**: The API Token that you generated in the Prerequisites<br>


### Set up the Github Workflow

In the root of your source code repo, create the workflow file `.github/workflows/tanzu-deploy.yaml`. Copy the contents of the [Sample Workflow](sample-workflow.yaml) into this file.

Replace the fields marked `<<ENTER VALUE>>` with your own values:
* `container_registry:` Complete the registry name by appending the image name for your app (e.g. `ghcr.io/${{ github.actor }}/my-app`)
* `project:` Enter the name of the Tanzu Platform project where you will be publishing ([Docs](https://docs.vmware.com/en/VMware-Tanzu-Platform/services/create-manage-apps-tanzu-platform-k8s/getting-started-set-up-infra.html#create-project))
* `space:` Enter the name of the Tanzu Platform space where you will be publishing ([Docs](https://docs.vmware.com/en/VMware-Tanzu-Platform/services/create-manage-apps-tanzu-platform-k8s/getting-started-create-app-envmt.html#create-a-space-in-your-project))

**(Optional)** If you have a custom build plan set up in your target project, you can uncomment and set the `buildPlanSource` field. This can be used to perform post-build steps like [automatically generating and HTTPRoute](https://github.com/warroyo/custom-http-route-task/tree/main).
**(Optional)** If you are building a Java application, and want to override the JVM version used by the Java buildpack, you can uncomment and set the `javaVersion` field.

### Run the workflow

Commit your changes to Github. This will trigger a run of the workflow. You can track progress of the workflow under the Actions tab of your repo.

### Package visibility

The container image you deploy to ghcr needs to have public visibility for Tanzu Platform to read and deploy it (or else you need to configure Tanzu Platform with your ghcr credentials).

If your repo/organization publishes the image as private, [follow these instructions](https://docs.github.com/en/packages/learn-github-packages/configuring-a-packages-access-control-and-visibility#configuring-visibility-of-packages-for-your-personal-account) to make it public.
