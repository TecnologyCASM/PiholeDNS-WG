# RaspAP en Raspberry Pi 
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/b3474568-47f7-4da9-93b7-895f1d9f921a)

# raspap-docker
Un contenedor acoplable dirigido por la comunidad para RaspAP. Leer el [documentation](https://docs.raspap.com/docker/) o vaya directamente a las notas de uso.

# Uso
```
docker run --name raspap -it -d --privileged --network=host -v /sys/fs/cgroup:/sys/fs/cgroup:ro --cap-add SYS_ADMIN ghcr.io/raspap/raspap-docker:latest
```
Se debe poder acceder a la GUI web en http://localhost de forma predeterminada

## Environment Variables
Varias variables de entorno están disponibles en esta imagen de la ventana acoplable para ayudar en la configuración.

| Environment Variable   | Description                                      | Default       |
|------------------------|--------------------------------------------------|---------------|
| RASPAP_SSID            | The SSID name                                    | raspap-webgui |
| RASPAP_SSID_PASS       | The SSID password                                | ChangeMe      |
| RASPAP_COUNTRY         | The SSID country code                            | GB            |
| RASPAP_WEBGUI_USER     | The admin username for the RaspAP user interface | admin         |
| RASPAP_WEBGUI_PASS     | The admin password for the RaspAP user interface | secret        |
| RASPAP_WEBGUI_PORT     | The RaspAP web user interface port               | 80            |

También es posible realizar alguna configuración adicional mediante el uso de las siguientes variables de entorno con prefijo, en el formato RASAPAP_\[target]_\[key]

| Environment Variable Prefix | Target File                    |
|-----------------------------|--------------------------------|
| RASPAP_hostapd_             | /etc/hostapd/hostapd.conf      |
| RASPAP_raspap_              | /etc/dnsmasq.d/090_raspap.conf |
| RASPAP_wlan0_               | /etc/dnsmasq.d/090_wlan0.conf  |

Por Ejemplo, `RASPAP_hostapd_driver` establecería el `driver` valor en `/etc/hostapd/hostapd.conf`
