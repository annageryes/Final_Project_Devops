# Jenkins with Docker Compose

Jenkins docker compose file (and instructions) to configure your jenkins controller and agent.

## Configuring Jenkins

1. Create the **jenkins_home** folder in your local environment

   ```
   mkdir jenkins_sandbox_home
   ```

2. Create a file named **.env** and add the following:

   ```yml
   JENKINS_HOME_PATH=/home/user/jenkins_sandbox_home # your local jenkins_home path.

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