# Setup Windows Node

1. Create a Windows Server 2012/2016/2019 DataCenter VM in same virtual network as jenkins master.
2. Connect to Windows VM using RDP
3. Once inside the VM, run following powershell script to install pre-requisites:

    ```pwsh
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    choco install -y jdk8 maven git
    choco install microsoft-build-tools -y
    ```

3.  Go back to Jenkins dashboard, goto "Manage Jenkins" > "Manage Node and Cloud" > New Node

    ```yaml
    Name: node-2
    # of executors: 2 (Should equal to number of CPUs)
    Remote root directory: C:\jenkins
    Usage: Use this node as much as possible
    Launch Method: Launch agent by connecting it to the master
    Check the Web Socket
    ```

4.  Click Save button and then click on "Node-2" in list of nodes to get Launch instructions.
    Copy the SECOND command line to a new notepad (We will use it on windows node)

5.  Download "agent.jar" by using the hyperlink.

6.  Using RDP Connection, Copy the downloaded "agent.jar" into your home directory (eg c:\users\mahendra)
    In case, not allowed to copy over RDP, use following powershell command:
    ```pwsh
    $ wget -outfile agent.jar http://52.230.121.195:8080/jnlpJars/agent.jar
    $ mkdir C:\jenkins
    ``

7.  Use command prompt to launch jenkins client (Build Agent) 
    The command is copied from step #4. Following is SAMPLE, please DO NOT USE
    ```
    java -jar agent.jar -jnlpUrl http://52.230.121.195:8080/computer/node-2/slave-agent.jnlp -secret c33ffcd4849b7ed0b910b93083b26c11c9fe5911465a2eeb9e4663f7a9b108e2 -workDir "C:\jenkins"
    ```

8.  Go back to Jenkins Dashboard > Manage Jenkins > Manage Nodes 
    Check the status of Node-2

9.  Modify the "Job-1" to make it run on "node-2"

    If try "Build Now" it fails due to "Execute Shell" step
    
    Modify the project and delete old build step "Execute shell" and add new step "Execute Windows Batch script"
    The script should be:

    ```cmd
    echo "Hello World"
    echo "Building %BUILD_ID% for JOB %JOB_NAME%"
    ```
10. Configure the tools

    Visit Node Configuration page for node-2 using URL similar to
    http://JENKINS-MASTER-IP:8080/computer/node-2/configure

11. Check option "Tool Locations"
    ```
    Name: Git
    HOME: C:\Program Files\Git\bin\git.exe

    Name: JAVA8
    HOME: C:\Program Files\Java\jdk1.8.0_211

    Name: M2
    HOME:  C:\ProgramData\chocolatey\lib\maven\apache-maven-3.6.3\
    ```

12. Click "Save" Button