# package-azure-active-directory

This repository contains modules for deploying and managing Azure Active Directory resources.


## Using a Terraform Module

To use a module in your Terraform templates, create a `module` resource and set its `source` field to the Git URL of
this repo. You should also set the `ref` parameter so you're fixed to a specific version of this repo, as the `master`
branch may have backwards incompatible changes (see [module sources](https://www.terraform.io/docs/modules/sources.html)).

For example, to use `1.0.0` of the `azure-function-app` module, you would add the following:

```hcl
module "function_app" {
  source = "git::git@github.com:quantum-sec/package-azure-functions.git//modules/azure-function-app?ref=1.0.0"

  // set the parameters for the azure-function-app module
}
```

_Note: the double slash (`//`) is intentional and required. It's part of Terraform's Git syntax (see [module sources](https://www.terraform.io/docs/modules/sources.html))._

See the module's documentation and `vars.tf` file for all the parameters you can set. Run `terraform get -update` to
pull the latest version of this module from this repo before running the standard  `terraform plan` and
`terraform apply` commands.


## Using Scripts & Binaries

You can install the scripts and binaries in the `modules` folder of any repo using the [Gruntwork Installer](https://github.com/gruntwork-io/gruntwork-installer).
For example, if the scripts you want to install are in the `modules/ecs-scripts` folder of the
https://github.com/gruntwork-io/module-ecs repo, you could install them as follows:

```bash
gruntwork-install --module-name "ecs-scripts" --repo "https://github.com/gruntwork-io/module-ecs" --tag "0.0.1"
```

See the docs for each script & binary for detailed instructions on how to use them.
