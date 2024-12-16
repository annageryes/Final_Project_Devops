# Jenkins with Docker Compose

Jenkins docker compose file (and instructions) to configure your jenkins controller and agent.

## Configuring Jenkins


2. Create a file named **.env** and add the following:

   ```yml
    JENKINS_HOME_PATH=/home/user/project/.env # your absolute path for .env file

   ```

3. Run Jenkins controller:

   ```bash
   docker-compose up -d
   ```

4. Get the password to proceed installation:

   ```bash
   docker logs jenkins_sandbox | less
   ```

5. Go to <http://localhost:8080/> and enter the password.

6. Select **Install Suggested Plugins**, create the **admin** user and password, and leave the Jenkins URL <http://localhost:8080/>.





ansible playbook for deploy:
- bring up docker compose file
- configure agents
- copy keys


python or bash  to install ansible docker compose and trigger the playbook



 full_crumb=$(curl -u "admin:admin" --cookie-jar "$cookie_jar" $url/crumbIssuer/api/xml?xpath=concat\(//crumbRequestField,%22:%22,//crumb\))


CRUMB=$(curl -u "admin:admin"  "http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)" \
    --cookie-jar cookies.txt)
curl 'http://admin:admin@localhost:8080/user/admin/descriptorByName/jenkins.security.ApiTokenProperty/generateNewToken' --data 'newTokenName=1kb-token' -b cookies.txt -H $full_crumb

    {"status":"ok","data":{"tokenName":"kb-token","tokenUuid":"dd49a44c-ba30-4d91-a120-1b3685b385bc","tokenValue":"11c71171c7374c23b6bfb64d915776331e"}}

