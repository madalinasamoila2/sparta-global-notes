# Docker video questions

### **Virtualisation & Containers**

1. What is virtualisation?
Virtualisation is the process of creating virtual machines of physical resources like servers, storage, and networks.

2. What is a hypervisor and what does it enable?
Hypervisor is a software that allows multiple virtual machines to run on a single machines. Also known as Virtualisation layer, it distibutes resources to each virtual machine.

3. How does virtualisation work?
Virtualisation is the process of creating virtual machines using virtualisation layer that distributes RAM/CPU/Storage across other virtual machines. ~somewhat correct

4. What does virtualisation actually do?
It enables efficient use of hardware by running multiple OS environments independently on one machine.

5. What are the disadvantages of virtualisation?
One main disadvantage is that you eventuall run out od processing power.

6. What is containerisation and how is it different from virtualisation?
Containerisation is similar to virtualisation but it doesn't contain virtual machines. It doesn't include a virtualisation layer, meaning it doesn't need an operating system, each application already has it built in. Instead it uses a docker which alreayd has code built it

7. Why would you choose containers over virtual machines?
Containers are quicker to start, uses fewer resources and it's more simple and efficient to use rather than code. Portability, Scalability, /Fault Tolerant, Agility.
* * *

### **Docker Basics**

8. What is a Docker image and how is it related to a container?
A docker image it's an application, a running instance of images.
An image is a snapshot of a container’s file system. Containers are running instances of images.

9. What does the command `docker run hello-world` do?
It runs a test container to confirm Docker is installed and working.

10. What does the `-it` flag do in `docker run -it ubuntu bash`?
It runs the ubuntu image using bash to communicate with it. -it just means interactively. *It opens an interactive terminal session inside the container.*

11. How do you list running Docker containers? What’s the difference when using the `-a` flag?
% docker ps, % docker ps -a lists all containers available that are not necessarily running. *Good*

12. How do you run an Ubuntu container in detached mode using Docker?
% docker run -d ubuntu *runs the container in the background*

13. How do you execute a command inside a running Docker container (e.g. check the current user)?
% whoami *`docker exec <container_id> whoami`*

14. How do you attach your terminal to a running Docker container?
----- *docker attach <container_id>`*

15. How do you stop a running Docker container?
% docker stop 4fb (first 3 letters of the container)
16. How do you remove a Docker container?
% docker rm 4fb or %docker rm -f 4fb (by force)

17. How do you list all Docker images available locally?
% docker images

18. How do you remove a specific Docker image (e.g. `ubuntu`)?
% docker rmi ubuntu

19. How do you force-remove a Docker image even if it’s in use?
% docker rmi -f ubuntu

* * *

### **Docker Registries & Repositories**

20. What is the local image registry in Docker?


21. What is DockerHub?
DockerHub is a repository for storing docker images

22. What does the command `docker pull nginx` do?
It downloads the latest Nginx image from DockerHub.

23. How do you run an Nginx container in detached mode?
`docker run -d nginx *Good*`
* * *

### **Networking & Port Mapping**

24. What is the OSI model in networking?

25. What is a network port?
Network port is a communication endpoint for a specifc process , it allows mapping between local and virtual machine. *A port is a communication endpoint for a specific process or service on a system.*

26. How does Docker handle port mapping?
`-p`

27. What does the command `docker run -d -p 5000:80 nginx` do?
docker runs this port mapping in detached mode with 5000 being the port for the host machine and 80 being the port for the container

28. How can you find out which port your Docker container is running on?
`docker ps`
* * *

### **File Management in Docker**

29. How do you copy a file from your local machine into a Docker container?
docker cp index.html my_website:usr/share/ngnix/html/index.html
cp-copy over
index_html - name of the file to copy over
container name - my_website
folder within the contianer that you want to drop the file into: usr/share/ngnix/html
`docker cp localfile.txt <container_id>:/path/in/container`

30. What command is used to save container changes as a new image?
`docker commit`

31. How do you commit changes from a container to a new Docker image?
`docker commit <container_id> my_image_name`

32. How do you push a Docker image to a remote repository like DockerHub?
`docker push username/repo_name`
* * *

### **Dockerfile Essentials**

33. What is a Dockerfile and what is it used for?

34. What is the format for construction arguments in a Dockerfile?

35. What is the purpose of the `FROM` instruction in a Dockerfile?

36. What does the `EXPOSE` instruction do in a Dockerfile?

37. What is the structure of a `COPY` instruction in a Dockerfile?

38. How do you build a Docker image from a Dockerfile?

39. How do you slim down a Docker image to reduce its size?

* * *


EXTENSION TASK:Download an appropriate Docker image that will allow you to run a MS SQL Server database in a Docker container.
It's important that you do use the correct image, so do a little bit of research and don't just pick the first one you find.
 
Use an appropriate IDE (VS Code/Azure Data Studio) to connect to this database (running inside the Docker container).
 
Install the MS SQL Server version of the Northwind database on this database server. (You should find it easy enough to find an install script for this flavour of SQL.)
 
Success! Query the database to double check the data is all there.