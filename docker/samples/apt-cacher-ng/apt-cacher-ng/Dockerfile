FROM    ubuntu
VOLUME  ["/var/cache/apt-cacher-ng","/var/log/apt-cacher-ng"]
COPY    ./sources.list /etc/apt/sources.list
COPY    ./certs /etc/ssl/certs
RUN     apt-get update && apt-get install -y apt-utils && apt-get install -y apt-cacher-ng

EXPOSE  3142
CMD    chmod 777 /var/cache/apt-cacher-ng && chmod 777 /var/log/apt-cacher-ng &&  /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*
