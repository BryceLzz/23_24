#MAIN

1. **Importación de Bibliotecas:**
   - Se importa el módulo `gi` para trabajar con GObject Introspection, que es una parte fundamental de GTK para Python.
   - Se especifica que se requiere la versión 4.0 de la biblioteca GTK.
   - Se importa la clase `Gtk` del módulo `gi.repository`, que proporciona la funcionalidad principal para la interfaz gráfica de usuario en GTK.

```python
import gi
gi.require_version('Gtk', '4.0')
from gi.repository import Gtk
```

2. **Importación de la Clase de la Aplicación y Gettext:**
   - Se importa la clase `CocktailApp` desde el módulo `view`, que es la clase principal que representa tu aplicación GTK.
   - Se importa el módulo `gettext`, que es utilizado para la internacionalización y localización de tu aplicación.

```python
from view import CocktailApp
import gettext
```

3. **Función Principal (main):**
   - Se define la función `main()`, que será la función principal de tu script.
   - `locale_dir` se establece como el directorio donde se encuentran los archivos de traducción (archivos .mo).
   - `gettext.bindtextdomain('myapp', locale_dir)` y `gettext.textdomain('myapp')` se utilizan para configurar la localización de gettext. Estas funciones indican dónde buscar los archivos de traducción y establecen el dominio de texto para tu aplicación.

```python
def main():
    locale_dir = 'locale'
    gettext.bindtextdomain('myapp', locale_dir)
    gettext.textdomain('myapp')
```

4. **Instanciación y Ejecución de la Aplicación:**
   - Se instancia la clase `CocktailApp`, que es la aplicación principal de tu interfaz gráfica. Esta clase debe ser la clase principal de tu aplicación GTK.
   - `app.run(None)` inicia el bucle principal de la aplicación GTK. El argumento `None` representa el estado inicial de la aplicación, que en este caso no se está utilizando.

```python
    app = CocktailApp()
    app.run(None)
```

5. **Condición para Ejecutar el Main:**
   - `if __name__ == "__main__":` asegura que el bloque de código dentro de esta condición solo se ejecute si este script se ejecuta directamente y no se importa como un módulo en otro script.

```python
if __name__ == "__main__":
    main()
```

En resumen, este script principal configura la localización para la internacionalización de tu aplicación, instancia la clase principal de la interfaz gráfica (`CocktailApp`), y luego inicia el bucle principal de la aplicación GTK. La aplicación estará esperando eventos y responderá según la lógica que hayas implementado en tu clase principal de la aplicación.

#VISTA

### Clase `ResultWindow`:
- Representa la ventana que muestra los resultados de una búsqueda.
- Se instancia con el término de búsqueda y el tipo de búsqueda (`search_term` y `search_type`).
- Se crea una interfaz de usuario que incluye una etiqueta para mostrar información sobre la búsqueda, una cuadrícula para mostrar los resultados y un botón para cerrar la ventana.
- Utiliza un hilo para realizar la búsqueda en segundo plano y actualizar la interfaz de usuario con los resultados.
- Los resultados pueden ser cócteles o ingredientes, y se crean botones para cada uno de ellos. Al hacer clic en un botón, se inicia un hilo para obtener detalles adicionales del cóctel o buscar cócteles con el ingrediente seleccionado.

### Clase `IngredientsWindow`:
- Representa la ventana que muestra los ingredientes de un cóctel seleccionado.
- Se instancia con el nombre del cóctel y la lista de ingredientes.
- Muestra una etiqueta con el nombre del cóctel y una ventana desplazable con la lista de ingredientes. También incluye un botón para cerrar la ventana.

### Clase `CocktailsWindow`:
- Representa la ventana que muestra los cócteles que contienen un ingrediente seleccionado.
- Se instancia con el nombre del ingrediente y la lista de cócteles.
- Muestra una etiqueta con el nombre del ingrediente y una ventana desplazable con la lista de cócteles. También incluye un botón para cerrar la ventana.

### Clase `ErrorOccurredWindow`:
- Representa la ventana que muestra mensajes de error.
- Se instancia con un mensaje de error.
- Muestra una etiqueta con el mensaje de error y un botón para cerrar la ventana.

### Clase `RandomCocktailWindow`:
- Representa la ventana que muestra un cóctel aleatorio.
- Incluye una etiqueta para mostrar el cóctel aleatorio actual y un botón para obtener uno nuevo. También tiene un botón para cerrar la ventana.

