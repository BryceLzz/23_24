---
# Red [Evaluación](https://guiadocente.udc.es/guia_docent/index.php?centre=614&ensenyament=614G01&assignatura=614G01017&fitxa_apartat=7&any_academic=2023_24&idioma_assig=)
---
## Prácticas de laboratorio - 25%
---
## Seminario - 5%
---
## Prueba objetiva - 70%
---

# Red Tema 1 - [Redes de ordenadores e Internet](https://campusvirtual.udc.gal/pluginfile.php/1004702/mod_resource/content/3/Tema%201%20-%20Redes%20de%20Ordenadores%20e%20Internet.pdf)
---
## ¿Qué es Internet?
---
- **Red de redes**: red de comunicación global que interconecta millones de redes.
	- Host, routers y enlaces de comunicación
	- Protocolos: TCP/IP
- **Autopistas de la Información**: infraestructura que proporciona servicios a las **aplicaciones distribuidas**
	- E-mail, Web, aplicaciones P2P, juegos, VolP, streaming de video...
	- Internet proporciona dos tipos de servicio
		- Fiable y orientado a conexión
		- No fiable y no orientado a conexión
	- En Internet no puedo establecer el tiempo máximo de comunicación entre dos máquinas

## ¿Qué es una red?
---
- **Red de ordenadores**: red de comunicación digital que permite a sus nodos compartir recursos y comunicarse
	- Nodo: host y hardware de red
- Tipos de redes según el canal de comunicación:
	- **Broadcast**: canal de comunicación compartido
		- Posibilidad de múltiples destinatarios
		- Redes pequeñas en general
	- **Punto a punto**: canales de comunicación dedicados para la comunicación entre dos máquinas
- Tipos de redes según su longitud
	- Redes de Área Local - **LAN**
		- Medio compartido, 10 Mbps, 100 Mbps, 1Gbps
		- Incluyen las MAN
		- 10m a varios km
	- Redes de Área Extendida - **WAN**
		- Compuestas por circuitos de telecomunicación compartidos

## Tipos de tecnologías de red
---
- **Conmutación de circuitos**: cuando dos nodos se quieren comunicar se establece una conexión terminal a terminal
	- Los recursos necesarios se reservan a lo largo del recorrido
	- La reserva se mantiene durante la sesión
	- Por ejemplo: redes de telefonía
- **Conmutación de paquetes**:
	- No hay reserva de recursos
	- Los mensajes de la sesión utilizan los recursos bajo demanda
		- Pueden tener que esperar para poder utilizar los recursos
	- Por ejemplo: Internet

## Redes de conmutación de circuitos
---
- Multiplexación por división en frecuencia (FDM)
- Multiplexación por división en el tiempo

## Redes de conmutación de paquetes
---

- Se dividen los mensajes originales en paquetes
- Los paquetes se envían a través de enlaces y routers
- Los routers utilizan la técnica de transmisión de **almacenamiento y reenvío**:
	- Router recibe el paquete completo antes de poder transmitir el primer bit hacia el siguiente destino:retardo de almacenamiento y reenvío
- Para cada enlace, el router dispone de un buffer de salida y de entrada, que almacena los paquetes a enviar por ese enlace:
	- Retardo de cola: si el enlace está ocupado con la transmisión de otro mensaje: esperar
	- Pérdida de paquetes: si la cola está llena, es necesario descartar algún paquete
- **Redes de datagramas**: el envío de paquetes se realiza en base a la dirección de destino
	- No se mantiene información sobre el estado de las conexiones en los routers
- **Redes de Circuito Virtual (CV)**: el envío de paquetes se realiza en base al nº de circuito virtual
	- Las conmutaciones mantienen información del estado de las comunicaciones entrantes:
		- Interfaz de entrada
		- Etiqueta de entrada
		- Interfaz de salida
		- Etiqueta de salida
- Tipos de retardo:
	- **Retardo de procesamiento**: tiempo requerido por el router para examinar la cabecera y determinar hacia donde seguir el paquete
	- **Retardo de cola**: tiempo de espera para ser transmitido
	- **Retardo de transmisión**: tiempo para transmitir todos los bits del paquete al enlace
	- **Retardo de propagación**: tiempo necesario para propagarse desde el inicio del enlace hasta el final del enlace

## ¿Qué es un protocolo?
---
Toda actividad en Internet que implica a dos o más entidades remotas que se comunican está gobernada por un protocolo

- **Protocolo**:
	- Conjunto de mensajes válidos
	- Significado de cada mensaje:
		- Sintáctico: campos que contiene + formato
		- Semántico: significado + acciones
- Un protocolo también se puede ver como un proveedor de servicio: diferencia entre **Servicio** y **Protocolo**:
	- Las entidades utilizan los protocolos para implementar el servicio que ha sido solicitado por el usuario
	- **Independencia**: podría cambiarse el protocolo sin necesidad de que lo note el usuario
- **Arquitectura de red**: conjunto de protocolos y capas que permiten la comunicación entre ordenadores
- **Interfaz**: comunicación definida por un conjunto de primitivas y servicios que ocurre entre pares de capas adyacentes

