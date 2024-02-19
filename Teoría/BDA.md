---
# [Evaluación](https://guiadocente.udc.es/guia_docent/index.php?centre=614&ensenyament=614G01&assignatura=614G01029&fitxa_apartat=7&any_academic=2023_24&idioma_assig=&any_academic=2023_24)
---
## Trabajos tutelados - 30%
---
- Modelado de datos
- Entrega el 3 de abril
## Prácticas de laboratorio - 30%
---
- Examen online - 10%
	- Ejercicios SQL Aplicado
	- Semana 16
- Entrega - 20%
	- Desarrollo de una aplicación en Python contra una BD
	- Entrega en la Semana 14
## Prueba mixta - 40%
---
- Ejercicios y preguntas teóricas sobre lo visto en teoría. 
Puede ser alguna de estas:
	- Examen escrito
	- Entrega de trabajo
	- Prueba en Moodle
- Miércoles 22 de mayo

---

# [Catálogo](https://campusvirtual.udc.gal/pluginfile.php/1002860/mod_resource/content/0/catalogo.pdf)

---

## Introducción
---
- La necesidad de los metadatos
	- **Diccionario de datos:** repositorio centralizado que contiene información sobre los datos
	- **Catálogo:** a diferencia del diccionario de datos, puede ser usado tanto por el SGBD como por los usuarios, pero normalmente con otros objetivos, y no puede ser modificado directamente por los usuarios

- Diccionario de datos: Repositorio de información que almacena metadatos (datos sobre los datos). Incluye información como significado, tipo de dato, formato, tamaño..., pero puede también incorporar otros elementos, como los programas que los utilizan o usuarios que pueden acceder a ellos.

	El DD gestiona la información centralizadamente, lo que puede mejorar la autenticidad de esta y la comunicación entre los usuarios. Este permite
	- Documentar el modelo
	- Generar informes sobre cualquiera elemento del modelo
	- Analizar el impacto de un cambio en el modelo de datos
	- Generar automáticamente la estructura de la BD
	- Generar automáticamente la definición de datos en lenguajes de programación que accedan a esos datos

- Catálogo del sistema: Conjuntos de tablas que almacenan metadatos sobre la base de datos y vistas que los exponen de forma más amigable. Creado por el SGBD y de sólo lectura para los usuarios. Es crítico para el funcionamiento del sistema.

## El catálogo del sistema
---
- Ejemplos iniciales
	- Consulta de usuario

			SELECT column_name, data_type
			FROM information_schema.columns
			WHERE table_name=’EMP’;
	- Uso por parte del sistema
	
			SELECT *
			FROM emp
			WHERE sal + comm > 2000
			AND deptno=10;

- Contenido del catálogo: Almacena datos de esquemas conceptual, externo y físico. Contiene:

	- Definición de las tablas y sus columnas
	- Las restricciones de integridad
	- Definición de las vistas
	- Descripción de los espacios de almacenamiento
	- Índices asociados a las tablas
	- Información sobre usuarios, roles y privilegios
	- Descripción de las estructuras lógicas y físicas de la BD

	Además:

	- Autocontiene los metadatos sobre la propia estructura del catálogo
	- No contiene información externa a la base de datos, como la definición de los datos, para que se usan o los programas que los manipulan

## El catálogo SQL estándar
---
- Estructura
	- **Esquema:** colección de elementos individuales como tablas, vistas, triggers...
		- Pertenece a un sólo usuario.
		- Un usuario o ID de autorización puede ser el propietario de varios esquemas
	- **Catálogo:** conjunto de esquemas
		- Nomeclatura única de los elementos: *nombre_catalogo.nombre_esquema.nombre_elemento*
		- Debe contener un esquema de nombre *INFORMATION_SCHEMA* que contiene la información sobre todos los esquemas de ese catálogo
	- **Cluster:** colección de catálogos
		- Cada usuario tiene asociado uno.
		- Máximo ámbito sobre el que se puede ejecutar una consulta SQL, por lo que de alguna manera sería "la base de datos" tal y como la ve el usuario
	- **Entorno SQL:** contexto en el que los datos puede existir y realizar operaciones sobre ellos
		- En la práctica se puede considerar como una instancia del SGBD que se está ejecutando en una instalación concreta

