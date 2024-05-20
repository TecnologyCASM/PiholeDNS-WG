# PiHole (Ad-Blocking), Unbound DNS y WireGuard VPN.
Este proyecto esta diseñado con la finalidad de utilizarse en una red domestica, utilizando una Raspberry Pi B 8GB con dispositivo, donde contamos con la configuracion de un servicio de bloqueo de anuncios como PiHole, un servicio de transito de DNS como Unbound y un servicio de VPN como WireGuard, proteger las peticiones DNS de todos los dispositivos de la red y proporcionar una solución VPN para cuando cualquiera de estos dispositivos se encuentre fuera de la red y desee aprovechar las ventajas de seguridad (y velocidad) de la red de forma remota.

Traducción realizada con la versión gratuita del traductor DeepL.com
![image](https://github.com/TecnologyCASM/PiHoleUnbound/assets/107158068/559e0e0e-a068-4243-ae4f-910319001b79)

# Prerequisitos:
* Raspberry Pi 3 Modelo B 4GB o 8GB. https://www.amazon.com/Vilros-Raspberry-Kit-inicio-completo/dp/B07VD9JR2H/ref=sr_1_2_sspa?crid=1VPQDACDM5528&dib=eyJ2IjoiMSJ9.mP4drOfyakW9P2E6ytjWi1Dw0PQxL-Sc1CRzWf-ayOfPngqMkFYuZZ8iGwFUXcYj1NWbOnpGUQ-qBtp-oQK_IsMnbpgOX3wGj91dP8c2C0z3z-K_FWKa16SLI3_fVx1zkWOoMd2GUKJ6OtS9tyyJvVpCXOmRShPlMfrn3qEPFlQSno9o5mbCihGOjbpMZCoTyLIVb2Pvm6XNFqR7daYBkit1n4dT8VvffejvDzUmJ18.e-W8cnluY3VdFUz7BwyvCro1NkFkJ5_niLTRtAGu8Xs&dib_tag=se&keywords=raspberry%2Bpi%2B4%2Bmodel%2Bb&qid=1716176020&sprefix=Raspberry%2BPi%2B4%2B%2Caps%2C142&sr=8-2-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1
* Raspberry Pi OS (64-bit).
* 16GB tarjeta MicroSD.
* Lector de tarjetas SD USB.
* Teclado (y ratón opcional) para la configuración inicial de Raspberry.
* Cable HDMI y monitor para la configuración inicial de Raspberry Pi.

Nota: Dicho esto, este proceso debería funcionar en cualquier Raspberry Pi 2 v1.2 y superiores, y hay herramientas de Windows / Linux para manejar la gestión de la tarjeta SD.