## Arquitectura de red
---
- Estructuración en nivel y protocolos
	- Ventajas
		- Un problema complejo se descompone en piezas pequeñas
		- Abstracción de los detalles de implementación
		- Compartición por múltiples niveles superiores los servicios de una capa inferior
	- Inconvenientes
		- Ocultación de información y principio de layering
		- Balance entre ocultacion de información y rendimiento del sistema
			- Una capa superior puede optimizar su rendimiento conociendo el funcionamiento de la capa inferior

## Modelo de referencia OSI
---
- Un conjunto de protocolos es abierto si:
	- Diseño del protocolo es de dominio público
	- Los cambios los gestiona una organización cuyos miembros y actividades están abiertos al público
- Un sistema que implementa protocolos abiertos en un sistema abierto
- **International Organization for Standards (ISO)** define un estándar para conectar sistemas abiertos: **Open System Interconnect (OSI)**
- Ha tenido gran influencia en el diseño de pilas de protocolos, **medio físico**:
	- **Sistema final**:
		- Aplicación
		- Presentación
		- Sesión
		- Transporte
		- Red
		- Enlace
		- Físico
	- **Sistema intermedio**:
		- Red
		- Enlace
		- Físico
	- **Sistema final**:
		- Aplicación
		- Presentación
		- Sesión
		- Transporte
		- Red
		- Enlace
		- Físico

## Nivel físico
---
- Transmitir bits entre entidades conectadas físicamente
- Estandarización:
	- Esquema de codificación para la representación de bits
	- Sincronización a nivel de bit
- No existe del concepto de paquete o trama

## Nivel de enlace
---
- Trama (frmae): conjunto de bits
- Cada trama está delimitada por un inicio y un final
- En un enlace de Broadcast (Ethernet):
	- Se necesita dirección de nivel de enlace
	- También se arbitra el acceso al medio
	- Estas funciones son proporcionadas por la subcapa **Medium Access Control (MAC)**
- Algunos niveles de enlace también retransmiten paquetes dañados y controlan el flujo de transmisión de datos
	- Funciones de la subcapa **Logical Link Control (LLC)**
	- Situada por encima de la MAC
- Los protocolos a nivel  de enlace son la primera capa de software
- Muy dependiente del medio físico subyacente:
	- Normalmente coexisten el medio físico y el nivel de enlace en el adaptador de tarjeta
- Internet:
	- Gran variedad de protocolos a nivel de enlace
	- Los más comunes:
		- Ethernet
		- Wifi
	- Otros:
		- FDDI
		- SONET
		- HDLC

## Nivel de red
---
- Concatena un conjunto de enlaces para formar la abstracción de un enlace extremo a extremo
- Permite a un sistema final comunicarse con otro, calculando la ruta entre ellos
- Oculta particularidades del nivel de enlace
- Proporciona direcciones de red únicas
- Es un nivel que existe tanto en sistemas finales como intermedios
- Tareas del nivel de red
	- **Enrutamiento**: planifica el orden de transmisión de paquetes y determina qué paquetes se descartan
	- **Fragmentación**y **ensamblado**
	- Detección de errores
- En Internet: **Protocolo IP**:
	- Proporciona abstracción de la comunicación extremo a extremo
	- Direcciones IP
	- Servicio best-effort

## Nivel de transporte
---
- El nivel de red proporciona un servicio extremo a extremo "pelado"
- El nivel de transporte crea un enlace extremo a extremo multiplexado, con control de errores y de flujo (servicios opcionales)
- Multiplexa varias aplicaciones sobre la misma conexión extremo a extremo:
	- Añade un identificador específico para cada aplicación (nº de puerto)
	- Para que el receptor pueda llevar los paquetes entrantes a la aplicación correcta
- Control de errores
	- Los mensajes llegan a su destino independientemente de que:
		- Se pierdan paquetes: retransmisión
		- Se dupliquen: detección y descarte
		- Se corrompan: detección, descarte y retransmisión
- Control de flujo: la velocidad de transmisión del origen se adapta a la velocidad del receptor
- Internet
	- Dos protocolos muy populares **TCP** y **UDP**
	- Se multiplexa en base al nº de puerto
	- TCP ofrece un servicio orientado a conexión fiable: proporciona control de flujo, errores y multiplexación
	- UDP ofrece un servicio no orientado a conexión y no fiable: sólo proporciona multiplexación

## Niveles de sesión y de presentación
---
- No son muy comunes
- Nivel de **sesión**:
	- Full-duplex: si el nivel de transporte es simplex, gestiona dos conexiones independientes para crear un servicio full-duplex
	- Envío de datos urgentes: saltarse la cola de mensajes
	- Sincronización: permite transferencias de datos atómicas ~ transacciones
- Nivel de **presentación**:
	- Oculta las diferencias de representación de datos entre aplicaciones
		- 0000 0001 (**little-endian**)
		- 1000 0000 (**bit-endian**)
- En Internet:
	- No existen como tal, aunque algunos protocolos implementan técnicas similares

