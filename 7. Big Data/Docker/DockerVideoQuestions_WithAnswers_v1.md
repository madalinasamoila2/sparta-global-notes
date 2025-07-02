# Dock Video Questions with Answers

### **Virtualisation & Containers**

1. **What is virtualisation?**  
   Virtualisation is the creation of virtual versions of physical resources like servers, storage, and networks.

2. **What is a hypervisor and what does it enable?**  
   A hypervisor is software that allows multiple virtual machines (VMs) to run on a single physical machine.

3. **How does virtualisation work?**  
   It works by using a hypervisor to allocate resources and isolate VMs on a host system.

4. **What does virtualisation actually do?**  
   It enables efficient use of hardware by running multiple OS environments independently on one machine.

5. **What are the disadvantages of virtualisation?**  
   Overhead, slower performance than bare metal, complex management, and higher resource usage.

6. **What is containerisation and how is it different from virtualisation?**  
   Containerisation packages applications with their dependencies in isolated environments. Unlike VMs, containers share the host OS kernel, making them lighter and faster.

7. **Why would you choose containers over virtual machines?**  
   Containers are quicker to start, use fewer resources, and are easier to deploy and scale.

* * *

### **Docker Basics**

8. **What is a Docker image and how is it related to a container?**  
   An image is a snapshot of a container’s file system. Containers are running instances of images.

9. **What does the command `docker run hello-world` do?**  
   It runs a test container to confirm Docker is installed and working.

10. **What does the `-it` flag do in `docker run -it ubuntu bash`?**  
    It opens an interactive terminal session inside the container.

11. **How do you list running Docker containers? What’s the difference when using the `-a` flag?**  
    `docker ps` lists running containers. `docker ps -a` lists all containers, including stopped ones.

12. **How do you run an Ubuntu container in detached mode using Docker?**  
    `docker run -d ubuntu` runs the container in the background.

13. **How do you execute a command inside a running Docker container (e.g. check the current user)?**  
    `docker exec <container_id> whoami`

14. **How do you attach your terminal to a running Docker container?**  
    `docker attach <container_id>`

15. **How do you stop a running Docker container?**  
    `docker stop <container_id>`

16. **How do you remove a Docker container?**  
    `docker rm <container_id>`

17. **How do you list all Docker images available locally?**  
    `docker images`

18. **How do you remove a specific Docker image (e.g. `ubuntu`)?**  
    `docker rmi ubuntu`

19. **How do you force-remove a Docker image even if it’s in use?**  
    `docker rmi -f ubuntu`

* * *

### **Docker Registries & Repositories**

20. **What is the local image registry in Docker?**  
    It's the collection of Docker images stored locally on your machine.

21. **What is DockerHub?**  
    DockerHub is a public repository for storing and sharing Docker images.

22. **What does the command `docker pull nginx` do?**  
    It downloads the latest Nginx image from DockerHub.

23. **How do you run an Nginx container in detached mode?**  
    `docker run -d nginx`

* * *

### **Networking & Port Mapping**

24. **What is the OSI model in networking?**  
    A 7-layer framework to standardise network communication, from physical (Layer 1) to application (Layer 7).

25. **What is a network port?**  
    A port is a communication endpoint for a specific process or service on a system.

26. **How does Docker handle port mapping?**  
    Docker maps host ports to container ports using the `-p` option.

27. **What does the command `docker run -d -p 5000:80 nginx` do?**  
    It runs Nginx in detached mode, mapping port 5000 on the host to port 80 in the container.

28. **How can you find out which port your Docker container is running on?**  
    Use `docker ps` and check the "PORTS" column.

* * *

### **File Management in Docker**

29. **How do you copy a file from your local machine into a Docker container?**  
    `docker cp localfile.txt <container_id>:/path/in/container`

30. **What command is used to save container changes as a new image?**
    
    `docker commit`

31. **How do you commit changes from a container to a new Docker image?**  
    `docker commit <container_id> my_image_name`

32. **How do you push a Docker image to a remote repository like DockerHub?**  
    `docker push username/repo_name`

* * *

### **Dockerfile Essentials**

33. **What is a Dockerfile and what is it used for?**  
    A Dockerfile is a script of instructions to build a Docker image.

34. **What is the format for construction arguments in a Dockerfile?**  
    `ARG name=value`

35. **What is the purpose of the `FROM` instruction in a Dockerfile?**  
    It sets the base image for the new Docker image.

36. **What does the `EXPOSE` instruction do in a Dockerfile?**  
    It documents which ports the container will listen on at runtime.

37. **What is the structure of a `COPY` instruction in a Dockerfile?**  
    `COPY source destination`

38. **How do you build a Docker image from a Dockerfile?**  
    `docker build -t image_name .`

39. **How do you slim down a Docker image to reduce its size?**  
    Use smaller base images (like `alpine`), multi-stage builds, and clean up unnecessary files in the Dockerfile.
