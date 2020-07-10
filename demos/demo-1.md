### Hello World JOB

1. Visit Jenkins Dashboard using URL `http://jenkins-master-ip:8080`

    My Jenkins Instance details:

    http://52.230.121.195:8080/

    Username: mahendra
    Password: password@1234

2. Click on "New Item" > Choose "FreeStyle Project" 
    Project Name: Job1
    Description: Sample Project to test node-1
    Build > Step:
        Execute Shell:
            
        ```
        echo "Hello World"
        echo "Building $BUILD_ID for JOB $JOB_NAME"
        ```
    Click "Save" Button

3.  Select the project "Job1" and Use button "Build Now"

4.  Click on Build Number (#1) in "Build History" and then click "Console Log" to view detailed log