## Nivel de aplicación
---
- Conjunto de aplicaciones que utilizan la red
- No proporciona servicios a ninguna otra capa o nivel
- Internet:
	- Múltiples aplicaciones
		- WWW
		- e-mail
		- telnet
		- ...

---
# Red Tema 2 - [Introducción a TCP/IP](https://campusvirtual.udc.gal/pluginfile.php/1004704/mod_resource/content/1/Tema%202%20-%20Introduccion%20a%20TCP-IP.pdf)
---

## Introducción
---
- La familia de protocolos TCP/IP permite a ordenadores de todos los tamaños, de diferentes fabricantes, ejecutando sistemas operativos diferentes, comunicarse entre ellos
- Proyecto financiado por el gobierno americano para investigar en redes de conmutación de paquetes: **ARPANET**
- La World Wide Web surgió a principios de los 90 en el CERN
	- Tim Berners-Lee: inventó la WWW y HTTP, URLs, HTML y primer servidor HTTP
	- Pronto aparece el primer navegador

## Niveles y protocolos
---
- **Router**:
	- Hardware y software de propósito específico que permite conectar diferentes tipos de redes físicas
	- Implementa niveles de red enlace y físico
- Los niveles de transporte y aplicación usan protocolos **extremo a extremo**
- El nivel de red utiliza un protocolo **salto a salto** que se utiliza en los sistemas finales y en cada router
- Hay otros dispositivos de interconexión de LANs:
	- Niveles físico y de enlace
	- Se basan en las direcciones de nivel de enlace (MAC)
- **Concentrador** **(*hub*)**: repite cada trama recibida por sus puertos de entrada por el resto de puertos de salida
	- Sólo implementa nivel físico
	- La red se comporta como si fuese un único segmento LAN (todos oye ntodo
- **Conmutador** **(*swith*)**: permite conectar distintos equipos para formar una LAN
	- Una trama de entrada es enviada sólo al equipo de destino (conmutada mediante MAC)
	- Permite obtener una mayor velocidad efectiva
- **Puente** **(*bridge*)**: permite conectar distintos segmentos LAN. Una trama de entrada sólo es reenviada al segmento destino
	- Puede realizar conversiones entre distintos protocolos de enlace
	- Realiza comprobación de errores

## Direcciones IP
---
- Los dispositivos en Internet se identifican mediante **direcciones IP**: cada **interfaz** debe tener una dirección IPV4
- Consta de 32 bits y se representa cada byte en decimal, separado por un punto
- Consta de dos partes (el tamaño de cada parte varía)
	- Identificador de red
	- Identificador de host
- **Clases**:
	- A - 1.0.0.0 a 127.255.255.255
	- B - 128.0.0.0 a 191.255.255.255
	- C - 192.0.0.0 a 223.255.255.255
	- D - 224.0.0.0 a 239.255.255.255
	- E - 240.0.0.0 a 247.255.255.255
- Públicas y privadas
	- **IP públicas**: identifican unívocamente un dispositivo en Internet
	- **IP privadas**: exclusivamente para uso interno: necesitaremos "algo" que convierta IPs privadas en públicas para comunicarse ne Internet: **NAT (Network Address Translation)**
		- Clase A: **10.0.0.0** (1 red)
		- Clase B: **172.16.0.0 - 172.31.0.0** (16 redes)
		- Clase C: **192.168.0.0 - 192.168.255.0** (256 redes)
- **Loopback**
	- Se reserva la dirección tipo a 127.X.X.X para la interfaz de loopback. Normalmente será la dirección 127.0.0.1 y el nombre de **localhost**
	- Pretende ser una interfaz a la que se envían los paquetes dirigidos a la misma máquina
	- Un datagrama cuyo destino sea la propia máquina no debe llegar físicamente a la red
	- Utilización de la interfaz de loopback
		- Todo paquete dirigido a la dirección de loopback aparece directamente como una entrada en la capa de red
		- Todo datagrama enviado a una dirección IP de la máquina se envía a la interfaz de loopback
		- Los datagramas de broadcast y multicast se copian a la interfaz de loopback y se envía a la red
- En IPv4 se definen 3 tipos de direcciones
	- **unicast**: una dirección IP - una única máquina (interfaz)
	- **broadcast**: una dirección IP - todas las máquinas de una red
	- **multicast**: una dirección IP - un grupo de máquinas (denominado grupo multicast)
- Broadcasting y multicasting sólo es válido con UDP
- Direcciones de broadcast 255.255.255.255 e <Id. red>.255
	- El paquete es recibido por todas las máquinas interesadas o no en el paquete: no se puede descartar hasta el transporte
	- Produce una fuerte sobrecarga cuando es muy acusado: suele estar filtrado en la mayoría de máquinas
- Este problema lo soluciona el multicast ya que para recibir estos paquetes la máquina tiene que estar suscrita a un grupo multicast
	- Si no lo está, los paquetes son automáticamente descartados por la interfaz de red
- Algunas direcciones multicast (*netstat -gn*):
	- 244.0.0.1 = todas las máquinas de la red que soportan multicast
	- 244.0.0.2 = todos los routers de la red