nohup java -jar /home/ubuntu/java-maven-junit-helloworld-2.0-SNAPSHOT.jar > /home/ubuntu/log.txt 2>&1 &
echo $! > /home/ubuntu/pid.file
