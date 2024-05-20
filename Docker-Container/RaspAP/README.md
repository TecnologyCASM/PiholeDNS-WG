![raspap-docker-repository](https://github.com/RaspAP/raspap-docker/assets/229399/c055fa68-ec85-4eb8-9bd2-4f793744bbfc)

# raspap-docker
Un contenedor acoplable dirigido por la comunidad para RaspAP. Leer el [documentation](https://docs.raspap.com/docker/) o vaya directamente a las notas de uso.

# Uso
```
docker run --name raspap -it -d --privileged --network=host -v /sys/fs/cgroup:/sys/fs/cgroup:ro --cap-add SYS_ADMIN ghcr.io/raspap/raspap-docker:latest
```
Se debe poder acceder a la GUI web en http://localhost de forma predeterminada
