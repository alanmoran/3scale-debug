FROM alpine

# build
RUN apk add --no-cache build-base git go bash bash-completion vim jq

# databases
RUN apk add --no-cache mysql-client postgresql-client redis

# network
RUN apk add --no-cache coreutils bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools mtr netcat-openbsd bridge-utils iperf ngrep

# certificates
RUN apk add --no-cache ca-certificates openssl

# processes/io
RUN apk add --no-cache htop atop strace iotop sysstat ltrace ncdu logrotate hdparm pciutils psmisc tree pv
