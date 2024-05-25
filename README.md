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
6) Una vez apliquemos el comando de actualizacion de los repositorios y la actualiacion de OS de la Raspberry Pi, entonces procederemos con los ajustes de algunos parametros en esta, para ello debemos iniciar el siguiente asistente, con el comando:
```shell
sudo raspi-config
```
Este comando nos llevara a la siguente pantalla:
![image](https://github.com/TecnologyCASM/PiHoleUnbound-WG/assets/107158068/c138d6d4-2f87-4468-bd1f-2c13102bac31)

7) En este asistente, tendremos que realizar los siguientes ajustes:
  *  1 "System Options=>Boot/Auto Login=>Desktop Autologin": Opcion utilizada para que la rasperrypi no solicite credenciales al iniciar sesion. (Solo Raspberry Pi Desktop).
  *  2 "Display Options=>VNC Resolutions": Opcion utilizada para elegir la resolucion de la pantalla de conexion remota a la raspberry pi. (Solo Raspberry Pi Desktop). 
  *  3 "Interface Options=>VNC": Opcion habilitada para conexion remota por GUI a la raspberry pi. (Solo Raspberry Pi Desktop).
  *  5 "Localisation Options":
      - Locale: Configuracion del idioma. En mi caso es es_DO.UTF-8
      - Timezona: Configuracion de zona horaria. En mi caso es America/Santo_Domingo
      - Keyboard: Configuracion del Teclado. Solo elegir para autoreconocimiento.
      - WLAN Country: Configuradion de la ciudad para la red wireless. En mi caso "DO Dominican Republic"
  *  6 "Advanced Options=>Expand FileSystem": Opcion para expandir por completo el almaceniamiento de la SD de la raspberry.

 Nota: Para que estos ajustes se apliquen debemos presionar "Finish" y este solicitara un reinicio del equipo.
 
8) una vez la raspberri pi inicie, debemos realizar los ajustes de "Network", ya que estaremos brindando los servicios mencionados, debemos fijar un direccionamiento IP al equipo, donde estaremos ejecutando el siguiente comando, para que nos arroje un asistente:
```shell
sudo nmtui
```
![image](https://github.com/TecnologyCASM/PiHoleUnbound-WG/assets/107158068/35b590d2-8eab-44af-9d5b-ab48f9270ff5)

9) En este asistente, estaremos eligiendo la opcion "Modificar una conexion", luego debemos elegir la terjeta de red que dice "Conexion Cableada 1" y presionamos editar:
![image](https://github.com/TecnologyCASM/PiHoleUnbound-WG/assets/107158068/cc2a65fd-be60-46c5-9aec-0b39bc97c184)
10) Alli aplicamos los ajuste de direccionamiento estatico que sean necesarios, como son:
  * Direcciones: En esta opcion debemos colocar la IP estatica que debera llevar la raspberry, el cual debe llevar el siguiente formato 192.168.1.10/24.
  * Puerta de Enlace: En esta opcion debemos colocar la IP de nuestro router de internet, el cual se encuentra en el mismo segmento mensionado mas arriba, por ejemplo 192.168.1.1.
  * Servidores de DNS: En esta opcion colocamos los DNS de nuestra eleccion, en mi caso coloco los de google 8.8.8.8 y 8.8.4.4.
  * Busqueda de Dominio: Esto es cuando estamos trabajando con un dominio, por lo que es opcional.
11)  Una vez apliquemos estos ajustes de "Network" procederemos a reiniciar el equipo:
```shell
sudo reboot
```
# Proceso de Instalacion de Docker: 
1) Una vez la raspberry pi halla iniciado, procederemos a aplicar los siguientes comandos:
```shell
sudo sudo curl -fsSL https://get.docker.com/ -o get-docker.sh && sudo sh get-docker.sh
```
2) Despues de realizar la descarga e instalacion de docker, procederemos a agregar el usuario que estamos utilizando al grupo docker, cone l siguiente comando:
```shell
sudo usermod -aG docker ${USER}
```
3) una vez aplicado este comando, debe realizar un reinicio de las raspberry pi:
```shell
sudo reboot
```

4) fafa
5) fafafa
6) fafa
14)
15) Despues de completar los pasos del 1 al 6, pasaremos a los pasos de instalación del docker.
8) 
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/bc56c6aa-bcd6-4b82-8741-0edf727a3998)

# Link to Pi-hole official site https://pi-hole.net/
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/c0177465-14c0-4fd7-af6a-fc1b355c84af)

# Ling to Wireguard official site https://www.wireguard.com/quickstart/
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/abea8b26-16e6-4af6-92b3-8a8d9f24ba02)

# Link to Portainer official site https://www.portainer.io/
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/afcc9c35-a15b-4ea3-8fe8-f29f6be312d2)

MUCHAS GRACIAS POR UTILIZAR MI APORTE A LA COMUNIDAD...
