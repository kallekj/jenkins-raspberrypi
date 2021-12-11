FROM python:3.9.1-buster

WORKDIR ~/

RUN apt update & apt upgrade -y

RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -

RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

RUN apt update

RUN apt install openjdk-11-jdk -y

RUN apt install jenkins -y

CMD ["java", "-Xmx2048m", "-Xms2048m", "-jar", "/usr/share/jenkins/jenkins.war", "--webroot=/var/cache/jenkins", "--httpPort=8080", "--ajp13Port=-1"]

#CMD ls /etc/systemd/system/multi-user.target.wants/

