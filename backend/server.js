const express = require("express")
const cors = require("cors")
const path = require("path")

const app = express()

app.use(cors())
app.use(express.json())

let tasks = []

// serve frontend files
app.use(express.static(path.join(__dirname, "../frontend")))

// health endpoint for monitoring
app.get("/health", (req, res) => {
    res.json({
        status: "UP"
   })
})

// get all tasks
app.get("/tasks", (req, res) => {
    res.json(tasks)
})

// add task
app.post("/tasks", (req, res) => {
    const task = {
        id: Date.now(),
        title: req.body.title
}
    tasks.push(task)
    res.json(task)
})

// fallback route
app.get("*", (req, res) => {
    res.sendFile(path.join(__dirname, "../frontend/index.html"))
})

app.listen(3000, () => {
    console.log("App running on port 3000")
})