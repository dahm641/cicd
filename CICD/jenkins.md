# How to make a jenkins server
1. Create an ubuntu instance on AWS (22.04)
2. Use the following script obtained from the Jenkins website to install java and jenkins
    ```bash
    #!/bin/bash
    sudo apt update -y
    sudo apt install fontconfig openjdk-17-jre -y
    java -version
    
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
      https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
      https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
      /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install jenkins -y
    ```
3. Connect to it using the public ip and adding `:8080` to the end to connect to port 8080 where jenkins is run
4. You will be asked for admin password found on the server itself so SSH in and find it here <br>
   - `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
5. Once you have put in the psasword you can install packages (continue with suggested for now)
![img.png](img.png) <br><br>
6. Create an admin user <br><br>
![img_1.png](img_1.png) <br><br>
7. install needed plugins by going to manage jenkins and then plugins 
8. install node and ssh agent <br><br>
![img_5.png](img_5.png) <br><br>
![img_7.png](img_7.png) <br><br>
![img_4.png](img_4.png) <br><br>
9. go to tools and enable node.js installation <br><br>
![img_6.png](img_6.png) <br><br>
10. go to security and allow first time connections in git host key verification otherwise it wont connect <br><br>
![img_3.png](img_3.png) <br><br>

## Creating Jobs

1. Now that server is set up we can create our jobs 
2. We need to create 3 jobs:
   1. Job to test our app code from dev branch
   2. Job to merge dev branch to main branch after successful test
   3. ***optional*** Job to deploy server if merge was successful
   4. Job to deploy application to server if previous job was successful
3. Click here for how to set up the jobs

![img_2.png](img_2.png)




