## First Maven Job

- Source Code Management
    Git:  https://github.com/mahendra-shinde/ci-servlet-demo

- Build Triggers: NONE
- Build Enviornment: Abort Build if it's stuck 
    Time Strategy: Absolute
    Timeout Minutes: 5 
- Add timestamp to console
- Build
    Invoke Top Level Maven Target
        Maven version: M2
        Goal: package
- Post Build
    Archive the artefacts
        Files to Archive: target/*.war

The Job configuration is actually stored in XML file "[JOB-NAME]/config.xml" inside "JenkinsMASTER"
Full path on my jenkins master is:
/var/lib/jenkins/jobs/java-webapp/config.xml

TRY THIS COMMAND TO READ ABOVE FILE:
sudo cat /var/lib/jenkins/jobs/java-webapp/config.xml