---
# BDA [Evaluación](https://guiadocente.udc.es/guia_docent/index.php?centre=614&ensenyament=614G01&assignatura=614G01029&fitxa_apartat=7&any_academic=2023_24&idioma_assig=&any_academic=2023_24)
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

# BDA - [Catálogo](https://campusvirtual.udc.gal/pluginfile.php/1002860/mod_resource/content/0/catalogo.pdf)

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

# BDA - [Vistas](https://campusvirtual.udc.gal/pluginfile.php/1002861/mod_resource/content/0/vistas.pdf)

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
	