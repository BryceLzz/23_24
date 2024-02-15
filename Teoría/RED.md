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
- **DNS (Domain Name Stystem)**: sistema que realiza la correspondencia entre los nombres de las máquinas y sus direcciones IP
	- Bases de datos distribuida que almacena información sobre nombres de máquinas y direcciones IP
	- También proporciona información de los servidores de correo electrónico
	- Cada organización gestiona su propia base de datos: **Servidor DNS**
	- Los clientes consultan a su servidor DNS cada vez que necesitan averiguar una dirección IP

## Números de puerto
---
- Sirven para saber a qué aplicación se hay que conectar
- Tienen 16 bits (1-65535)
	- TCP y UDP tienen puertos independientes
- **Servidores**: usan puertos fijos y conocidos (**well known ports**) del 1 al 1023
	- http: puerto 80
	- ftp: puerto 21
	- telnet: puerto 23
- **Clientes** usan puertos **efímeros**: para cada servicio se usa un puerto libre cualquiera y al finalizar se deja libre
- En Linux existe el concepto de puertos reservados (1-1023): /etc/services
- Puertos ocupados: netstat -tun

---
# Red Tema 3 /  4 - [Nivel de aplicación I](https://campusvirtual.udc.gal/pluginfile.php/1004707/mod_resource/content/4/Tema%203%20-%20Aplicaciones%20I.pdf) y [II](https://campusvirtual.udc.gal/pluginfile.php/1004709/mod_resource/content/1/Tema%204%20-%20Aplicaciones%20II.pdf)
---
## Introducción
---
- Dos procesos en dos sistema finales distintos se comunican intercambiando mensajes a través de una red de computadores
- Modelo **cliente-servidor**
	- Cliente envía peticiones al servidor
	- Servidor recibe las peticiones, las procesa y envía la respuesta
- Modelo **peer to peer**: los dos extremos realizan un servicio y solicitan servicio
- Protocolos del nivel de aplicación:
	- Definen el formato y el orden de intercambio de los mensajes
	- Acciones en la transmisión o recepción de mensajes
	- FTP, HTTP, SMTP, Telnet, DNS, SNMP

## Web
- Es una aplicación/servicio más de Internet
- Combinaba cuatro ideas que no eran nuevas:
	- **Hipertexto**: formato de la información que permite moverse de una parte a otra de un documento o entre documentos mediante **hiperenlaces** o **enlaces**
	- **Identificadores de recursos**: permiten localizar un recurso en la red
		- URL - Uniform Resource Locator
		- URI - Uniform Resource Identifier
	- **Modelo cliente-servidor**
	- **Lenguaje de marcas**: caracteres o códigos embebidos en texto que indican estructura, semántica o recomendaciones para su presentación (HTML - HyperText Markup Language)
- Componentes:
	- **Página Web**: archivo HTML base + objetos
	- **Navegador**: agente de usuario para el Web
	- **Servidor Web** almacena objetos Web direccionables a través de una URL
	- **Protocolo HTTP**: permite comunicarse al servidor y al navegador

## URI
---
- Identificador que permite acceder a un recurso web
- Estructura:
	- **Esquema**: especifica el protocolo utilizado para acceder al recurso: http, ftp, https, mailto...
	- **Parte jerárquica**:
		- **Autoridad**: nombre o dirección IP del servidor
			- Puede incluir el número de puerto o información de control de acceso
		- **Ruta**: para acceder al recurso
			- Similar a los directorios
	- **Consulta** (opcional): información adicional, normalmente variables y sus valores
		- Por ejemplo: campos de un formulario
	- **Fragmento** (opcional): identifica una subdirección dentro de un recurso
- URL vs URI
	- Normalmente se denomina URL a todas las direcciones de recursos de Internet
	- Verdaderamente:
		- URL = URI - Fragmento

## HTTP
---
- **HyperText Transfer Protocol**
- Utiliza TCP
	- Cada mensaje HTTP emitido por el cliente o servidor llega al otro extremo sin modificaciones
- Define cómo los clientes solicitan páginas Web y cómo los servidores transfieren estas páginas
	- El cliente envía una **petición** HTTP
	- El servidor contesta con una **respuesta** HTTP
- Protocolo sin estado:
	- El servidor no almacena información sobre las peticiones anteriores del cliente
