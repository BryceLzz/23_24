
#SEMANA 1
##Presentación
###Cualificación
* 60% examen final - aprobado obligatorio
* 40% prácticas - aprobado obligatorio

###Profesores
* Sonia Suárez - sonia.suarez@udc.es

##Teoría
###Tiempo y Esfuerzo
* El tiempo se calcula como la suma de los días que dura la tarea.
* El esfuerzo se calcula como la suma de los productos del tiempo de cada tarea por los recursos que le son asignados.

###Tareas condicionadas por el tiempo o el esfuerzo
* CE - E
* CT - T

Proyect calcula mál el tiempo ya que recursos que trabajan a menos del 100% los cuenta como si trabajaran al 100%.

#SEMANA 3
##Creación de la fase 0
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

#SEMANA 6
##Cuestionario
En el cuestionario se deben valorar todas las opciones y compararlas para intentar decidir cuál es la mejor y el porqué. No se deben de emplear porcentajes para indicar la asignación de recursos.

##Repaso nivelación
Crear dos tareas para representar ERS, asignarle a la primera el 100% de los recursos y a la segunda el 50% y el otro 50% se destina al DUser.

##Recurso material : Variables
###Dietas
Dinero empleado para pagar a los trabajadores a para poder cubrir sus gastos diarios (alojamiento, comida...).
Se dan de alta en Project como un recurso material y se indica el coste que implica.
Se crea una relación entre ella y las tareas que la empleen y se indica el número de veces que se emplea (tasa de consumo), ej: Dieta[5/d<]. También se puede indicar algo mensual, como el alquiler, ej: Alquiler[1/mes]. Project calcula el producto de la tasa de consumo por el número de días que dura la tarea y lo indica. En caso de que los recursos tengan dietas distintas con distintos costes, se deben crear varias dietas, una para cada caso. En nuestro caso, se debe asignar una dieta a Instalación (hecho). En caso de querer asignarla a dos tareas, se debe crear una hamaca y asignarle la dieta a ella.

##Recurso apero
No trabaja pero puede estar sobreasignado.
Se emplea en Pruebas de aceptación, usabilidad, sistema.
Ej: se alquila un servidor (AWS) que consume 0.20€/h y tiene una tasa de consumo de [1/h].
Las pruebas de usabilidad y de sistema no tienen porque realizarse una tras otra, si no que se pueden realizar a la vez, pero el servidor solo se puede emplear en una de ellas a la vez. Esto debe poder controlarse para que no pueda coincidir. En Project no existe el tipo de recurso apero, entonces debe crearse como un recurso de trabajo, aunque esto no tenga sentido porque en sí el sevidor no va a realizar ningún trabajo. Aquí se van a realizar un montón de piltrafas para poder engañar a Project. A la hora de asignar el recurso del servidor a una tarea, se debe indicar que este se emplea al 1%, para que Project sepa que lo usa, pero esto perjudica mínimamente al tiempo del proyecto. Esto se traduce en que el servidor solo trabaja 0.8 h/d. Aunque esto no sea verdad, es como se debe indicar, ya que no importa que la asignación esté mal representada porque al tener que engañar a Project, es la única solución. Para indicar la sobreasignación, se debe modificar la capacidad del recurso al 1% también, método que de nuevo no tiene sentido pero es la única forma de engañarlo. Por último, al haber cambiado esto, se debe modificar el coste, ya que Project calcula el coste como la capacidad por la tasa, entonces al estar asignado al 1%, sería el 1% de 0.20 cents, por lo que se debe de cambiar la tasa para que el producto sea 0.20 cents, es decir, 20€/h. 

#SEMANA 8
##Seguimiento
50% previsto. Se debe actualizar el proyecto, pero sin pasarse. Para simular esto en Project, el volcado debe de hacerse a mano, ya que la automatización no la incluye Project. Esto es muy tedioso y da lugar a muchos fallos. Es obligatoria actualizar estrictamente en orden cronológico.
#
Dentro de los datos actuales, solo importan los datos previstos y lo que finalmente son los datos reales. Estos dos son los únicos que figuran en el histórico.

###Volcado a grosso modo
Solo interesa saber si la tarea está hecha o no. No importa si ha durado más o menos de lo previsto ni si ha habido incidentes ni nada. En Project se marca o como que está toda hecha (100%) o no hecha (0%). Esto puede implicar que se envíe mala información al histórico, porque puede ser que la tarea no se haya terminado en tiempo.

###Volcado semidetallado
Se cambia el valor previsto por el real en el tiempo de trabajo. Si la tarea no está finalizada, no se marca y se actualizan los valores a lo actual, si sí lo está, se marca como 100% de completado. Al cambiar el tiempo, Project asume que los trabajadores han hecho el mismo esfuerzo, por lo que divide entre el número de trabajadores el tiempo real.

###Volcado a detallado
En contra al semidetallado, en este se indica cuánto trabajo ha realizado cada uno de los trabajadores.

##Calendarios
En el calendario del proyecto se puede indicar el horario de trabajo, si un día es festivo, si se trabaja los sábados... 
Pero lo que interesa es que a la hora de indicar una baja o unas vacaciones, se puede acceder al calendario propio de cada recurso y así modificar su disponibilidad. Se pueden cambiar hasta las horas trabajadas el mismo día que se puso de baja.

##Formulario
###Caso 1
Se debe adelantar el hito.

###Caso 2
Irse al uso de las tareas, vamos al ERS2, se cambia el tiempo trabajado en ese día y luego los siguientes días se marcan a 0 de trabajo. Se marcan a mano los tiempos de los días siguientes que ha trabajado para recuperarlo.

###Caso 3
Se cambia el calendario de la tarea y se indica el motivo de la pausa.

###Caso 4
Añadir 2 días de trabajo en los analistas.

###Caso 7
Indicar la baja de T1, borrar el trabajo de T1 y dárselo a T2.

###Caso 8
Indicar en el calendario del proyecto.