## Sign up on SonarCloud

1. Sign Up using GitHub account or BitBucket account

2. Use the right corner button "+" to create a new organisation & new project
    
    I have create "KEY101" (Organisation keys are globally unique)

    Project Creation URL https://sonarcloud.io/projects/create
    
    Select Organization Key from the first drop down >
    Enter Unique Project Key > Click Setup

    I have a project under "KEY101" called "PROJ101"

3.  Use the right corner button and goto "Account Settings"

    Goto Security > Generate Token (provide token name as "t1" )
    Copy the TOKEN value (secret) into a notepad windows


## Integration with SonarCloud

1.  Install new Jenkins Plugin "sonarqube scanner"
    
    Manage Jenkins > Manage Plugins > "Available" Plugins > Search for "Sonar Scanner"
    
    Click "Install without restart"


2.  Configure SonarScanner Home Directory

    Manage Jenkins > Global Tools Configuration > SonarQube Scanner
    
    Name: sonar
    HOME: /home/mahendra/sonar

3.  SSH into Master & Worker "node-1" and run following commands 

    ```
    $ cd /home/mahendra
    # sudo install -y unzip
    $ wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
    $ unzip sonar-scanner-cli-4.2.0.1873-linux.zip
    $ mv sonar-scanner-4.2.0.1873-linux/ sonar/
    ```
4.  RDP into Node-2 and follow these steps

    Download file https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-windows.zip
    Extract the contents into C:\users\mahendra\sonar
    Please make sure that C:\users\mahendra\sonar do contain folders like "bin" directly and there should not be addition folder "sonar-scanner-clixxxxxxxxxxxx".


5.  Add SonarCloud Server URL and ACCESS Token to Jenkins Configuration

    Manage Jenkins > Configure System > SonarQube Server

    Name: SonarCloud
    Server URL: https://sonarcloud.io
    Server Authentication token: Click ADD 
        Choose option "Secret Text" and paste the TOKEN created on SonarCloud.io
    Click Save

6.  Modify the "java-webapp" project (Jenkins Job)

    Add new "Build Step" "Execute SonarQube Scanner"
        
        JDK:    JAVA8

        Analysis Properties:
            sonar.projectKey=PROJ101
            sonar.projectName=PROJ101
            sonar.sources=src
            sonar.java.binaries=target
            sonar.organization=key101

7.  Build Project at least ONCE to check SonarCloud results