## ARM Template for Deploying Jenkins Master/Slave Cluster

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://raw.githubusercontent.com/mahendra-shinde/jenkins-cluster-arm-template/master/azuredeploy.json)
[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https://raw.githubusercontent.com/mahendra-shinde/jenkins-cluster-arm-template/master/azuredeploy.json)   



### Pre-Requisites:
* Azure Subscription
* Azure CLI or Azure Powershell Modules
* VSCode with ARM Extensions
* DOTNET Core SDK 3.1 Installed

### Manual Steps

1. Deploy this template on azure, using following commands:

    ```bash
    ### Please set following two variables 
    $ GROUPNAME=group001
    $ LOCATION=southeastasia
    ## create new resource group
    $ az group create -n $GROUPNAME -l $LOCATION
    ## download this git repository into current directory
    $ git clone https://github.com/mahendra-shinde/jenkins-cluster-arm-template.git
    $ cd jenkins-cluster-arm-template
    ## OPTIONAL: Override the parameters in azuredeploy.parameters.json
    $ nano azuredeploy.parameters.json
    ## Make the changes and press CTRL+X then ENTER (twice) to save and quit
    ## TEMPLATE VALIDATION
    $ az group deployment validate -g $GROUPNAME --template-file azuredeploy.json --parameters @azuredeploy.parameters.json --debug
    ## Fix the errors if any !
    ## Actual Deployment 
    $ az group deployment create -g $GROUPNAME --template-file azuredeploy.json --parameters @azuredeploy.parameters.json 
    $ az resource list -o table -g $GROUPNAME
    ```

2.  Once the cluster is ready, start the post-installation steps on jenkins cluster.

3.  Start the Jenkins Master VM and access the the URL 

    http://JENKINSMASTERDNS:8080/

    > DONT FORGET to replace `JENKINSMASTERDNS` with actual DNS.

3.  You need to enter Initial Password which is stored in a text file. Web page must show the file path in red text. Just copy that path.

4.  Create a remote ssh session (Use PuTTY or Ubuntu Bash or Git Bash)
    And enter following command to get the initial password.

    ```bash
    $ sudo cat PASTE-PATH-HERE
    ```
    > You need to PASTE the path you have copied from web browser in here.

5.  Copy the content of file displayed by `cat` command.
    And paste this password in jenkins web-page. Click continue button and then use `Install Suggested Plugins`

6.  After Plugin Installation, it should then ask for New User creation. Create a new user (Admin) for regular login into jenkins dashboard. 

7.  After User creation, continue to dashboard.

