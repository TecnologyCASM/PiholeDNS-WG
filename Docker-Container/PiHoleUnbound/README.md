# Link to Pi-hole official site https://pi-hole.net/
# Link to Pi-hole documentation on for getting unbound setup https://docs.pi-hole.net/guides/dns/unbound/
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/c0177465-14c0-4fd7-af6a-fc1b355c84af)
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/abea8b26-16e6-4af6-92b3-8a8d9f24ba02)

### Pi-hole environment variables

> Variables y descripciones replicadas del [official pihole container](https://github.com/pi-hole/docker-pi-hole/#environment-variables):

| Variable | Default | Value | Description |
| -------- | ------- | ----- | ---------- |
| `TZ` | UTC | `<Timezone>` | Configura tu [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) para asegurarse de que los registros roten a la medianoche local en lugar de a la medianoche UTC.
| `WEBPASSWORD` | random | `<Admin password>` | http://pi.hole/admin contraseña. Ejecuta `docker logs pihole \| grep random` para encontrar tu pase aleatorio.
| `FTLCONF_LOCAL_IPV4` | unset | `<Host's IP>` | Configure la IP LAN de su servidor, utilizada por los modos de bloqueo web y la dirección de enlace lighttpd.
| `REV_SERVER` | `false` | `<"true"\|"false">` | Habilite el reenvío condicional de DNS para la resolución de nombres de dispositivos |
| `REV_SERVER_DOMAIN` | unset | Network Domain | If conditional forwarding is enabled, set the domain of the local network router |
| `REV_SERVER_TARGET` | unset | Router's IP | If conditional forwarding is enabled, set the IP of the local network router |
| `REV_SERVER_CIDR` | unset | Reverse DNS | If conditional forwarding is enabled, set the reverse DNS zone (e.g. `192.168.0.0/24`) |
| `WEBTHEME` | `default-light` | `<"default-dark"\|"default-darker"\|"default-light"\|"default-auto"\|"lcars">`| User interface theme to use.

Ejemplo `.env` archivo en el mismo directorio que su archivo `docker-compose.yaml`:

```
FTLCONF_LOCAL_IPV4=192.168.1.10
TZ=America/Los_Angeles
WEBPASSWORD=QWERTY123456asdfASDF
REV_SERVER=true
REV_SERVER_DOMAIN=local
REV_SERVER_TARGET=192.168.1.1
REV_SERVER_CIDR=192.168.0.0/16
HOSTNAME=pihole
DOMAIN_NAME=pihole.local
PIHOLE_WEBPORT=80
WEBTHEME=default-light
```