- Almacenamiento y exposición de metadatos: El SGBD almacena datos en un conjunto de tablas llamado *DEFINITION_SCHEMA*, que no son accesibles por el SQL de usuario. El estándar deja abierta las implementaciones. Los datos se exponen a través de una colección de vistas en el *INFORMATIO_SCHEMA*:

	- *SCHEMATA*: esquemas propiedad del usuario actual
	- *TABLES*: tablas persistentes accesibles para el usuario actual
	- *COLUMNS*: columnas de las tablas persistentes accesibles para el usuario actual
	- *VIEWS*: vistas accesibles para el usuario actual
	- *DOMAINS*: dominios accesibles para el usuario actual

	*INFORMATION_SCHEMA* es autodescriptivo, contiene información sobre sus propias vistas en *INFORMATION_SCHEMA.VIEWS*

	Los usuarios pueden consultar el catálogo usando SQL, pero no lo pueden modificar directamente, si no que la modificaciones suelen ser consecuencia de operaciones DDL


## Casos de uso
---
- Oracle: No sigue el estándar. Tiene los siguientes elementos:

	- Hasta la versión 11, solo una base de datos. A partir de la 12, instalado como *Container Database*, puede tener varias
	- Lo normal es que cada BD tiene sus propios usuarios
	- Cada usuario es propietario de un único esquema
	- Dentro de un esquema hay distintos elementos, referidos como objetos:
		- Tablas, vistas...
		- Secuencias, índices...
		- Sinónimos
		- Paquetes, procedimientos, funciones, disparadores

	El nombre único de un elemento será el nombre del usuario y el nombre del objeto unidos por un punto, p.e.: *SCOTT.EMP*

	*Oracle Multitenant*:
		- En una misma instalación podemos enchufar PDBs
		- Desde el punto de vista de una aplicación, un PBD es muy similar a una instalación de una BD Oracle 11

	Para cada tipo de objeto, en general, existen vistas con los siguientes prefijos:

	- *USER_<tipo objeto>*: objetos creados por el usuario
	- *ALL<tipo objeto>*: objetos a los que el usuario tiene acceso
	- *DBA<tipo objeto>*: todos los objetos
		- Las vistas con este prefijo solo pueden ser consultados por usuarios con el rol DBA
	- *CDB_*: todos los objetos
		- Solo en Oracle 12 o superior, con instalación como CDB
	- También requiere privilegios de DBA

	Los tipos de objeto que Oracle maneja son, entre otros:

	- *OBJETOS*
	- *TABLES*
	- *VIEWS*
	- *INDEXES*
	- *CONSTRAINTS*
	- *SYNONYMS*

	Ejemplos de vistas de catálogo:

	- *DICTIONARY*, *DICT*: describe brevemente todas las vistas del catálogo
	- *USER_OBJECTS*: todos los objetos creados por el usuario
	- *ALL_VIEWS*: vistas accesibles al usuario
	- *DBA_INDEXES*: todos los índices (solo para DBAs)

	Para la consulta de los elementos creados por el propio usuario son interesantes:

	- *OBJ*: sinónimo de *USER_OBJECTS*
	- *CAT (USER_CATALOG)*: tablas, vistas y secuencias
	- *TABS (USER_TABLES)*: tablas
	- *COLS (USER_TAB_COLUMNS)*: columnas de las tablas
	- *TAB*: tablas y vistas
	- *USER_CONTRAINTS*: restricciones
	- *USER_CONS_COLUMNS*: columnas implicadas en las restricciones

- PostgreSQL: Sigue el estándar pero variando la nomenclatura:

	- Esquema | Schema
	- Catálogo | Database
	- Cluster | -
	- Entorno SQL | Cluster

	Un usuario puede crear múltiples BDs (una BD es propiedad de un solo usuario) y puede acceder a bases de datos de otros usuarios, pero no existe nomenclatura para ese conjunto. Dentro de una BD puede haber varios *Esquemas*. Un usuario puede crear varios pero un esquema es sólo de un usuario. Cada BD contiene un esquema de nombre *INFORMATION_SCHEMA*

---

# [Vistas](https://campusvirtual.udc.gal/pluginfile.php/1002861/mod_resource/content/0/vistas.pdf)

---

