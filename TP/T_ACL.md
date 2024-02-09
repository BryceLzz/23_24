---
# ACL [Evaluación](https://guiadocente.udc.es/guia_docent/index.php?centre=614&ensenyament=614G01&assignatura=614G01028&fitxa_apartat=7&any_academic=2023_24&idioma_assig=&any_academic=2023_24)
---
## Prácticas de laboratorio y presentación oral - 60%
---

- Se valora:
	- Documentación dada
	- Nivel técnico
	- Completitud y claridad
	- Dominio de los conocimientos adquiridos
	- Participación activa en cada práctica
	- Completidud, claridad y correcta exposición de las prácticas
	- Defensa del trabajo realizado ante preguntas efectuadas en los actos de presentación oral
- Práctica 1 - 40% - Mínimo 5 / 10
- Práctica 2 - 20% - Mínimo 5 / 10

## Prueba objetiva - 40 %
---
Mínimo 5 / 10 sumando teórica y práctica

- Parte teórica - 16%
- Parte práctica - 24%

---
# ACL Tema 1 - ¿Es mejorable el Proceso Software seguido?
---
## Respuesta
---

- Meta a alcanzar
- Cómo de cerca se está de dicha meta

Considerando ambos aspectos:
- Objetivos
- Grado de cumplimiento


## Objetivos
---
- Con respecto a la gestión del proyecto
	- Cumplir con el esfuerzo estimado
	- Cumplir con el tiempo estimado
	- Cumplir con el coste estimado

- Con respecto al producto
	- Lograr una alta calidad

- Medidas para cuantificar y comparar
	- Esfuerzo: horas * hombre, días * hombre...
	- Tiempo: días, meses...

- **Definición calidad**: Cada empresa marca su propia definición. Se deben establecer por anticipado los parámetros que midan la calidad, siendo estos cuantificables y verificables. Ejemplos de parámetros son:
	- Satisfacción del usuario con la funcionalidad y la facilidad de uso
	- Número de errores incluidos
	- Tiempo medio entre fallos

