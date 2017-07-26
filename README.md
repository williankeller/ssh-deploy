# SSH Deploy #

### A simple tool to automate the deploy with in a SSH server using GIT. ###

* version: 1.0

### How do set up? ###

* Clone this repository;
* Copy the file *deploy.config.bash.dist* to *deploy.config.bash* and set up the variables;

### Variables description ###

* \_DEPLOY_APP_SERVER_DIR - Path inside the server where the script will checkout your git branch or tag.
* \_DEPLOY_SERVER         - SSH server address.
* \_DEPLOY_REPO_REMOTE    - Remote repository configured in your git, **origin** is commonly used.
* \_DEPLOY_PROJECT_DIR    - Your local repository full path.

### How do I use? ###

* You can run with a parameter to deploy a specific git tag or branch. Example: **./deploy.sh <branch tag>**;
* Or just run **./deploy.sh**, the script will auto create a release tag like: _release-DATE_), push it and checkout in your server;
* If the tag already exists the script will increment a number at the end release tag, just like: _release-DATE.1_.
