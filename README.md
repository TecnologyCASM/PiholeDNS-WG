# PiHole (Ad-Blocking), Unbound DNS y WireGuard VPN.
Este proyecto esta diseñado con la finalidad de utilizarse en una red domestica, utilizando una Raspberry Pi B 8GB con dispositivo, donde contamos con la configuracion de un servicio de bloqueo de anuncios como PiHole, un servicio de transito de DNS como Unbound y un servicio de VPN como WireGuard, proteger las peticiones DNS de todos los dispositivos de la red y proporcionar una solución VPN para cuando cualquiera de estos dispositivos se encuentre fuera de la red y desee aprovechar las ventajas de seguridad (y velocidad) de la red de forma remota.

![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/559e0e0e-a068-4243-ae4f-910319001b79)

# Prerequisitos:
* Raspberry Pi 4 Modelo B 2GB. https://amzn.to/3K7diXR
* 64GB tarjeta MicroSD. https://amzn.to/3ynPiNz
* Lector de tarjetas SD USB. https://amzn.to/3wGN8bs
* Cable HDMI y monitor para la configuración inicial de Raspberry Pi. https://amzn.to/3V6UjDc
* Teclado (y ratón opcional) para la configuración inicial de Raspberry.
  
Nota: Dicho esto, este proceso debería funcionar en cualquier Raspberry Pi. La carpeta Docker-Container contiene otros contenedores en caso de querer instalarlos, como son Portainer, Plex y Nextcloud.

# Instalacion de Sistema Operativo en Raspberry Pi:
1) Descarga la aplicacion "[RaspberryOS](https://www.raspberrypi.com/software/)" de la pagina oficial.
2) Conecta a la PC el lector SD con la memoria micro y segue los pasos como se muestra en la imagen mas abajo.
3) Elige el sistema operativo recomendado por raspberry.
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/4173438b-eca6-497a-85d0-ec96bf698629)
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/3a84ef2b-4204-4585-a62f-6c5adf6b9236)
5) Una vez instalado el sistema operativo en la raspberry, conecta esta a la red via cable y conecta un monitor para completar las configuraciones iniciales.
6) Despues de agorar el paso #4, proceder a dar nuestros primeros pasos de actualizacion en la raspberry, donde debemos aplicar los siguientes comandos:
```shell
sudo apt update && sudo apt-get full-upgrade -y
```
7) Despues de completar los pasos del 1 al 6, pasaremos a los pasos de instalación del docker.
8) 
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/bc56c6aa-bcd6-4b82-8741-0edf727a3998)

# Link to Pi-hole official site https://pi-hole.net/
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/c0177465-14c0-4fd7-af6a-fc1b355c84af)

# Ling to Wireguard official site https://www.wireguard.com/quickstart/
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/abea8b26-16e6-4af6-92b3-8a8d9f24ba02)

# Link to Portainer official site https://www.portainer.io/
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/afcc9c35-a15b-4ea3-8fe8-f29f6be312d2)

MUCHAS GRACIAS POR UTILIZAR MI APORTE A LA COMUNIDAD...