- **Conexiones no persistentes**:
	- Usadas por HTTP/1.0
	- Petición de una URL:
		1. Cliente inicia la conexión TCP con el servidor en el puerto 80
		2. Cliente envía al servidor el mensaje de petición solicitando el objeto
		3. Servidor recibe la petición, busca el objeto, lo encapsula en el mensaje HTTP de respuesta y lo envía
		4. Servidor finaliza la conexión TCP
		5. Cliente recibe la respuesta y finaliza la conexión TCP
		6. Cliente extrae el archivo del mensaje de respuesta, examina el archivo HTML y encuentra referncias a otros objetos HTML
		7. Para cada objeto, volver al paso 1
	- Dependiendo del navegador: nuevas conexiones podrían ser en paralelo
	- Inconvenientes:
		- Se necesita una conexión para cada objeto solicitado
		- Retardo de dos veces el RTT (Round-Trip Time): establecimiento de conexión + petición y recepción del objeto
- **Conexiones persistentes**:
	- Por defecto, en HTTP/1.1
	- Servidor deja abierta la conexión TCP, esperando por nuevas peticiones/respuestas
		- Servidor cerrará la conexión después de un tiempo de inactividad
	- **Sin pipeline**: cliente sólo envía una nueva petición cuando ha recibido la respuesta previa
	- **Con pipeline**: cliente realiza una petición tan pronto encuentra una referencia a un objeto
- **HTTP/2**:
	- Se basa en el protocolo **SPDY** de Google
	- No cambia el protocolo, cambia la manera en que se envían los datos
	- Mejoras
		- **Multiplexación total** sobre una conexión TCP
			- Descarga de objetos web asíncronamente
			- Soluciona problema head-of-line (HOL)
		- Protocolo en **formato binario** y **comprensión de cabeceras**
		- **Server Push**: el servidor puede enviar objetos no solicitados por el cliente para almacenar en caché
- **HTTP/3**
	- Utiliza el protocolo **QUIC (Quick UDP Internet Connections)** de Google: un protocolo de código abierto basado en UDP
	- Mejoras:
		- Se mantiene la multiplexación total
		- **Mejor latencia**
		- **Mejor control de flujo por stream**
		- TLS 1.3 (Transport Layer Security)
- **Mensajes HTTP**:
	- **Petición**:
	
			GET /index.html HTTP/1.1 	← 	Línea de petición
			Host: www.fic.udc.es 		←	Líneas de cabecera
			User-agent: Mozilla/4.0
			 							←	Línea en blanco
										← 	Cuerpo de entidad

		- Línea de petición + línea en blanco: obligatorio
		- **Línea de petición**: Método URL HTTP/Versión
			- **Método**:
				- GET: solicita un objeto
				- HEAD: sólo entrega la cabecera
				- POST: incluye datos en el cuerpo de entidad
				- PUT (1.1): permite al usuario cargar un objeto en la ruta especificada
				- DELETE (1.1): permite borrar un objeto de un servidor Web
			- **URL**: objeto al que se hace referencia
			- **Versión**
		- **Host**: especifica el host en el que reside el objeto
		- **User-agent**: especifica el tipo de navegador que está haciendo la petición
		- POST: utilizado comúnmente por forms
			- El cuerpo de entidad contiene los datos introducidos por el usuario
		- GET: también soporta el envío de datos introducidos por el usuario
			- Se envían codificados en la URL real
	
	- **Respuesta**:
		
			HTTP/1.1 200 OK						← Línea de estado
			Date: Sat, 1 Jan 2000 12:00:15 GMT	← Líneas de cabecera
			Server: Apache/1.3.0 (Unix)
			Last-Modified: Fri, 24 Dic 1999 13:03:32 GMT
			Content-Length: 6821
			Content-Type: text/html
												← Línea en blanco
			<HTML> <HEAD>						← Cuerpo de entidad
			<TITLE> My homepage </TITLE>
			...

		- **Línea de estado**: 
			- **Versión**
			- **Código de estado**
			- **Frase**
		- Códigos de estado agrupados en 5 tipos:
			- Informativo: 1xx.
				- 100 Coninue
			- Éxito: 2xx
				- 200 OK
			- Redirecciones: 3xx
				- 301 Moved Permanently
			- Error del cliente: 4xx
				- 404 Not Found
			- Error del servidor: 5xx
				- 500 Inernal Server Error
		- **Date**: fecha y hora en la que se creó y envió la respuesta HTTP
		- **Server**: especifica el tipo de servidor Web que ha antendido a la petición
		- **Last-Modified**: indica la fecha y la hora en el que el objeto fue creado o modificado por última vez
		- **Content-Length**: indica el número de bytes del objeto enviado
		- **Content-Type**: indica el tipo de objeto incluido en el cuerpo de entidad
			- La extensión del archivo no especifica (formalmente) el tipo de objeto
			- Usa los tipos MIME (Multipurpose Internet Mail Extensions)
			- **MIME**: estándar que indica el tipo del contenido. Gestionado por IANA
			- Estructura básica: tipo/subtipo
				- text/html
				- image/gif
			- **Discreto**: un único documento de un único tipo
				- application:
					- /pdf
					- /zip
					- /octetstream
				- audio
					- /mpeg
				- image
					- /jpeg
					- /png
					- /gif
				- text
					- /plain
					- /html
					- /csv
				- video
					- /mp4
			- **Multipart**: encapsula múltiples archivos en una única transacción