## Introducción
---
- Las vistas en la arquitectura ANSI/SPARC
	- Permiten la definición de los diferentes esquemas externos
	- Ofrecen a cada usuario o rol la visión de la BD adecuada
	- Ayudan a conseguir la independencia lógica
- Las vistas para el SQL y los SGBD relacionales
	- Una vista es una "tabla virtual" que expone los datos resultado de una consulta sobre otras tablas o vistas
	- **Tabla**: almacena la definición en el catálogo y los datos en el espacio de datos
		- Tablas permanentes: mantienen estructura y los datos, que pueden ser accedidos por otros usuarios o sesiones
		- Tablas temporales: mantienen la estructura pero los datos se eliminan. Los datos son privados de cada sesión
	- **Vista: sólo almacena la definición en el catálogo, no los datos. Componentes:
		- Nombre, único
		- Lista de atributos o columnas
		- Definición: *SELECT* que obtiene los datos
	- Vista materializada: caso de vista en las que si almacena los datos

## Vistas en SQL estándar
---
- Creación de vistas

		CREATE VIEW nombre_vista [(<lista_atributos>)]
		AS <sentencia_select>
		[<check_option>]

	- Consideraciones:
		- El esquema debe ser válido
		- Un *SELECT se expande a la lista de atributos
		- *SELECT* no incluirá *ORDER BY*
		- <check_option> sólo se aplica si la vista es actualizable
- Eliminación y modificación de vistas
	- **Eliminación**:
	
		`DROP VIEW nombre_vista [RESTRICT | CASCADE`
		- Consideraciones:
			- *RESTRICT* hay varias dependientes, no se borra
			- *CASCADE*: borra las vistas dependientes y luego la actual
	- **Modificación**:
		- **No** existe la sentencia *ALTER VIEW* para modificar una vista, sería necesario borrarla y vovlerla a crear
- Actualización de vistas
	- **Regla básica**: para actualizar una vista, el SGBD debe poder llegar de una fila de la vista a una única fila de la tabla base
	- **Normas**:
		- Una vista será actualizable si la consulta que la defina cumple:
			- No hay elimiación de duplicados ni agrupamiento: no se usa *SELECT DISTINCT* ni cláusulas *GROUP BY* o *HAVING*
			- No hay más de una tabla en *FROM*
			- La consulta no es el resultado de operaciones algebraicas
			- Si hay *WHERE*, este no puede contener una subconsulta que use la misma tabla que *FROM*
		- Además:
			- Se deben satisfacer las restricciones de la tabla base. En general, si omitimos un atributo con *not null*, la vista no permitirá inserciones
			- Si la vista utiliza expresiones, no se permitirá actualizar la expresión ni la inserción de nuevas filas
	- Extensiones:
		- Cada revisión del estándar SQL incluye capacidades opcionales para la actualización, p.e.: si la vista está definida sobre un *JOIN*, los atributos de la tabla preservada por la clave primaria serán actualizables
- Actualización de las vistas: *check option*
	- **Tuplas migratorias**: es aquella que "desaparece" de la vista
		- Insertamos una fila que no cumple las condiciones de la vista
		- Modificamos una fila haciendo que no cumpla las condiciones
	- ***Check option***
		- Se inlcuye en la sentencia de creación de la vista, despues de la definición de la consulta
			
				WITH [CASCADED | LOCAL ] CHECK OPTION ]
		- Permite evitar la aparición de tuplas migratorias
		- Sólo se admite en vistas actualizables
		- Opción predeterminada: *CASCADED*
	- Alcance de la comprobación
		- *LOCAL*: comprueba la condición de la propia vista
		- *CASCADED*: comprueba la condición de la propia vista y de todas aquellas sobre las que está definida
- Ventajas e inconvenientes de las vistas:
	- Ventajas: 
		- Permiten la definición de los diferentes esquemas externos
		- Ayuda a conseguir la independencia lógica
		- Facilita la realización de consultas complejas
		- Permite establecer condiciones de seguridad y de integridad de datos
		- Los datos siempre están actualizados
	- Desventajas o limitaciones:
		- Limitaciones a la hora de actualizar datos
		- No aumentan la eficiencia de las consultas

