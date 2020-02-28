FROM centos:7

ENV container docker

ADD myscript.sh /usr/bin/myscript.sh
ADD myservice.service /etc/systemd/system/myservice.service

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN chmod +x /usr/bin/myscript.sh
RUN chmod 644 /etc/systemd/system/myservice.service

VOLUME ["/sys/fs/cgroup"]

RUN echo 'systemctl start myservice && systemctl status myservice' >> ~/.bashrc

CMD ["/usr/sbin/init"]