- **Cookies**:
	- HTTP no tiene memoria
	- Emplea las cookies, permiten a un servidor web guardar información en el navegador
- **GET condicional**:
	- La utilización de caché reduce los retardos de recuperación de objetos y reduce el tráfico que circula por al red
	- Problema: la copia de un objeto en caché puede ser obsoleta
	- Solución: GET + If-Modified-Since
		- Sólo devuelve le objeto si ha sido modificado después de la fecha indicada
	- Ejemplo	
		1. Solicitar un objeto por primera vez:
		
				GET /images/udc.gif HTTP/1.1
				User-agent: Mozilla/4.0
		2. Recibir la respuesta del servidor
		
				HTTP/1.1 200 OK
				Date: Sat, 1 Jan 2000 12:00:15 GMT
				Server: Apache/1.3.0 (Unix)
				Last-Modified: Fri, 24 Dic 1999 13:03:32 GMT
				Content-Type: image/gif
	
				(datos)...

		3. Pasado un tiempo, se vuelve a solicitar el mismo objeto

				GET /images/udc.gif HTTP/1.1
				User-agent: Mozilla/4.0
				If-modified-since: Fri, 24 Dic 1999 13:03:32 GMT

		4. Si no se ha modificado, el servidor no envía el objeto de nuevo

				HTTP/1.1 304 Not Modified
				Date: Wed, 5 Jan 2000 20:30:43 GMT
				Server: Apache/1.3.0 (Unix)