## Vistas en Oracle
---
- Algún aspecto específico de Oracle
	- Creación de vistas:
			
			CREATE [OR REPLACE] VIEW nombre_vista [(<lista_atributos>)]
			AS <sentencia_select>
			[WITH CHECK OPTION]
		- Sigue el estándar
		- Permite *ORDER BY* en *SELECT*
		- *WITH CHECK OPTION* no tiene especificaciones de alcance, siempre actúa en cascada
		- Permite especificar restricciones (PK, FK) limitadas para las vistas
		- Usa *CREATE OR REPLACE VIEW*... para modificar la definición de una vista
	- Borrado:
		
			DROP VIEW nombre_vista;
		- Borra la vista y marca como inválidas las vistas definidas sobre ellas
		- Puede incluir la cláusula *CASCADE CONSTRAINTS* si la vista tuviese restricciones
	- Alter:
	
			ALTER VIEW nombre_vista COMPILE;
		- Utilizado cuando una vista ha dejado de ser válida, comprueba dependencias y puede volver a marcarse como válida
		- *ALTER VIEW* no sirve para modificar la consulta asociada a la vista, debe usarse *CREATE* o *REPLACE VIEW*
	- Actualizaciones: siguen el estándar pero
		- Permite insertar filas cuando la vista tiene expresiones
		- Ignora la regla de la subconsulta en el *WHERE*
		- Permite actualizar vistas definidas sobre *JOIN*

## Vistas materializadas en Oracle (*snapshots*)
---
- Almacenan el resultado de la consulta en disco
	- Las consultas son más rápidas
	- Ocupan espacio en disco
	- Hay que actualizar el contenido
- Aparecieron para tratar de aumentar el rendimiento cuando se consulta sobre vistas
	- Especialmente en entornos distribuidos, data *warehouses*...
- Oracle permite especificar **cuando materializar** la vista y **como y cuando actualizar** eses datos para mantenerlos sincronizados con tablas base
- **Materialización (*build*)**
	- Inmediata (*immediate*): se materializa cuando se define: *CREATE MATERIALIZED VIEW*
	- Aplazada (*deferred*): la consulta se ejecutará a posteriori
	- Utilizando una tabla preexistente como datos actuales de la vista
		- Hace que la tabla y la vista compartan el mismo segmento de datos
		- Se usa especialmente en data warehousing: no estará sincronizada, y tiene limitaciones
- Sincronizar el contenido de la vista con tablas base
	- Como se actualiza el contenido de la vista materializada (***refresh***)
		- Recreando la vista por completo (*refresh complete*)
			- Puede hacerse en cualquier momento
			- Caro
		- De forma incremental, actualizando sólo la nueva info (*refresh fast*)
			- Requiere *materialized view logs" en las tablas base. No es siempre posible
			- Más rápido
		- *refresh force* (predeterminado) hace incremental si es posible, si no, completo
	- Cuándo se actualiza
		- Durante el commit de cada transacción que afecta a las tablas base (*on commit*)
		- Bajo demanda (*on demand*): de forma manual
		- De forma periódica
		- Nunca (*never refresh*)
- Selección de datos
	- Pueden hacerse consultas directamente sobre las vistas materializadas como si fuesen tablas
	- Pueden añadirse índices a las vistas materializadas para hacer más eficientes algunas consultas
- Reescritura de consultas o *query write* 
	- Permite que el optimizador de Oracle utilice de forma inteligente las vistas materializadas, aunque no se referencien en la consulta
	- Si la consulta, o parte de ella, coincide con la definición de la vista, en algunos casos puede usar la vista en lugar de las tablas
	- Este comportamiento puede activarse o desactivarse mediante:
			
			ALTER SESSION SET QUERY_REWRITE_ENABLED = { TRUE | FALSE } ;
	
---
# [Integridad](https://campusvirtual.udc.gal/pluginfile.php/1002883/mod_resource/content/0/Integridade.pdf)
---
## Introducción
---
- Concepto de integridad y elementos para garantizarla
	- La información almacenada en una BD debe ser
		- **Correcta**
		- **Completa**
	- Para garantizar la integridad:
		- **SGBD transaccional**: permite que la BD pase de un estado consistente a otro estado consistente cuando acabe la transacción. Durante la ejecución es posible que no se cumpla alguna regla
		- **Restricciones de integridad**: son condiciones duraderas sobre los datos, especificadas de forma delcarativa
		- BD Activa (**triggers** o disparadores): código programado que se ejecuta en el servidor como respuesta a una evento que se produce en la BD. Se utilizan normalmente cuando el SGBD no es capaz de garantizar determinada condición mediante restricciones
