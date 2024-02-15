---
# BDA Práctica 1 - Modelado de datos
---

## Enlaces
- [PDF de clase](https://campusvirtual.udc.gal/mod/resource/view.php?id=743368)
---

## Notación UML y conceptos avanzados
---

- **UML**
	- Usar ***draw.io*** para el modelado del UML
	- Tipos de atributos:
		- Emplear **identificadores** artificiales: **id**
		- **Atributos multivaluados**:
			- Si son distintos como el teléfono de casa, móvil...: se emplean distintos atributos
			- Si vale cualquiera: atributo multivaludado
				- Teléfono: String [*]
		- **Atributos compuestos**: se descompone o no en función del dominio
			- Ventajas de no compuesto
				- Flexibilidad
			- Ventajas compuestos:
				- Poder buscar por término
				- Mejor explotación
				- Se adapta a las necesidades de la empresa
		
			Ejemplo de implementación: EMPLEADO(_, ..., calle, número, CP, población)
			Si se emplea un atributo compuesto el resultado es el mismo que si los atributos pertenecen a empleado, pero da mayor legibilidad
		- **Atributos derivados**:
			- No se almacenan datos como la edad
			- Se emplean métodos
			- En una tabla del UML se indican debajo de los atributos, separado con una raya 
	- **Multiplicidad**:
		- 1 = tiene que estar asignado a 1 sí o sí
		- * = puede tener 0 o varios
		- 0..1 = puede tener 0 o si tiene, sólo tiene 1
		- 1..* = puede tener 1 o varios
		- m..n = puede tener m o, siendo estos números concretos
	- **Clases asociación**:
		- Son las que se sitúan sobre la relación, sus atributos son propios de ella
		- Los atributos se van siempre al lado de muchos, solo hay problema en relaciones * a *, ya que obliga a crear una nueva tabla con la relación
		- Hay que tener cuidado al crear estas clases, ya que a veces no se deben emplear, sino clases normales, aunque pueda parecer que es una asociación. Esto pasa en los * a *, cuando una instancia de una clase se puede relacionar más de una vez con la misma instacia de la otra clase
	- **Agregación**:
		- Asociación * a *, donde uno de los lados es un todo y el otro son las partes que componen ese todo
			- Motor - pieza
			- Receta - ingrediente
		- Se indica con un rombo hueco en la parte del todo
		- Implica ensambleje físico o lógico
		- No se admiten ciclos, no se aplica la propiedad transitiva
	- **Composición**:
		- Tipo de agregación de multiplicidad máxima para el todo
			- Autobús - asiento
			- Disco - pista
		- Implica dependencia de existencia
		- Se indica con un rombo relleno en la parte del todo
		- Si se elimina el todo, se eliminan los componentes