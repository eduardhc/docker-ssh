FROM library/debian:stretch 

MAINTAINER eduardhc@gmail.com

RUN apt-get update && \
    apt-get -y install openssh-server && \
    mkdir /run/sshd && \
    chmod 755 /run/sshd && \
    echo "root:root" | chpasswd && \
    rm -rf /usr/share/doc /usr/share/locale /var/cache

EXPOSE 22/tcp

ENTRYPOINT [ "/usr/sbin/sshd", "-dD" ]