- Fases del diseño de la BD
	1. Modelo conceptual (ER)
		- Diagrama ER: Idenficadores, cardinalidad y participación de los tipos de relación
		- Documentación adicional: condiciones que no podemos dibujar en el ER
	2. Modelo lógico (relacional)
		- Claves primarias, foráneas...
	3. Implementación física (SQL)
		- Restricciones de integridad
		- Triggers si son necesarios
- Tipos de condiciones de integridad (modelo físico)
	- Valores requeridos: admisión o no de nulos en un atributo
	- Valores únicos
	- Integridad de entidad y clave: la clave primaria y las candidatas no deben admitir nulos ni duplicados
	- Integridad referencial: claves foráneas
	- Validez de los datos
		- Un atributo
		- Una fila
		- Un dominio
	- Otras condiciones
		- Condiciones que afectan a colecciones de filas y/o tablas
		- Reglas de negocio o condiciones más complejas establecidas en el minimundo o en la organización

## Restricciones en el modelo de datos
---
- Está todo esquematizado en la presentación de clase

## Restricciones de integridad de SQL
---
- Conceptos generales
	- Se puede crear una restricción:
		- A nivel de columna (atributo)
		- A nivel de fila
	- Además podemos crear o eliminar restricciones
		- Crear: en el momento de la creación de la tabla
		- Crear/Eliminar: mediante *alter table {add | drop}*
	- Toda restricción tiene un nombre, ya sea indicado en la sentencia SQL mediante *CONSTRAINT <nombre>* o asignado por el sistema. Es buena idea darle nombre a las restricciones porque:
		- Obtenemos ensajes de error más significativos cuando hay una violación de la restricción
		- Permite una gestión más simple para eliminar o habilitar/deshabilitar una restricción. También para ponerla en modo aplazado/inmediato
		- Si creamos scripts SQL que, por ejemplo, deshabilitan y habilitan restricciones, es más fácil hacerlos "receptibles" si usamos nombres
- Clave primaria
	- No admite nulos ni duplicados
	- En SQL se especifica con la restricción PRIMARY KEY
	- Unha tabla sólo puede tener como máximo una clave primaria
	- Podemos crearla utilizando restricciones sin nombre
		- De columna
			
				CREATE TABLE DEPT(
				DEPTNO NUMERIC(2)
				PRIMARY KEY,
				DNAME ...
				)

		- De fila

				CREATE TABLE DEPT(
				DEPTNO NUMERIC(2),
				DNAME ...,
				PRIMARY KEY (DEPTNO)
				)

		- Con un nombre

				CREATE TABLE DEPT(
				DEPTNO NUMERIC(2)
				CONSTRAINT pk_dept PRIMARY KEY,
				DNAME ...
				)

				
				CREATE TABLE DEPT(
				DEPTNO NUMERIC(2),
				DNAME ...,
				CONSTRAINT pk_dept PRIMARY KEY (DEPTNO)
				)

	- Podríamos eliminar restricciones existentes o crearlas nuevas a posteriori
		
			ALTER TABLE DEPT DROP CONSTRAINT pk_dept;
			ALTER TABLE LEAVE ADD CONSTRAINT pk_leave PRIMARY KEY(ENAME, STARTDATE);

- Valores requeridos (*NOT NULL*)
	- No se puede insertar una fila con un nulo en ese atributo
	- No se puede actualizar (*update*) a nulo ese atributo
	- Si forma parte de una clave foránea, no tiene sentido especificar como acción referencial *set null*

			CREATE TABLE EMP(
			...
			ENAME VARCHAR(50) NOT NULL,
			...
			);


			CREATE TABLE EMP(
			...
			ENAME VARCHAR(50)
			CONSTRAINT nn_ename NOT NULL,
			...
			)

	- Muchos gestores:
		- En caso de violar la restricción, no incluyen su nombre en el mensaje.
		- Almacenan las restricciones en el catálogo como restricciones del tipo *CHECK(campo is not null)*
		- Requieren modificar la columna asociad para crear/eliminar la restricción a *NOT NULL*

