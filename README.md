# HAZESOFT-T1
hazesoft assignment-1
- **Create a repo named as "HAZESOFT-T1" in git account.**
- **Install the Docker** in your system using the following command.
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
- Check the status whether Docker is enable or not using the following command
 sudo systemctl status docker. if running it gives the following output:
 ● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset>
     Active: **active (running)** since Wed 2024-01-03 07:43:11 +0545; 12min ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 1338 (dockerd)
      Tasks: 10
     Memory: 102.2M
     CGroup: /system.slice/docker.service
             └─1338 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/cont>


 - Create the Dockerfile inside the "hazesoft" directory using the following command.
 mkdir hazesoft
 cd hazesoft
 nano Dockerfile   
   
 - Then write the command.
 # Use alpine linux image
	FROM alpine:latest
 # Install nginx
	RUN apk update && apk add nginx
 # Clone the given repo
	RUN apk add git && git clone https://github.com/veekrum/task /tmp/task
 # Copy site folder to nginx document root
	RUN cp -r /tmp/task/site /usr/share/nginx/html
 # Expose port 9000
	EXPOSE 9000
 # Start nginx
	CMD ["nginx", "-g", "daemon off;"]
 - Save using Ctrl+X then Press Y and Press Enter.... Our Dockerfile is created..
 
 
 
 - Also create the hazesoftassignment.conf file and write the following command...
 
 server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }

    location /site/ {
        alias /usr/share/nginx/html/site/;
        index index.html;
    }
}

 
 
 - Now build and run by using the following command.

sudo docker build -t hazesoft-t1 .
sudo docker run -p 9000:80 hazesoft-t1

 Here, -t means tagname i.e hazesoft and "." represent the file is in current directory.
  -p 9000:80: Maps port 9000 on the host to port 80 on the container. This allows you to access the web server running inside the container at http://localhost:9000.
  hazesoft-t1: Specifies the name of the Docker image to be used for running the container.
