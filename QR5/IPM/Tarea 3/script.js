function addTask() {
    var taskInput = document.getElementById("taskInput");
    var taskList = document.getElementById("taskList");
  
    if (taskInput.value.trim() !== "") {
      var li = document.createElement("li");
      li.innerHTML = '<input type="checkbox" onclick="markCompleted(this)">' + taskInput.value +
                     '<button onclick="editTask(this)">Editar</button>' +
                     '<button onclick="deleteTask(this)">Borrar</button>';
      taskList.appendChild(li);
      taskInput.value = "";
      updateActiveTaskCount();
    }
  }
  
  function markCompleted(checkbox) {
    var li = checkbox.parentNode;
    li.classList.toggle("completed", checkbox.checked);
    updateActiveTaskCount();
  }
  
  function editTask(button) {
    var li = button.parentNode;
    var newText = prompt("Editar tarea:", li.firstChild.nodeValue);
    if (newText !== null) {
      li.firstChild.nodeValue = newText;
    }
  }
  
  function deleteTask(button) {
    var li = button.parentNode;
    li.parentNode.removeChild(li);
    updateActiveTaskCount();
  }
  
  function markAllCompleted() {
    var checkboxes = document.querySelectorAll("#taskList input[type='checkbox']");
    checkboxes.forEach(function(checkbox) {
      checkbox.checked = true;
      var li = checkbox.parentNode;
      li.classList.add("completed");
    });
    updateActiveTaskCount();
  }
  
  function deleteCompleted() {
    var completedTasks = document.querySelectorAll("#taskList .completed");
    completedTasks.forEach(function(task) {
      task.parentNode.removeChild(task);
    });
    updateActiveTaskCount();
  }
  
  function updateActiveTaskCount() {
    var activeTasks = document.querySelectorAll("#taskList li:not(.completed)").length;
    document.getElementById("activeTaskCount").innerText = activeTasks;
  }
  