---
# [Seguridad](https://campusvirtual.udc.gal/pluginfile.php/1002884/mod_resource/content/0/Seguridade.pdf)
---

## Introducción
---
- Se centra en garantizar:
	- **Confidencialidad**: datos privados que deben estar protegidos ante accesos no autorizados
	- **Disponibilidad**: no se deben producir denegaciones de acceso a datos sobre los que hay derechos de acceso
	- **Integridad**: no se deben producir modificaciones no adecuadas ni daños en la info
- Se verá influenciada por:
	- Legislación vigente (LOPD y RXPD)
	- Normas específicas de la organización
- **ISO/IEC 27001**: estándar que permite establecer los requisitos para crear, mantener y mejorar un SGSI de una organización. Está basada normalmente en el ciclo de Deming o PDCA (Plan-Do-Check-Act)
	- **Plan**: establecer objetivos y procesos y hacer una planificación temporal
	- **Do**: implementarlos
	- **Check**: verificar el éxito o fracaso
	- **Act**: recopilar lo aprendido y ponerlo en marcha
- **Seguridad** protege al SGBD de **amenazas** y **ataques** que pueden producir una pérdida de confidencialidad, disponibilidad e integridad. **Medidas** para contrarrestar riesgos:
	- Control de acceso: autenticación y autorización
	- Control de Acceso Obligatorio
	- Control de Acceso Discrecional
	- Otras medidas:
		- BD estatísticas
		- Cifrado de datos
		- Auditoría
		- ...

## Autenticación y autorización
---
- Authorization identifier (**AuthID**)
	- Identificador o nombre de usuario
		- Identificador SQL para conectarse a la BD
		- No hay un estándar

				CREATE USER "nombre.usuario" IDENTIFIED BY "contra..señal"";
				CREATE USER usuario IDENTIFIED EXTERNALLY;


	- Nombre de un rol
	- *PUBLIC* es un pseudo-AuthID que referencia la totalidad de los AuthIDs de la BD
- **Autenticación**: primer proceso que realiza e SGBD para realizar el control de acceso de los usuarios a la base de datos. Consiste en identificar a un usuario y verificar su identidad. Implica:
	- Identificarse
	- Verificarse
		- Realizada completamente por el SGBD
		- Delegando en el SO
		- Delegando en otro sistema externo
- **Autorización**: especifica lo que un usuario puede hacer en la BD. Hay 2 tipos de mecanismos de control de acceso:
	- Control de Acceso Obligatorio (MAC)
		- El estándar SQL no incluye soporte
		- El nombre puede ser engañoso ya que no es el más habitual
		- Está basado en políticas a nivel de sistema
			- A cada objeto de la BD se le asigna una clase de seguridad
			- A cada usuario se le asigna un nivel de autorización para cada clase
		- Trata de garantizar que los datos confidenciales no pasen de un usuario sin saber su nivel de seguridad
	- Control de Acceso Discrecional (DAC)
		- Está definido en el estándar
		- Está basado en la concesión y revocación de privilegios: *GRANT* y *REVOKE*
		- Normalmente incluye la autorización basada en roles
		
## Control de acceso discrecional
---
- **Privilegios de sistema o de servidor**
	- Especifican acciones que un usuario puede llevar a cabo sin estar vinculadas a ningún objeto en concreto
	- No está definido en SQL estándar pero prácticamente todos los SGBD lo incluyen
	- Normalmente la gestión es sintacticamente igual a la gestión de roles

			CREATE TABLE 				→ Crear tablas en el esquema propio
			CREATE ANY TABLE 			→ Crear tablas en calquera esquema
			SELECT ANY 					→ Seleccionar datos de cualquier tabla calquera esquema
			AUDIT ANY 					→ Auditar cualquier objeto del sistema
			CREATE MATERIALIZED VIEW	→ Crear vistas materializadas en el esquema propio
