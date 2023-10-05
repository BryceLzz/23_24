
#SEMANA 1
##PRESENTACIÓN
###Cualificación
* 60% examen final - aprobado obligatorio
* 40% prácticas - aprobado obligatorio

###Profesores
* Sonia Suárez - sonia.suarez@udc.es

##TEORÍA
###Tiempo y Esfuerzo
* El tiempo se calcula como la suma de los días que dura la tarea.
* El esfuerzo se calcula como la suma de los productos del tiempo de cada tarea por los recursos que le son asignados.

###Tareas condicionadas por el tiempo o el esfuerzo
* CE - E
* CT - T

Proyect calcula mál el tiempo ya que recursos que trabajan a menos del 100% los cuenta como si trabajaran al 100%.

#SEMANA 3
##CREACIÓN DE LA FASE 0
###Pasos
* Seleccionar proveedores
* Pedirles presupuesto
* Esperar 7 días por lo pres.
* Analizar y decidir
* Comprar
* Tienen 3 días para obtenerlos
* Tienen 4 días para I&C
* Revisar

###Personal
* Alguien de diseño y alguien de desarrollo (DS1)

###Orden
* [ ] Tarea
* { } Hito
* () Demoras
* x Nº que nosotros podemos escoger

[ SP ] ====> [ PP ] ==(FC + 7d)==> [ AD ] ==(FC + xd)==> { Compra } ==(FC + 3d)==> { Obtención } ==(DC + 5d)==> { I&C } ====> [ Rev ]

###Gastos
Se gastan 5000€ en la compra de los productos.

###Representación
* El hito no se representa como un hito, si no como una tarea de duración 0 días.
* Los gastos se representan como recursos de tipo Costo. En la hoja recursos se añade, pero no se añade el coste hasta que no se asocia el gasto a la tarea.

###Como asociar dos tareas que el son CC Y FF a la vez
Se debe emplear un hito como término medio entre las relaciones. Para el ERS y el DUserM, se emplea una CC entre ellas dos, y un FC entre ERS y un hito y un FC entre el hito y DUserM.
