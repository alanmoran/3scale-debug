# 3scale debug container

This container contains a few debugging tools that can be needed when debugging 3scale issues. Based on alpine.

- Build: `build-base git go bash bash-completion vim jq`
- Databases: `mysql-client postgresql-client redis`
- Network: `bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools mtr netcat-openbsd bridge-utils iperf ngrep`
- Certificates: `ca-certificates openssl`
- Processes/IO: `htop atop strace iotop sysstat ltrace ncdu logrotate hdparm pciutils psmisc tree pv`

## Attach to an existing docker container

```
docker run --rm -ti --net container:<container-id> quay.io/amoran/3scale-debug
```

## Openshift (in your 3scale project) - Recommended as it doesn't involve changing deployments

```
oc run 3scale-debug -i --tty --rm --image=quay.io/amoran/3scale-debug:latest
```

## Sidecar

### Patch Add

```
oc patch dc/<deployment config name> --type='json' -p='[{"op": "add", "path": "/spec/template/spec/containers/0", "value": {"command": ["/bin/sleep","infinity"],"image": "quay.io/amoran/3scale-debug","name": "3scale-debug"} }]'
```

### Patch Remove

```
oc patch dc/<deployment config name> --type json -p '[{ "op": "remove", "path": "/spec/template/spec/containers/0" }]'
```
