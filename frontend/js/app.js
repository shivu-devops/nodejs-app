const api = ""

async function loadTasks() {

 const res = await fetch(api + "/tasks")
 const tasks = await res.json()
 const list = document.getElementById("taskList")
 list.innerHTML = ""
 tasks.forEach(t => {
  const li = document.createElement("li")
  li.innerText = t.title
  list.appendChild(li)
 })
}

async function addTask() {
 const input = document.getElementById("taskInput")
 if(!input.value) return
 await fetch(api + "/tasks", {
  method: "POST",
  headers: {
   "Content-Type": "application/json"
  },
  body: JSON.stringify({
   title: input.value
  })
 })
 input.value = ""
 loadTasks()
}

loadTasks()