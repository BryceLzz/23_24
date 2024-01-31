document.addEventListener('DOMContentLoaded', function () {
    // Función para agregar una nueva tarea
    window.addTask = function () {
      var taskInput = document.getElementById('taskInput');
      var taskList = document.getElementById('taskList');
      var activeTaskCount = document.getElementById('activeTaskCount');
  
      if (taskInput.value.trim() !== '') {
        // Crear elemento de lista
        var listItem = document.createElement('li');
        listItem.setAttribute('role', 'listitem');
  
        // Crear contenedor para la tarea
        var taskContainer = document.createElement('div');
        taskContainer.setAttribute('role', 'group');
  
        // Crear checkbox para marcar como completada
        var checkbox = document.createElement('input');
        checkbox.setAttribute('type', 'checkbox');
        checkbox.setAttribute('aria-label', 'Marcar como completada');
        checkbox.addEventListener('click', function () {
          markCompleted(checkbox);
        });
  
        // Crear span para el nombre de la tarea
        var taskName = document.createElement('span');
        taskName.classList.add('bold-text');
        taskName.textContent = taskInput.value;
  
        // Agregar checkbox y nombre de tarea al contenedor
        taskContainer.appendChild(checkbox);
        taskContainer.appendChild(taskName);
  
        // Crear contenedor para la descripción
        var descriptionBox = document.createElement('div');
        descriptionBox.classList.add('description-box');
  
        // Crear párrafo de descripción corta
        var shortDescription = document.createElement('p');
        shortDescription.classList.add('short-description');
        shortDescription.textContent = 'Descripción corta de ' + taskInput.value;
  
        // Agregar descripción corta al contenedor
        descriptionBox.appendChild(shortDescription);
  
        // Crear contenedor para la descripción larga desplegable
        var detailsContainer = document.createElement('details');
  
        // Crear un resumen para el desplegable
        var summary = document.createElement('summary');
        summary.textContent = 'Ver más';
  
        // Crear párrafo para la descripción larga
        var longDescription = document.createElement('p');
        longDescription.classList.add('long-description');
        longDescription.textContent =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel dapibus justo. Nulla facilisi. Vivamus facilisis diam in orci sollicitudin, vel dapibus leo accumsan. Suspendisse eget ex a elit fringilla dapibus vel eu leo. Quisque fermentum hendrerit mi at tincidunt. Sed sollicitudin mauris eu magna vulputate tristique. Proin eu odio ut tellus commodo facilisis. Integer aliquet, metus vel consectetur feugiat, metus erat fringilla nunc, nec bibendum odio lectus nec leo.';
  
        // Agregar párrafo al contenedor desplegable
        detailsContainer.appendChild(longDescription);
  
        // Agregar resumen y contenedor al bloque de descripción
        descriptionBox.appendChild(detailsContainer);
        detailsContainer.appendChild(summary);
  
        // Crear span para la fecha límite
        var deadline = document.createElement('span');
        deadline.classList.add('deadline');
        deadline.textContent = 'Fecha límite: 2023-12-31';
  
        // Crear contenedor para acciones
        var actionsContainer = document.createElement('div');
        actionsContainer.classList.add('actions');
  
        // Crear botones de editar y borrar
        var editButton = document.createElement('button');
        editButton.textContent = 'Editar';
        editButton.setAttribute('aria-label', 'Editar tarea');
        editButton.addEventListener('click', function () {
          editTask(listItem);
        });
  
        var deleteButton = document.createElement('button');
        deleteButton.textContent = 'Borrar';
        deleteButton.setAttribute('aria-label', 'Borrar tarea');
        deleteButton.addEventListener('click', function () {
          deleteTask(listItem);
        });
  
        // Agregar botones al contenedor de acciones
        actionsContainer.appendChild(editButton);
        actionsContainer.appendChild(deleteButton);
  
        // Agregar todos los elementos al elemento de lista
        listItem.appendChild(taskContainer);
        listItem.appendChild(descriptionBox);
        listItem.appendChild(deadline);
        listItem.appendChild(actionsContainer);
  
        // Agregar elemento de lista a la lista principal
        taskList.appendChild(listItem);
  
        // Limpiar el campo de entrada
        taskInput.value = '';
  
        // Actualizar el contador de tareas activas
        updateActiveTaskCount();
      }
    };
  
    // Función para marcar una tarea como completada
    window.markCompleted = function (checkbox) {
      var listItem = checkbox.closest('li');
      var taskName = listItem.querySelector('.bold-text');
  
      if (checkbox.checked) {
        taskName.classList.add('completed');
      } else {
        taskName.classList.remove('completed');
      }
        // Actualizar el contador de tareas activas
        updateActiveTaskCount();
    };
  
    // Función para marcar todas las tareas como completadas
    window.markAllCompleted = function () {
      var checkboxes = document.querySelectorAll('input[type="checkbox"]');
      checkboxes.forEach(function (checkbox) {
        checkbox.checked = true;
        markCompleted(checkbox);
      });
    };
  
    // Función para editar una tarea
    window.editTask = function (listItem) {
      var taskName = listItem.querySelector('.bold-text');
      var newTaskName = prompt('Editar tarea:', taskName.textContent);
  
      if (newTaskName !== null) {
        taskName.textContent = newTaskName;
      }
  
      // Actualizar el contador de tareas activas
      updateActiveTaskCount();
    };
  
    // Función para borrar una tarea
    window.deleteTask = function (taskItem) {
        taskItem.remove();
        updateActiveTaskCount();
      };
  
    // Función para borrar todas las tareas completadas
    window.deleteCompleted = function () {
      var completedItems = document.querySelectorAll('.completed');
      completedItems.forEach(function (completedItem) {
        var listItem = completedItem.closest('li');
        listItem.remove();
      });
  
      // Actualizar el contador de tareas activas
      updateActiveTaskCount();
    };
  
    // Función para actualizar el contador de tareas activas
    function updateActiveTaskCount() {
      var activeTaskCount = document.getElementById('activeTaskCount');
      var incompleteItems = document.querySelectorAll('li:not(.completed)');
      activeTaskCount.textContent = incompleteItems.length;
    }
  });
  