## Correo electrónico
---
- Inventado por Ray Tomlinson en el 71
- Medio asíncrono de comunicación
- Componentes:
	- Lectores de correo o agentes de usuario
	- Servidores de correo
	- SMTP (Simple Mail Transfer Protocol
- **SMTP**
	- Permite el intercambio de mensajes entre servidores de correo
		- El remitente actúa como cliente
		- El destinatario actúa como servidor
	- Cliente establece una conexión TCP con el puerto 25 del servidor
		- Si el servidor está fuera de servicio se intentará más tarde
	- Se realiza la sincronización entre emisor y receptor
		- Se indica la dirección de correo del remitente
	- El cliente envía el mensaje
		- Este proceso se repite si hay más mensajes y después se cierra la conexión TCP
	- Utiliza mensajes en formato ASCII 
		- Si el mensaje tiene caracteres no ASCII o binarios tiene que ser codificado (MIME)
	- Es un protocolo de oferta, frente a HTTP que es un protocolo de demanda
	- Proceso de envío de mensajes:
		1. Usuario crea el mensaje
		2. Lector de correo envía el mensaje al servidor de correo del emisor
		3. Servidor de correo se conecta al servidor de correo del destinatario
		4. Cliente SMTP envía el mensaje
		5. Servidor SMTP recibe el mensaje y lo almacena en el buzón del destinatario
		6. Destinatario utiliza su lector de correo para obtener el mensaje
- Formato correo electrónico:
	- Un mensaje de correo electrónico consta de dos partes: cabecera y cuerpo
		- Cabecera: información sobre el correo
		- Cuerpo
	- Algunos de los campos de la cabecera son:
		- From: sólo una por mensaje
		- To: una o más por mensaje
		- Cc y Bcc
		- Subject: tema
		- Date: fecha y hora de envío
		- Message-Id: insertado por el ordenador remitente
		- Received: info sobre el envío y máquinas por las que ha pasado
		- Reply-To: dirección a la que se debe responder
- **MIME**
	- Multipurpose Internet Mail Extensions
	- Definido en varios RFCs
	- Permite enviar contenidos distintos a ASCII
	- Sólo afecta a los agentes de usuario, ya que SMTP es transparente
	- Campos:	
		- MIME-version
		- Content-Desciption: necesaria para que el destinatario decida si descodificar y leer el mensaje
		- Content-Id
		- Content-Transfer-Encoding: indica la manera en que está codificado el cuerpo del mensaje
		- Content-Type
	- Los tipos están cambiando continuamente
- Protocolos de acceso al correo
	- El lector del emisor puede utilizar SMTP, pero el lector del receptor no
		- Se necesita otro protocolo para acceder/leer el correo
			- POP3
			- IMAP
	- **POP3 - Post Office Protocolv3**
		- Protocolo de acceso al correo muy simple
		- Modo de operación en 3 fases
			1. Autorización: login y password
			2. Transacción: recuperar los mensajes, marcar para borrado y estadísticas de correo
			3. Actualización: cuando finaliza la sesión, el servidor borra los mensajes marcados
		- 2 configuraciones del cliente POP3
			- Descargar y borrar
			- Descargar y guardar
	- **IMAP - Internet Mail Acces Protocol**
		- Permite crear y gestionar buzones remotos
		- Asocia cada mensaje con un buzón
			- Inicialmente al INBOX
		- Proporciona comandos para:
			- Crear buzones
			- Mover mensajes
			- Buscar mensajes
		- Mantiene información de estado de los usuarios entre sesiones
		- Dispone de comandos para recuperar componentes de los mensajes

## DNS
---
- Domain Name System
- Se encarga de hacer correspondencia entre nombre de máquinas y direcciones IP
	- También proporciona información de los servidores de correo
- Modelo cliente-servidor
- Se implementa sobre UDP (puerto 53) aunque también puede utilizar TCP
- Antes del DNS, fichero de hosts
	- Windows: %SystemRoot%\System32\drivers\etc\hosts
	- Linux: /etc/hosts y /etc/nsswitch.conf para orden de consulta
	- Inconvenientes: poco escalable, inconsistente con las copias locales y facilidad para nombres duplicados.
	- Válido como solución simple para redes muy pequeñas sin servidor DNS.
- **Cliente DNS**
	- DNS también permite a clientes y servidores comunicarse
	- Cada máquina tiene un cliente DNS (resolver)
		- Cada vez que cualquier aplicación necesita averiguar una dirección IP, le pasa la pregunta al cliente DNS
		- Cliente envía la consulta a su servidor, cuando obtiene la respuesta, se la pasa a la aplicación
- **Servidor DNS**
	- Cada red tiene su servidor DNS
	- Recibe consultas DNS de clientes, averigua dirección IP y envía a los clientes
	- DNS es una **base de datos distribuida**: no hay un servidor que conozca todos los nombres y sus IPs
	- Hay múltiples servidores DNS organizados jerárquicamente: preguntando a otros servidores
- Espacio de nombres DNS
	- Estructura de nombres jerárquica en forma de árbol
		- Top-Level Domains (TLDs):
			- com
			- net
			- es
			- uk
			- ...
		- Second-Level Domains (SLDs):
			- ibm
			- google
			- udc
			- usc
			- ...
		- Third-Level Domains
			- tic
			- fic
			- ...
	- Nombre de dominio: www.fic.udc.es
		- No se distinguen mayúsculas y minúsculas
	- FQDNs (Fully Qualified Domain Names): nombre de dominio acabado en .
	- **TLDs**
		- ccTLDs: country-codes TLDs
			- es
			- fr
			- uk
			- ...
		- gTLDS: generic TLDs
			- generic
				- com
				- org
				- net
				- info
			- generic-restricted
				- biz
				- name
				- pro
			- sponsored
				- edu
				- gov
				- int
				- cat
				- gal
				- ...
		- IDN ccTLDs: internationalized country-code TLDs
		- infrastructure TLD
			- arpa
			- ...
- Servidores de nombres
	- Hay servidores DNS en cada nivel del árbol
		- **Distribuir** la carga
		- **Delegación** de la administración
	- Servidores **raíz**
		- Existen 13 (A-M), replicados por seguridad y fiabilidad, son críticos
		- Conocen todos los TLDs y delegan en ellos
	- Servidores TLD
		- Cada dominio de 1º nivel tiene su servidor de TLD asociado
		- Delegan en servidores de 2º nivel la gestión de los sub-dominios
	- Servidores inferiores
		- Conocen todos los equipos de su dominio
		- Conocer los servidores raíz
		- Si no conoce una IP, le pregunta a un  servidor raíz
- Funcionamiento:
	- Ciclo:
		1. Cliente a mi servidor DNS: IP de www.google.com?
		2. Mi servidor DNS a servidor raíz: IP de www.google.com?
		3. Servidor raíz a mi servidor DNS: servidores TLD para .com
		4. Mi servidor DNS a servidor TLD de .com: IP de www.google.com?
		5. Servidor TLD de .com a mi servidor DNS: servidores autoritativos para .google.com
		6. Mi servidor DNS a servidor autoritativo de .google.com: IP de www.google.com?
		7. Servidor autoritativo de .google.com a mi servidor DNS: La IP de www.google.com es 209.85.227.104
		8. Mi servidor DNS a cliente: La IP de www.google.com es 209.85.227.104
	- Consultas recursivas:
		- El servidor DNS hará todo el trabajo necesario para devolver la respuesta completa a la petición
		- Puede implicar múltiples transacciones del servidor con otros servidores DNS
		- No es obligatorio que los servidores DNS soporten este tipo de consultas
		- Mi servidor, normalmente, será recursivo
	- Consultas iterativas
		- Si el servidor DNS tiene la respuesta, entonces la devuelve
		- Si el servidor DNS no tiene la respuesta, devolverá información útil, pero no hará peticiones adicionales a otros servidores DNS
		- Los servidores raíz y TLD son no recursivos
- **Caché DNS**
	- Reduce los mensajes DNS
	- Cada par "dirección IP - nombre que se resuelve" se almacena en la caché
	- Tiempo de vida (TTL) de varios días
	- Negative caching: almacenar también las peticiones incorrectas
	- **Respuesta autoritativa**: responde directamente el servidor DNS que "conoce" la info: **Servidor autoritativo**
	- Tendencia a poner también una caché en el cliente
		- Windows ya la incorpora
		- Linux: dnsmasq: servidor DNS local para caching y forwarding
- Servidores DNS de **forwarding**
	- No es responsable de ninguna zona: no almacena info en disco
	- Sólo reenvía las consultas a otros servidores DNS: consultas recursivas
	- Almacena las respuesta en caché: respuesta rápida para consultas frecuentes
	- Un router inalámbrico normalmente incorpora un servidor DNS de forwarding
		- Reenvía las consultas al servidor DNS desde mi ISP
		- Las consultas en caché se resuelven en mi LAN: evito accesos a la red del ISP
- **Consultas DNS**:
	- A (Estándar): nombre → IP
		- dig www.google.com
		- Online:  http://www.kloth.net/services/dig.php
	- CNAME: alias de un nombre
		- dig -t CNAME www.lavoz.com
	- PTR (Consulta inversa - Pointer)
		- Cliente necesita conocer el nombre del dominio de la dirección IP 88.221.32.170 → Consulta inversa 170.32.221.88.in-addr.arpa.
		- Se basa en TLD arpa
		- Es necesario invertir la dirección IP, ya que los nombres de dominio son más genericos por la derecha, al contrario que las direcciones IP
	- Consulta MX (Mail Exchanger)
		- El servidor de correo de origen, envía una consulta MX a su servidor DNS preguntando por el dominio de destino
		- La respuesta incluye un listado con los servidores de correo disponivles
			- Menor preferencia → primero
			
- **Comandos**:
	- nslookup y dig
		- Envía peticiones DNS al servidor DNS por defecto
		- Envían peticiones estándar por defecto
		- Permiten especificar otro tipo de peticiones
	- bind (Berkeley Internet Name Domain)
		- Servidor DNS más utilizado en Internet
		- Incluido en Linux
	- Servidor DNS público de google:
		- 8.8.8.8
		- 8.8.4.4

## P2P
---
- Los protocolos anteriores se basan en el modelo cliente-servidor
- **Peer To Peer** o P2P está compuesto por pares que realizan ambas funciones
- Se basan en equipos de usuarios
	- No son propiedad de un proveedor de servicio
	- Conectados intermitentemente
	- Proporcionan acceso a una parte de sus recursos
- Ventajas
	- Compartición de recursos
	- Gran tolerancia a fallos
- Inconvenientes
	- Seguridad: acceso a los recursos de un equipo → aumento de las medidas de seguridad en los últimos años
	- Gran uso de ancho de banda → a veces restringidos por los ISPs
- Tipos y ejemplos:
	- Distribución de archivos
		- BitTorrent
		- Napster
		- ...
	- Voz sobre IP
		- Skype
	- Instant messaging (IM)
	- Préstamo masivo de CPU
		- Proyecto SETI@Home
		- Plataforma BOINC (Berkeley Open Infrastruture for Nerwork Computing)
	- Blockchain, bitcoin: basado en redes P2P
- P2P estructurado: los nodos se organizan en una topología específica
- P2P sin estructura: los nodos se conectan entre sí de forma aleatoria
	- P2P puro: todos los nodos son iguales
	- P2P centralizado: dispone de un nodo central que funciona como un servidor de directorio: el resto de los nodos no están organizados
	- P2P híbrido: existen nodos especiales que realizan algunas tareas del servidor de directorio