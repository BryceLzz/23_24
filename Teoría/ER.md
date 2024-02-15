---
# ER [Evaluación](https://guiadocente.udc.es/guia_docent/index.php?centre=614&ensenyament=614G01&assignatura=614G01027&fitxa_apartat=7&any_academic=2023_24&idioma_assig=&any_academic=2023_24)
---
## Examen final - 40%
---
## Prácticas - 40%
---
- Más o menos 6-7 entregas
## Trabajo tutelado - 20%
---
- 1 trabajo al final del cuatri

---
# ER Tema 1 - Introducción
---
## Definiciones
---
- `No hace falta saberlo ->` **Requisito**:
	- Cosa que impulsa y condiciona el diseño
	- Propiedad que el sistema debe cumplir para aportar valor a los interesados
	- Especificación de lo que debería ser implementado
	- Descripciones de cómo el sistema debería comportarse o de una propiedad del sistema
	- Límites en el proceso de desarrollo del sistema
- **Ingeniería de requisitos**: proceso de licitar, analizar, especificar, validar y, como siempre, mantener los requisitos según el tiempo pasa y el proyecto avanza
	- **Licitar**: listar los requisitos
	- **Analizar**: ver cuáles son necesarios y cuáles no, y ver si falta alguno
	- **Especificar**: representarlos de manera formal y bien organizada, para que todo el mundo los entienda
	- **Validar**: comprobar que son implementables y realizables
	
	Los requisitos pueden ir cambiando a lo largo del proyecto

---
# ER Tema 2 - 
---
## La máquina y el mundo
---
- **Máquina** o **Sistema** (cómo lo tenemos que implementar): interés en desarrollar sw
- **Entorno** (qué debe hacer): la máquina cambia el mundo, tiene un efecto

## Modelo WRSPM
---
- Siglas
	- **W** - World
	- **R** - Requisitos
	- **S** - Especificación
	- **P** - Programa
	- **M** - Máquina
- Permite formalizar la ingeniería de requisitos
- Relaciona entorno y sistema a través de **eventos compartidos**
- Toda la especificación de requisitos se hace en estos eventos (interfaz)

## Eventos compartidos
---
- Eventos del entorno
	- Visibles: **ev**
	- No visivles :**eh**
- Eventos del sistema
	- Visibles: **sv**
	- No visibles: **sh**

## Entorno
---
- Identificación de restricciones y limitaciones
- Considerar factores externos
- Condiciona de manera directa el diseño de nuestro sistema
- El **diagrama de contexto** es una herramienta para mostrar visualmente las entidades del entrono y el sistema, y las conexiones entre ellas

## Conocimiento del dominio
---
- Comprensión de las necesidades del cliente
- Facilita la comunicación con los interesados
- Nos hará más fácil la vida a la hora de validar los requisitos
- Facilita el mantenimiento del sistema

## Requisitos
---
- Son los cambios deseados en el entorno (subjuntivo vs indicativo)
	- R - subjuntiva
	- E - indicativa
		- Es importante conocer el dominio
- **Se expresan en términos de eventos del entorno**

## Especificación
---
	S, E -> R	Especificación, Entorno -> Requisitos
	P, M -> S	Programa, Máquina -> Especificación
- Demostrar que los requisitos son satisfacibles por un sw
- Es el puente entre los requisitos y el sistema, es la **interfaz** entre ambos
- La primera fórmula trata de ser formal en el sentido de describir **completamente** todo lo que pasa, pero incluso ni las máquinas se comportan de manera completamente predecible acorde a un modelo, mucho menos E y R
- Tiene que estar escrita en lenguaje formal, en función de los eventos compartidos
- Una designación es un *mapping* entre los términos de los requisitos y los términos de la especificación (pasar de lenguaje humano a lenguaje formal)