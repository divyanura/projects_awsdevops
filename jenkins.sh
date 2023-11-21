#!/bin/bash
sudo hostnamectl set-hostname "jenkins.cloudbinary.io"
echo "`hostname -I | awk '{ print $1 }'` `hostname`" >> /etc/hosts
sudo apt-get update
sudo apt-get install git wget unzip curl tree -y
sudo apt-get install openjdk-17-jdk -y
sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"
echo "JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/" >> /etc/environment
 apt-get install maven -y
 cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"
echo "MAVEN_HOME=/usr/share/maven" >> /etc/environment
source /etc/environment
wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
 apt-get update
 apt-get install -y jenkins
 systemctl start jenkins
 systemctl enable jenkins