- **Privilegios a nivel de objeto**
	- Están asociados a un objeto en concreto y dependerán del tipo de este
	- Están definidos en el estándar
	- Para tablas y vistas
	
			SELECT [<lista de columnas>]
			INSERT [<lista de columnas>]
			DELETE
			UPDATE [<lista de columnas>]
			REFERENCES [<lista de columnas>]
			TRIGGER [<lista de columnas>]
	- Existen otros como *USAGE* o *EXECUTE*
	- El creador de un objeto tiene todos los privilegios sobre este y la potestad de pasar estos a otros
	- **Concesión**
		
			GRANT { <lista_privilegios> | ALL PRIVILEGES }
				ON <objeto>
				TO <lista_authids>
				[WITH GRANT OPTION]
		- Un usuario sólo puede conceder un privilegio sobre el objeto si tiene ese privilegio
		- *GRANT* permite conceder varios privilegios a la vez pero sobre un único objeto
		- *ALL PRIVILEGES* es la lista de todos los privilegios aplicables al tipo de objeto implicado
		- *WITH GRANT OPTION* concede la potestad de pasar privilegios
	- **Revocación**

			REVOKE [GRANT OPTION FOR] { <lista_privilegios> | ALL PRIVILEGES }
				ON <objeto>
				FROM <lista_authids>
				{ CASCADE | RESTRICT }
		- Un usuario sólo puede revocar un privilegio que concedió explícitamente con una sentencia *GRANT* previa
		- *GRANT OPTION FOR* sólo se retira la potestad de pasar privilegios
		- Si algún usuario de la list_authids propagó algún privilegio a otros
			- *CASCADE* retira el privilegio a todos
			- *RESTRICT* produce un error y no revoca los privilegios
- Líneas y cadenas de concesión de privilegios
	- Al ejecutar una sentencia *GRANT* concediendo un privilegio a un AuthID se establece una línea de concesión. Si se propaga a terceros, se crean complejas cadenas de concesión. Un AuthId pierde un privilegio si se le retira por todas las líneas de concesión
- Un **rol** es un tipo especial de AuthID que se utiliza para facilitar la gestión de los privilegios	
	- Es un AuthID que no puede conectarse a BD
	- Podemos concederle privilegios o otros roles
	- Podemos asignar el rol a otros AuthIDs con lo que pasan a tener privilegios del rol concedido

			GRANT <rol> [, <rol>, ... ]
				TO <lista_authids>
				[WITH ADMIN OPTION]

			REVOKE [ADMIN OPTION FOR] <rol> [, <rol>, ... ]
				FROM <lista_authids>

## Caso particular: Oracle
---
- Sigue razonablemente bien el estándar pero:
	- Incluye permisos adicionales para diversos tipos de objeto
		- *ALTER*
		- *AUDIT*
		- *INDEX*
		- ...
	- La palabra *PRIVILEGES* es opvional despues de *ALL* en una sentencia *GRANT*

			GRANT { <lista_privilexios> | ALL [PRIVILEGES] }
				ON <obxecto>
				TO <lista_authids>
				[WITH GRANT OPTION]
	- *REVOKE* no incluye *CASCADE* o *RESTRICT* para definir el comportamiento en el caso de que los privilegios se propagaran a terceros.
		- Oracle actúa en cascada
		- No permite revocar sólo la potestad de pasar privilegios, se debe eliminar por completo el privilegio
		
				REVOKE { <lista_privilexios> | ALL [PRIVILEGES] }
					ON <obxecto>
					FROM <lista_authids>