## Grado de cumplimiento
---
- A finales de los 70 (Crisis del Software)
- A finales de los 80 (5 - 10% usable, 30 - 40% nunca usado)
- Década de los 90 (Standish Group - Chaos 2001 Report
	- Aumento de los proyectos exitosos
	- Aumento del porcentaje de características requeridas entregadas en proyectos "challenged"
- A mediados de los 90 (Caper Jones analiza riesgos)
	- Proyectos de sw de gestión
		- Nuevos requisitos
		- Baja calidad
		- Sobrecoste
		- Mala gestión de la configuración
	- Proyectos de sw de sistemas
		- Proyectos largos
		- Excesivo papeleo
		- Módulos propensos a errores
	- Proyectos de sw comercial
		- Inadecuada documentación del usuario
		- Baja satisfacción de usuarios
		- Comercialización posterior a lo previsto
	- Proyectos sw subcontratados
		- Altos costes de mantenimiento
		- Problemas entre cliente y subcontrata
		- Criterios de aceptación imprevistos
	- "Proyectos" sw de los usuarios
		- Errores ocultos
		- Sw inmantenible
- En el siglo XXI (Standish Group en su Chaos 2006 Report)
	- Aumento de proyectos exitosos y "challenged"
	- Disminución de proyectos "completamente fallidos"
	- Conclusión: se va mejorando

---
## Conclusión
Sí se puede mejorar el PS

---
## Solución para la mejora
- Pruebas?
	- Un programador comete 100 defectos por KLOC
	- Éxito de estas menor al 50%
	- Se suele prescindir de ellas o no se ejecutan bien. Por lo tanto, hay que mejorar la forma de hacer pruebas, pero es mejor otra alternativa
- Trabajar con calidad desde el principio


## Creencias en contra
---
- Relación de proporcionalidad inversa entre productividad y calidad: *> calidad = < productividad* y viceversa
- Son dos aspectos que no se perciben como complementarios, sino como antagónicos

## Realidades a favor
---
- Las 4 "P":

	1. Producto
		- Sw como producto
		- Métricas, metodologías...
	2. Proceso
		- Buen proceso = buen producto
		- CMMI, SPICE, ISO 90003...
	3. Personas
		- Rol fundamental
		- Mejorar la formación
	4. Problema
		- Entender lo que hay que hacer
		- Conceptualizar el problema

- Mejorar
	- Calidad
	- Esfuerzo
	- Tiempo
	- Coste

	Es costoso implementar la solución, pero da muy buenos resultados

---
# ACL Tema 1 - Calidad y software
---
## ¿Qué es calidad?
---
- En la norma UNE-EN ISO 9000:2015:
	- "El grado en el que un conjunto de características inherentes de un objeto cumple con los requisitos"
	- Siendo ese "objeto" cualquier cosa que pueda percibirse o concebirse:
		- Producto
		- Servicio
		- Proceso
		- Recurso
		- Sistema
		- Organización
- En la norma ISO 8402:
	- "Conjunto de propiedades y características de un producto o servicio que le confieren aptitud para satisfacer unas necesidades explícitas o implícitas"
- En definitiva:
	- La calidad no se trata de un concepto absoluto, ya que el consumidor la juzga con todo relativismo en un producto o servicio concreto
- Como función organizativa, calidad es:
	- Un staff directamente vinculado a dirección y dependiente exclusivamente de ella
	- Una visión independiente en la empresa o en el proyecto
	- El órgano cuya función es velar por el buen hacer, según lo definido en el sistema de calidad, en la empresa o en los proyectos, informando de la posibles desviaciones a dirección
- Existen dos actividades fundamentales directamente vinculadas con calidad:
	- Actividades de aseguramiento de calidad:
		- Se asegura que se sigue el proceso definido, los estándares y las herramientas marcadas
		- Por ejemplo: una auditoría de fin de fase
	- Actividades de control de la calidad:
		- Se controla la calidad técnica de los productos obtenidos
		- Por ejemplo: revisión de productos entregables

## ¿Qué es la calidad del software?
---
- La calidad del sw no es algo que se considere sólo una vez se ha generado el código (pruebas)
- La gestión de la calidad es una actividad que se aplica a lo largo de todo el PS
- Según Pressman, la gestión de la calidad abarca:
	- Un proceso de garantía de la calidad del SW (SQA)
	- Tareas específicas de aseguramiento y control de la calidad
	- Prácticas efectivas de ingeniería de sw
	- Control de todos los productos de trabajo del sw y los cambios que generan
	- Un procedimiento para garantizar el ajuste a los estándares de DS
	- Mecanismos de medición y de generación de informes
- Verificación y validación del sw:
	- Abarcan el tema de pruebas de sw exclusivamente como una parte
		- **Verificación**:
			- Conjunto de actividades que garantizan que el resultado de cada fase se corresponde con las entradas a dicha fase, es decir, que técnicamente se ha construido correctamente
				- Se realiza para cada fase del ciclo de vida, confirmando que lo realizado hasta el momento es correcto, completo y consistente
				- Por ejemplo: revisión del diseño
			- En definitiva: **¿se está desarrollando el producto correctamente?**
		- **Validación**:
			- Conjunto diferente de actividades que aseguran que el sw construido corresponde con los requisitos del cliente.
				- Se realiza sobre el producto terminado y ya verificado y comprueba que funciona como queire el cliente y realiza todas las funciones requeridas
				- Pruebas de aceptación
			- En definitiva: **¿se ha desarrollado el producto correcto?**
- Algunos problemas asiduos en lograr la calidad del sw suelen ser:
	- Con el cliente:
		- No participa en la definición ni en el desarrollo del proyecto
		- Pide constantemente cambios sobre lo acordado inicialmente
	- Con el proyecto
		- Se define vaga y/o incorrectamente el proyecto
		- Inexistencia de una ERS o similar
		- Los requisitos cambian continuamente u no se hace gestión de requisitos
		- No se planifica y/o controla esfuerzo, tiempo y coste
	- Con el desarrollo
		- Cada miembro del equipo de desarrollo trabaja a su forma, sin que se pueda entender o reutilizar nada
		- No se dispone de las versiones correctas de los entregables y/o no hay control de cambios sobre ellos
		- Como hay prisa, pruebas y doc se resienten

## Modelos de calidad del software
---
- Actualmente existen modelos habituales de sw que han contribuido a implantar la calidad en el DS:
	- **Capability Madurity Model Integration (CMMI)**:
		- Iniciativa de la administración pública de EEUU para obtener un método que permitiera valorar la capacidad de los contratistas de aplicaciones informáticas que accedian a sus licitaciones: reducir el riesgo al adquirir software subcontratado
	- **Bootstrap**:
		- Alunos autores discutieron CMM en Europa: la respuesta fue Bootstrap
		- Este método se encuentra alineado con la norma ISO 9000
	- **ISO 9000**:
		- Norma internacional de calidad genérica, que posee guías de aplicación a las empresas desarrolladoras de sw
- **SPICE**:
	- Promovido por ISO
	- Objetivo: materializar un esfuerzo de colaboración internacional en un nuevo estándar para la valoración del PS
	- Se elaboraron diferentes borradores
	- Se consideraron "pruebas de campo" como labor fundamental para mejorar dichos borradores
	- El proyecto SPICE alcanzó el status de Informe Técnico en 1997
- Opciones que en general suelen tomar las empresas de DS:
	- CMMI en EEUU principalmente
	- ISO 9000 en Europa principalmente. Válido para cualquier empresa pero daba problemas de adaptación al desarrollo y mantenimiento:
		- Por este motivo se desarrolla guías de adaptación de esta norma al ámbito del sw
		- Actualmente se buscan modelos más "comparables": de ISO 9000 se pasa a CMMI
		- Estrategia: obtener primero certificación ISO 9000 y posteriormente seguir el modelo CMMI

---
# ACL Tema 1 - ISO 9000. Aplicación al ámbito del software
---
## ISO 9000
---
- Describe un **sistema de gestión de la calidad (SGC)** en términos genéricos aplicables a cualquier negocio sin importar los productos o servicios ofrecidos
- SGC: se define como la estructura organizativa, responsabilidades, procedimientos, procesos y recursos para implementar la gestión de la calidad
- Objetivo: ayudar a las empresas a garantizar que sus productos y servicios satisfacen las expectativas de los clientes al cumplir sus especificaciones
- Como ISO 9000 es aplicable a todas las disciplinas de ingeniería, se ha desarrollado un conjunto especial de directrices ISO que ayudan a interpretar el estándar para emplearlo en el PS
- ISO nació para facilitar la coordinación internacional de las normas técnicas en los diferentes campos de la industria
- Todos los países del mundo que lo deseen pueden ser miembros, representados a través de su organismo nacional de normalización. P.e.:
	- EEUU: ANSI
	- España: AENOR
- Los trabajos de elaboración de normas están encomendados a los Comités Técnicos (TC), que se dividen en Subcomités (SC) y estos en Grupos de Trabajo (WG)
- Las normas ISO 9000 se publicaron por primera vez en 1987
- ISO obliga a que todas las normas sean revisadas cada 5 años
- Actualmente ISO 9000 se compone de:
	- UNE-EN ISO 9000: SGC: fundamentos y vocabulario
		- Aborda los fundamentos de los SGC y su terminología
	- UNE-EN ISO 9001: SGC: requisitos
		- Especifica los requisitos para un SGC. Se centra en la eficacia
	- UNE-EN ISO 9004: gestión para el éxito sostenido de una organización. Enfoque en la GC
		- Orienta sobre un rango más amplio de objetivos que la anterior
		- COmplementa la norma ISO 9001, pero también puede ser utilizada de forma independiente. No está destinada a la certificación
- Actualmente las versiones vigentes son:
	- **UNE-EN ISO 9000:2015**
	- **UNE-EN ISO 9001:2015**
	- **UNE-EN ISO 9004:2018**
- Cambios destacables en ISO 9000:2015
	- Los 8 principios de GC se reducen a 7
	- Se enfatiza que el valor que proporciona un producto o servicio a las partes interesadas forma parte de la calidad
	- Se indica que la calidad no es sólo satisfacer a los clientes, sino que incluye el impacto previsto o no previsto, positivo o negativo, que estos puedan tener sobre las partes interesadas
	- La percepción del cliente debe ser considerada al gestionar la calidad de los prod y serv de la organización
- Los **7 principios básicos de la GC** son:
	1. Enfoque al cliente:
		- Satisfacer las necesidades del cliente
		- Esforzarse para superar sus expectaticas
	2. Liderazgo:
		- Los líderes establecen la unidad de propósito y crean las condiciones en las que las personas que se dedican a la consecución de los objetivos de calidad de la organización
	3. Compromiso de las personas:
		- Competentes
		- Capacitadas
		- Comprometidas
	4. Enfoque de procesos:
		- Resultados consistentes y predecibles más eficaz y eficientemente si las actividades se entienden y gestionan como procesos interrelacionados que funcionan como un sistema coherente
	5. Mejora
	6. Toma de decisiones basada en la evidencia
		- Análisis
		- Evaluación
	7. Gestión de las relaciones
		- Proveedores
		- Socios
		- Inversionistas
		- Empleados
		- Sociedad en su conjunto

## ISO 9001
---
- La estructura de la norma se adapta a las exigencias de ISO para todas las normas de SG
	- Objeto y campo de aplicación
	- Referencias normativas
	- Términos y definiciones
	- Contexto de la Organización:
		- Comprensión de la organización y de su contexto, de las necesidades y expectativas de las partes interesadas
		- Determinación del alcance del SGC y sus procesos
	- Liderazgo:
		- Dirección
		- Política de calidad y roles
		- Responsabilidades
		- Autoridades
	- Planificación:
		- Abordar riesgos y oportunidades
		- Objetivos de la calidad y planificación para lograrlos
		- Planificación de los cambios
	- Soporte:
		- Recursos
		- Competencia
		- Toma de conciencia
		- Comunicación
		- Información documentada
	- Operación:
		- Planificación y control operacional
		- Requisitos para los productos y servicios, diseño y desarrollo de productos y servicios
		- Control de los procesos, productos y servicios suministrados externamente
		- Producción y prestación del servicio
		- Liberación de los prod y serv
		- Control de las salidas no conformes
	- Evaluación del desempeño:
		-  Seguimiento
		-  Medición
		-  Análisis y evaluación
		-  Auditoría interna
		-  Revisión por la dirección
	-  Mejora:
		-  No conformidad
		-  Acción correctiva
		-  Mejora continua
-  Se habla productos y servicios
-  Aplicabilidad
-  Se asignan responsabilidades y autoridades similares a las de un Representante de la Dirección. La norma deja libertad a la Alta Dirección para decidir cómo repartir sus funciones
-  Información documentada: no se exige manual de calidad pero sí su contenido a lo largo del SGC
-  Ambiente para la operación de los procesos
-  Gestión de riesgos: reemplaza las acciones preventivas

## ISO 90003
---
- Proporciona la guía necesaria en las organizaciones para la aplicación de la ISO 9001:2000 a la adquisición, suministro, desarrollo, operación y mantenimiento de sw
- No añade o cambia requisitos respecto a ISO 9001:2000
- Identifica todos los aspectos que deberían de ser tratados y es independiente de la tecnología, ciclos de vida, procesos de desarrollo y estructuras organizativas
- Surge porque la GC propuesta por ISO 9001 es muy general y se queda corta
- Las directrices proporcionadas en esta guía no están enfocadas a ser utilizadas como criterios de evaluación en el registro del SGC
- La organización debe establecer, documentar, implementar y mantener un SGC sw y mejorar continuamente su eficacia de acuerdo a:
	- Identificar los procesos necesarios para el SGC y su aplicación a través de la organización. Además:
		- Procesos de desarrollo, operación y mantenimiento del sw
	- Determinar la secuencia de estos procesos. Además:
		- Secuencia e iteracción de los procesos en los ciclos de vida
		- Planificación de la calidad y el desarrollo
	- Determinar los criterios y métodos para asegurarse de que operación y control sean eficaces
	- Asegurarse de la disponibilidad de recursos e información para apoyar la operación y seguimiento
	- Realizar el seguimiento, medición y análisis
	- Implementar las acciones para alcanzar los resultados planificados y la mejora continua de estos procesos
- Las especificaciones dados anteriormente en ISO 9001 están en perfecta consonancia con esta guía

## Certificación ISO 9001
---
- Existe la posibilidad de certificar a una empresa en la ISO 9001:
	- Asegurar y dar fe del grado de implantación de la norma
	- Se certifica que la empresa está organizada y sigue un proceso que dará un producto de calidad
- Requiere que el sistema y las operaciones de calidad de una empresa sean auditados
- Los auditores deben ser externos y verifican la concordancia con el estándar y su funcionamiento eficaz
- Tras una auditoría satisfactoria, se le extiende a la empresa auditada un certificado avalado por los auditores
- Auditorías periódicas garantizan la anterior concordancia y funcionamiento eficaz continuamente
- El proceso de certificación se puede dividir en 3 fases:
	- **Auditorías de evaluación previa**
		- Es opcional en el proceso de certificación
		- Es preliminar para evaluar la conformidad con la norma ISO 9001 y con la doc del SGC
		- Es anterior (2-3 meses) a la auditoría de certificación para dar tiempo a implantar acciones correctivas y preventivas
		- Permite
			- Determinar el nivel de preparación general para la auditoría de certificación
			- Mitigar riesgos en áreas en que la empresa teme no cumplir los requisitos
			- Hacer un simulacro de auditoría de certificación
	- **Auditoría de certificación**
	- **Auditorías de seguimiento**
		- Estas dos últimas son:
			- Necesarias para obtener y mantener la certificación ISO 9001
			- Programadas por el representante en la dirección de la empresa tras consultar con el certificador
- Auditoría de certificación:
	- Los auditores externos examinan si las actividades de la calidad se están llevando a cabo de conformidad con los requisitos de:
		- ISO 9001
		- Internos de la empresa
	- Si se supera con éxito, los auditores recomendarán al certificador la certificación de la empresa
	- Si se detectan no-conformidades, si son mayores deberán resolverse para que la certificación pueda llevarse a término
- Los pasos básicos de la auditoría de certificación son los siguientes:
	1. Plan de auditoría de certificación
	2. Auditoría de la documentación
	3. Reunión inaugural
	4. Realización de la auditoría
	5. Reunión de clausura
	6. Informe de auditoría
	7. Promocionar la certificación
- Auditorías de seguimiento
	- Necesarias una vez que la empresa ha obtenido la ISO 9001 para un período de 3 años
	- Cada auditoría de seguimiento conlleva la evaluación de una parte del SGC
	- Suelen ser cada 6 meses
	- Determinados apartados deben ser clave:
		- Revisiones por la dirección
		- Auditorías internas
		- Acciones correctivas y preventivas
		- Tramitación de las reclamaciones del cliente
		- Control de los documentos
		- Impacto de los cambios de la org en el SGC
		- Uso adecuado de los certificados
	- Al igual que en la de certificación, se elabora un informe de auditoría para cada una
- Una vez concluido el periodo de 3 años: se repite el proceso
- Entidades involucradas:
	- Acreditación: ENAC (Entidad Nacional de Acreditación)
	- Normalización y certificación: AENOR (Asociación Española de Normalización y Certificación)
	- Otras entidades que sólo certifican:
		- LRQA
		- BVQI
- 10 pasos básicos para llegar a la certificación:
	1. Establecer un plan de trabajo
	2. Iniciar el proyecto de mejora con recursos, conocimientos, formación y voluntad de toda la empresa
	3. Establecer el manual de calidad
	4. Establecer el manual de procesos
	5. Implantar el sistema de calidad aplicando lo recogido en el SGC
	6. Recoger datos e info para mejorar el sistema y que todo el mundo se vea implicado, comprometido y reflejado en el SGC
	7. Mejorar el sistema de calidad en base al punto anterior
	8. Obtener la certificación, si así se desea
	9. Hacer partícipe a toda la empresa del reconocimiento obtenido o las mejoras alcanzadas y difundir públicamente que se es una empresa registrada
	10. Seguir trabajando para mejorar continuamente