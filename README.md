# PiHole-UnboundDNS y WireGuard-VPN.
- `PiHole "Ad-Blocking"`
- `Unbound "DNS"`
- `WireGuard "VPN"`
  
Este proyecto esta diseñado con la finalidad de utilizarse en una red domestica, utilizando una Raspberry Pi B 8GB con dispositivo, donde contamos con la configuracion de un servicio de bloqueo de anuncios como PiHole, un servicio de transito de DNS como Unbound y un servicio de VPN como WireGuard, proteger las peticiones DNS de todos los dispositivos de la red y proporcionar una solución VPN para cuando cualquiera de estos dispositivos se encuentre fuera de la red y desee aprovechar las ventajas de seguridad (y velocidad) de la red de forma remota.

![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/559e0e0e-a068-4243-ae4f-910319001b79)

# Prerequisitos:
* `Raspberry Pi 4 Modelo B 2GB`. https://amzn.to/3K7diXR
* `64GB tarjeta MicroSD`. https://amzn.to/3ynPiNz
* `Lector de tarjetas SD USB`. https://amzn.to/3wGN8bs
  
Nota: Dicho esto, este proceso debería funcionar en cualquier Raspberry Pi.

# Instalacion de Sistema Operativo en Raspberry Pi:
1) Descarga la aplicacion "[RaspberryOS](https://www.raspberrypi.com/software/)" de la pagina oficial.
2) Conecta a la PC el lector SD con la memoria micro y segue los pasos como se muestra en la imagen mas abajo.
3) Elige el sistema operativo recomendado por raspberry.
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/4173438b-eca6-497a-85d0-ec96bf698629)
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/3a84ef2b-4204-4585-a62f-6c5adf6b9236)
4) Una vez instalado el sistema operativo en la raspberry, conecta esta a la red via cable y conecta un monitor para completar las configuraciones iniciales.
5) En este paso, debemos realizar los ajustes de `Network`, ya que estaremos brindando los servicios mencionados, debemos fijar un direccionamiento IP al equipo, donde estaremos ejecutando el siguiente comando, para que nos arroje un asistente:
```shell
sudo nmtui
```
![image](https://github.com/TecnologyCASM/PiHoleUnbound-WG/assets/107158068/35b590d2-8eab-44af-9d5b-ab48f9270ff5)

6) En este asistente, estaremos eligiendo la opcion `Modificar una conexion`, luego debemos elegir la terjeta de red que dice `Conexion Cableada 1` y presionamos editar:
![image](https://github.com/TecnologyCASM/PiHoleUnbound-WG/assets/107158068/cc2a65fd-be60-46c5-9aec-0b39bc97c184)
10) Alli aplicamos los ajuste de direccionamiento estatico que sean necesarios, como son:
  * Direcciones: En esta opcion debemos colocar la IP estatica que debera llevar la raspberry, el cual debe llevar el siguiente formato `192.168.1.10/24`.
  * Puerta de Enlace: En esta opcion debemos colocar la IP de nuestro router de internet, el cual se encuentra en el mismo segmento mensionado mas arriba, por ejemplo `192.168.1.1`.
  * Servidores de DNS: En esta opcion colocamos los DNS de nuestra eleccion, en mi caso coloco los de google `8.8.8.8` y `8.8.4.4`.
  * Busqueda de Dominio: Esto es cuando estamos trabajando con un dominio, por lo que es opcional.
7) Despues que la Raspberry Pi inicie el OS despues del reinicio, entonces procederemos con los ajustes de algunos parametros en esta, para ello debemos iniciar el siguiente asistente, con el comando:
```shell
sudo raspi-config
```
Este comando nos llevara a la siguente pantalla:
![image](https://github.com/TecnologyCASM/PiHoleUnbound-WG/assets/107158068/c138d6d4-2f87-4468-bd1f-2c13102bac31)

8) En este asistente, tendremos que realizar los siguientes ajustes:
  *  `1-System Options=>Boot/Auto Login=>Desktop Autologin`: Opcion utilizada para que la rasperrypi no solicite credenciales al iniciar sesion. (Solo Raspberry Pi Desktop).
  *  `2-Display Options=>VNC Resolutions`: Opcion utilizada para elegir la resolucion de la pantalla de conexion remota a la raspberry pi. (Solo Raspberry Pi Desktop). 
  *  `3-Interface Options=>VNC`: Opcion habilitada para conexion remota por GUI a la raspberry pi. (Solo Raspberry Pi Desktop).
  *  `5-Localisation Options`:
      - Locale: Configuracion del idioma. En mi caso es `es_DO.UTF-8`.
      - Timezona: Configuracion de zona horaria. En mi caso es `America/Santo_Domingo`.
      - Keyboard: Configuracion del Teclado. Solo elegir para autoreconocimiento.
      - WLAN Country: Configuradion de la ciudad para la red wireless. En mi caso `DO Dominican Republic`.
  *  `6-Advanced Options=>Expand FileSystem`: Opcion para expandir por completo el almaceniamiento de la SD de la raspberry.

 Nota: Para que estos ajustes se apliquen debemos presionar `Finish` y este solicitara un reinicio del equipo.
 
