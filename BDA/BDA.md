#BDA Evaluación
##Trabajos tutelados - 30%
- Modelado de datos
- Entrega el 3 de abril
##Prácticas de laboratorio - 30%
###Examen online - 10%
- Ejercicios SQL Aplicado
- Semana 16
###Entrega - 20%
- Desarrollo de una aplicación en Python contra una BD
- Entrega en la Semana 14
##Prueba mixta - 40%
- Ejercicios y preguntas teóricas sobre lo visto en teoría. 
Puede ser alguna de estas:
	- Examen escrito
	- Entrega de trabajo
	- Prueba en Moodle
- Miércoles 22 de mayo

#BDA Tema 1 - Elementos de los Sistemas de Gestión de Bases de Datos relacionales
#Catálogo
##Introducción
###La necesidad de los metadatos
- **Diccionario de datos:** repositorio centralizado que contiene información sobre los datos
- **Catálogo:** a diferencia del diccionario de datos, puede ser usado tanto por el SGBD como por los usuarios, pero normalmente con otros objetivos, y no puede ser modificado directamente por los usuarios

###Diccionario de datos
Repositorio de información que almacena metadatos (datos sobre los datos). Incluye información como significado, tipo de dato, formato, tamaño..., pero puede también incorporar otros elementos, como los programas que los utilizan o usuarios que pueden acceder a ellos.

El DD gestiona la información centralizadamente, lo que puede mejorar la autenticidad de esta y la comunicación entre los usuarios. Este permite
- Documentar el modelo
- Generar informes sobre cualquiera elemento del modelo
- Analizar el impacto de un cambio en el modelo de datos
- Generar automáticamente la estructura de la BD
- Generar automáticamente la definición de datos en lenguajes de programación que accedan a esos datos

###Catálogo del sistema
Conjuntos de tablas que almacenan metadatos sobre la base de datos y vistas que los exponen de forma más amigable. Creado por el SGBD y de sólo lectura para los usuarios. Es crítico para el funcionamiento del sistema.

##El catálogo del sistema
###Ejemplos iniciales
- Consulta de usurio
`select column_name, data_type
from information_schema.columns
where table_name=’EMP’;`
- Uso por parte del sistema
`select *
from emp
where sal + comm > 2000
and deptno=10;`

###Contenido del catálogo
Almacena datos de esquemas conceptual, externo y físico. Contiene:

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

##El catálogo SQL estándar
###Estructura
- **Esquema:** colección de elementos individuales como tablas, vistas, triggers...
	- Pertenece a un sólo usuario.
	- Un usuario o ID de autorización puede ser el propietario de varios esquemas
- **Catálogo:** conjunto de esquemas
	- Nomeclatura única de los elementos: *nombre_catalogo.nombre_esquema.nombre_elemento*
	- Debe contener un esquema de nombre *INFORMATION_SCHEMA* que contiene la información sobre todos los esquemas de ese catálogo
- **Cluster:** colección de catálogos
	- Cada usuario tiene asociado uno.
	- Máximo ámbito sobre el que se puede ejecutar una consulta SQL, por lo que de alguna manera sería "la base de datos" tal y como la ve el usuario
- **Entrono SQL:** contexto en el que los datos puede existir y realizar operaciones sobre ellos
	- En la práctica se puede considerar como una instancia del SGBD que se está ejecutando en una instalación concreta