### Clase `CocktailAppWindow`:
- Representa la ventana principal de la aplicación.
- Incluye un cuadro combinado (`ComboBoxText`) para seleccionar el tipo de búsqueda (cóctel o ingrediente), una barra de búsqueda y un botón para realizar búsquedas.
- También incluye un botón para mostrar un cóctel aleatorio.
- Al hacer clic en el botón de búsqueda, se inicia una búsqueda según el término y el tipo seleccionados. Se manejan errores como la falta de términos de búsqueda o problemas de conexión.

### Clase `CocktailApp`:
- Representa la aplicación en sí misma y se encarga de gestionar la inicialización y ejecución de la interfaz gráfica de usuario.

En resumen, la vista de tu aplicación crea ventanas y elementos de interfaz de usuario que permiten al usuario realizar búsquedas de cócteles, ver detalles de cócteles, obtener cócteles con ingredientes específicos, y mostrar cócteles aleatorios. Cada ventana tiene su propia lógica para manejar eventos y mostrar información relevante al usuario.

#MODELO

### Clase `TheCocktailDBAPI`:

- Contiene métodos estáticos que interactúan con la API pública de TheCocktailDB para obtener información sobre cócteles e ingredientes.

#### Método `search_cocktails(search_term)`:
- Realiza una búsqueda de cócteles por nombre. Toma un término de búsqueda como argumento.
- Hace una solicitud a la API de TheCocktailDB y devuelve los datos brutos de los cócteles encontrados.

#### Método `search_ingredients(search_term)`:
- Realiza una búsqueda de ingredientes por nombre. Toma un término de búsqueda como argumento.
- Hace una solicitud a la API de TheCocktailDB y devuelve los datos brutos de los ingredientes encontrados.

#### Método `get_cocktail_details(cocktail_name)`:
- Obtiene detalles adicionales de un cóctel específico por nombre. Toma el nombre del cóctel como argumento.
- Hace una solicitud a la API de TheCocktailDB y devuelve los ingredientes y medidas del cóctel.

#### Método `search_cocktails_by_ingredient(ingredient_name)`:
- Busca cócteles que contengan un ingrediente específico. Toma el nombre del ingrediente como argumento.
- Hace una solicitud a la API de TheCocktailDB y devuelve los datos brutos de los cócteles que contienen el ingrediente.

#### Método `get_random_cocktail()`:
- Obtiene un cóctel aleatorio.
- Hace una solicitud a la API de TheCocktailDB y devuelve los datos brutos del cóctel aleatorio.

En resumen, la clase `TheCocktailDBAPI` en el modelo proporciona métodos para realizar consultas a la API externa (TheCocktailDB) y obtener datos relevantes sobre cócteles e ingredientes. Estos métodos encapsulan la lógica de acceso a la API y la manipulación de datos. El modelo, en este caso, sirve como un intermediario entre la vista/controlador y la fuente de datos externa.

#CONTROLADOR

### Clase `CocktailController`:

#### Método `check_network_connection()`:
- Realiza una solicitud de prueba a una URL (en este caso, al sitio web de TheCocktailDB) para verificar la conexión de red.
- Retorna `True` si la conexión es exitosa (código de estado 200), o `False` si hay un problema de conexión.

#### Método `perform_search(search_term, search_type)`:
- Realiza una búsqueda de cócteles o ingredientes según el término de búsqueda y el tipo de búsqueda especificados.
- Llama a los métodos correspondientes en la clase `TheCocktailDBAPI` del modelo para realizar la búsqueda.
- Retorna los resultados de la búsqueda.

#### Método `fetch_cocktail_details(cocktail)`:
- Obtiene detalles adicionales de un cóctel específico.
- Llama al método correspondiente en la clase `TheCocktailDBAPI` para obtener los ingredientes y medidas del cóctel.
- Retorna los ingredientes del cóctel.

#### Método `fetch_cocktails_by_ingredient(ingredient_name)`:
- Obtiene una lista de cócteles que contienen un ingrediente específico.
- Llama al método correspondiente en la clase `TheCocktailDBAPI` para realizar la búsqueda.
- Retorna los resultados de la búsqueda.

#### Método `fetch_random_cocktail()`:
- Obtiene un cóctel aleatorio.
- Llama al método correspondiente en la clase `TheCocktailDBAPI` para obtener el cóctel aleatorio.
- Retorna el cóctel aleatorio.

En resumen, la clase `CocktailController` actúa como una interfaz entre la vista y el modelo. Maneja las interacciones del usuario, como búsquedas y selecciones, y utiliza métodos del modelo para realizar operaciones específicas, como obtener detalles de cócteles, buscar cócteles por ingredientes y obtener cócteles aleatorios. La información recuperada del modelo se pasa de vuelta a la vista para su presentación al usuario.