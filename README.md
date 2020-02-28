# Excercize
Docker commands that needs to be run are as follows: 
	2) Starting the container :
		tashkomitev$ docker run -d --name systemd101 --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro ipcontainer:v15
	
	3) Logging into the container :
		docker exec -it systemd101 bash