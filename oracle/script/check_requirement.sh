while read a; do sudo sysctl "$a"; done <<EOF
fs.file-max = 6815744
fs.aio-max-nr = 1048576
kernel.sem=5010 641280 5010 128
kernel.shmmni = 4096
kernel.shmmax=536870912
kernel.shmall=2097152
net.ipv4.ip_local_port_range=9000 65500
net.core.rmem_default=262144
net.core.rmem_max=4194304
net.core.wmem_default=262144
net.core.wmem_max=1048576
EOF


rpm -q --qf '%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n' binutils \
elfutils-libelf \
elfutils-libelf-devel \
gcc \
gcc-c++ \
glibc \
glibc-common \
glibc-devel \
glibc-headers \
ksh \
libaio \
libaio-devel \
libgcc \
libstdc++ \
libstdc++-devel \
make \
sysstat \
unixODBC \
unixODBC-devel \
compat-libstdc++-33
