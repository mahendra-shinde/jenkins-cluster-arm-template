wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt update -y
apt install openjdk-8-jdk -y
apt install jenkins -y
systemctl enable jenkins
apt install maven -y