- Emplea privilegios de sistema y roles
	- Privilegios del sistema

			CREATE TABLE 		→ Crear tablas en el esquema propio
			CREATE ANY TABLE 	→ Crear tablas en cualquier esquema
			CREATE USER 		→ Crear usuarios
			DELETE ANY TABLE 	→ Borrar filas de cualquier tabla
			CREATE TABLESPACE 	→ Crear un espacio para tablas
			→ Todos los privilegios de sistema en SYSTEM_PRIVILEGE_MAP

	- Roles predeterminados

			CONNECT		→ Conectarse (privilegio CREATE SESSION)
			RESOURCE	→ Crear elementos (tablas, vistas, ... en el esquema propio
			DBA 		→ Tareas de DBA (Administrador da Base de Datos) desde "dentro":
						→ Xestiona usuarios, tablas, ... pero no puede por ejemplo montar la BD
			AUDIT_ADMIN → Configurar la auditoría del sistema
	- La concesión y revocación de roles sigue el estándar, pero no permite revocar sólo a *ADMIN OPTION FOR*, debe revocarse un rol o privilegio por completo:

			GRANT { <privilegio_sistema> | <rol> }, ...
				TO <lista_authids>
				[WITH ADMIN OPTION]

			REVOKE { <privilegio_sistema> | <rol> }, ...
				FROM <lista_authids>
	- Crear usuarios no basta para que tengan acceso a la BD
	- Los privilegios asociados a un rol no se asignan hasta que el usuario activa ese rol
	- Revocar un rol no hace que el usuario pierda inmediatamente los privilegios asociados
	- Los privilegios tienen un efecto limitado
	- Oracle evita la inferencia de información sobre elementos sobre los que no tiene privilegios
- No sigue el estándar SQL en cuanto al catálogo. Vistas principales:
	- Globales
	- Privilegios sobre objetos
	- Privilegios del sistema
	- Sobre roles

## Técnicas adicionales
---
- **Vistas** (+ control de acceso discrecional)
	- Problemas:
		- Es habitual limitar el acceso a ciertas filas o columnas de una tabla
		- No siempre es posible dar los permisos directamente sobre la tabla
	- Solución:
		- Retirar los privilegios sobre una tabla
		- Crear una vista con la consulta deseada
			- Vista vertical: todas las filas pero parte de las columnas
			- Vista horizontal: todas las columnas pero parte de las filas
		- Dar ejemplos sobre la vista
- **Bases de datos estadísticas**
	- Contienen datos individuales pero sólo publica datos agregados
	- Es una forma de "anonimizar" y no publicar info confidencial
	- Posible problema: la inferencia de datos confidenciales a partir de los agregados
	- Habitualmente no se publicarán datos si no provienen de un cierto nº mínimo de tuplas
- **Cifrado de la información**
	- Se puede cifrar el SGBD o los datos de la BD
	- Se usan habitualmente SSL/TLS y certificados
	- Se puede proteger la info ante accesos externos
	- Mecanismos
		- Contraseñas: común cifrar externamente la info y almacenar sólo la clave cifrada
			- Cifrado unidireccional: HASH, SHA-1, MD5...
			- En login, se cifra la clave introducida y se compara con la almacenada
		- Info confidencial: cifrado bidireccional
			- Paquete *DBMS_CRYPO*
			- TDE: cifrado de forma transparente desde una columna de una tabla hasta un espacio de tablas completo
- **Prevención de inyección SQL**
	- Es un problema de seguridad debido fundamentalmente a no controla de manera correcta la entrada de datos en nuestros programas que acceden a la BD
	- Una solución es utilizar parámetros
- **Copias de seguridad** o **backups**
	- Se puede producir pérdida de info por:
		- Borrado por parte de un usuario
		- Mal funcionamiento del sw
		- Fallo hw de los dispositivos
- **Auditoría**

## Auditoría
---
- Permite **registrar información**:
	- De los eventos globales del sistema
	- De las acciones que los usuarios hacen sobre los objetos de la BD
- El análisis de los logs de auditoría permite detectar:
	- Accesos o intentos de acceso no autorizados
	- Abuso en el acceso a datos
- **Auditoría básica**:
	- Acceso de usuarios
	- Uso de privilegios del sistema
	- Modificaciones del esquema de la BD
	- Modificaciones de datos sensibles
- **Es posible auditar**:
	- Todos los privilegios de sistema
	- A nivel de cualquier objeto de la BD
		- Diversas acciones
			- Select
			- Delete
			- Insert
			- Update
		- Para intentos con éxito, sin éxito o ambos
		- A nivel de usuario o global
- **Oracle audit**
	- Sentencias DDL, gestión de usuarios...
	- Sentencias DML: a nivel de tabla
	- Permite auditar todos los permisos que se pueden dar a un usuario o rol:
		- Auditoría de sentencias
		- Auditoría de privilegios
		- Auditoría de objetos
	- Podemos comprobar en el catálogo lo que estamos auditando
- **Triggers de sistema**
	- Eventos del sistema: arranque-parada de la BD
	- Conexión/desconexión de usuarios
	- Modificación del esquema
- **Triggers de inserción, borrado y eliminación**
	- Pueden llegar a nivel de fila y columna
	- Sólo detectan modificaciones
- Auditoría detallada (**FGA**: Fine Grain Auditing)
	- Captura accesos de lectura, hasta nivel de fila y columna
	- Basado en triggers internos
	- Usa el paquete ***DBMS_FGA***
	- Define "políticas" de auditoría