# Proceso Actualiacion OS, Instalacion de Docker y agregar usuario a grupo docker: 
1) Una vez la raspberry pi halla iniciado, procederemos a aplicar los siguientes comandos:
```shell
sudo apt update && sudo apt-get full-upgrade -y &&
sudo curl -fsSL https://get.docker.com/ -o get-docker.sh && sudo sh get-docker.sh &&
sudo usermod -aG docker ${USER} && sudo reboot

```
2) Una vez la raspberry pi halla iniciado y para validar que el servicio de docker esta instalado, procederemos a descargar un contenedor de prueba llamado `Helo-Wold`:
```shell
docker run hello-world
```
![image](https://github.com/TecnologyCASM/PiHoleUnbound-WG/assets/107158068/58f35f2b-9c35-4381-8186-8f37298e170a)

# Descarga de proyecto y modificacion del mismo:
1) Ejecutar el siguiente comando para solo descargar el proyecto `MiHomePUW` y acceder a la carpeta del proyecto:
```shell
git clone https://github.com/TecnologyCASM/MiHomePUW.git
cd MiHomePUW
ls -la

```   
2) Editar los siguientes archivo a su gusto `docker-compose.yml` y `.env`:
```shell
sudo nano docker-compose.yml
```
```shell
sudo nano .env
```
Ejemplo `.env` archivo en el mismo directorio que su archivo `docker-compose.yml`:

```shell
# Variables de entorno para Pi-hole & Unbound
TZ=America/Santo_Domingo
HOSTNAME=PIHOLE-UNBOUND
DOMAIN_NAME=PIHOLE-UNBOUND.local
PIHOLE_WEBPORT=8080
WEBTHEME=default-dark

REV_SERVER=true
REV_SERVER_DOMAIN=local
REV_SERVER_TARGET=10.7.1.1
REV_SERVER_CIDR=10.7.1.0/24
FTLCONF_LOCAL_IPV4=10.7.1.10
PIHOLE_DNS=127.0.0.1#5335
PIHOLE_WEBPASSWORD=P@ssword2024*

# Variables de entorno para wg-easy
WG_EASY_SERVERURL=casmvpn.duckdns.org
WG_DEFAULT_DNS=10.7.1.6
```
### Pi-hole environment variables
> Variables y descripciones replicadas del [official pihole container](https://github.com/pi-hole/docker-pi-hole/#environment-variables):

| Variable | Default | Value | Description |
| -------- | ------- | ----- | ---------- |
| `TZ` | UTC | `<Timezone>` | Configura tu [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) para asegurarse de que los registros roten a la medianoche local en lugar de a la medianoche UTC.
| `WEBPASSWORD` | random | `<Admin password>` | http://pi.hole/admin contraseña. Ejecuta `docker logs pihole \| grep random` para encontrar tu pase aleatorio.
| `FTLCONF_LOCAL_IPV4` | unset | `<Host's IP>` | Configure la IP LAN de su servidor, utilizada por los modos de bloqueo web y la dirección de enlace lighttpd.
| `REV_SERVER` | `false` | `<"true"\|"false">` | Habilite el reenvío condicional de DNS para la resolución de nombres de dispositivos |
| `REV_SERVER_DOMAIN` | unset | Dominio de Red | Si el reenvío condicional está habilitado, configure el dominio del enrutador de la red local |
| `REV_SERVER_TARGET` | unset | IP del enrutador | Si el reenvío condicional está habilitado, configure la IP del enrutador de la red local |
| `REV_SERVER_CIDR` | unset | Inverso DNS | Si el reenvío condicional está habilitado, configure la zona DNS inversa (e.g. `10.7.1.0/24`) |
| `WEBTHEME` | `default-light` | `<"default-dark"\|"default-darker"\|"default-light"\|"default-auto"\|"lcars">`| Tema de interfaz de usuario a utilizar.

7) Una vez editado los archivos mencionados mas arriba, solo resta ejecutar el sigueinte comando:
```shell
docker compose up -d && docker ps
```

MUCHAS GRACIAS POR UTILIZAR MI APORTE A LA COMUNIDAD...
