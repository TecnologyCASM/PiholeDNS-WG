# PiHole (Ad-Blocking), Unbound DNS y WireGuard VPN.
Este proyecto esta diseñado con la finalidad de utilizarse en una red domestica, utilizando una Raspberry Pi B 8GB con dispositivo, donde contamos con la configuracion de un servicio de bloqueo de anuncios como PiHole, un servicio de transito de DNS como Unbound y un servicio de VPN como WireGuard, proteger las peticiones DNS de todos los dispositivos de la red y proporcionar una solución VPN para cuando cualquiera de estos dispositivos se encuentre fuera de la red y desee aprovechar las ventajas de seguridad (y velocidad) de la red de forma remota.

Traducción realizada con la versión gratuita del traductor DeepL.com
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/559e0e0e-a068-4243-ae4f-910319001b79)

# Prerequisitos:
* Raspberry Pi 3 Modelo B 2GB. https://amzn.to/3K7diXR
* 64GB tarjeta MicroSD. https://amzn.to/3ynPiNz
* Lector de tarjetas SD USB. https://amzn.to/3wGN8bs
* Cable HDMI y monitor para la configuración inicial de Raspberry Pi. https://amzn.to/3V6UjDc
* Teclado (y ratón opcional) para la configuración inicial de Raspberry.
  
Nota: Dicho esto, este proceso debería funcionar en cualquier Raspberry Pi 2 v1.2 y superiores, y hay herramientas de Windows / Linux para manejar la gestión de la tarjeta SD.

# Instalacion de Sistema Operativo en Raspberry Pi:
1) Descarga la aplicacion "[RaspberryOS](https://www.raspberrypi.com/software/)" de la pagina oficial.
2) Conecta a la PC el lector SD con la memoria micro y segue los pasos como se muestra en la imagen mas abajo.
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/4173438b-eca6-497a-85d0-ec96bf698629)
3) Elige el sistema operativo recomendado por raspberry.
4) Una vez instalado el sistema operativo en la raspberry, conecta esta a la red via cable y conecta un monitor para completar las configuraciones iniciales.
5) Despues de agorar el paso #4, proceder con la actualizazcion del sistema operativo.
6) Despues de completar los pasos del 1 al 6, favor de crear una carpeta en el "/home/pi" con el nombre de su eleccion.
7) Dentro de la carpeta que habia creado, favor descargar el archivo setup.sh.
8) Par que este archivo pueda ejecutarse, debe escribir en la ruta donde se encuentra este via el terminal el siguiente comando "chmod +x setup.sh", esto sin las comillas, este comando habilitar la caracteristica de ejecucion en el archivo.
9) Una vez ejecutado este comando, tendra los contenedores PiHoleUnbound y WireGuard listos.
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/b9b364a3-2a96-4b0b-aceb-7a1e9b0c0f2f)

