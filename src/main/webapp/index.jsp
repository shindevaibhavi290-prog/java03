<%@ page import="java.util.*" %>
<%
    // Get tasks from session
    List<String> tasks = (List<String>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    // Add task
    String newTask = request.getParameter("task");
    if (newTask != null && !newTask.trim().isEmpty()) {
        tasks.add(newTask);
    }

    // Delete task
    String deleteIndex = request.getParameter("delete");
    if (deleteIndex != null) {
        int index = Integer.parseInt(deleteIndex);
        if (index >= 0 && index < tasks.size()) {
            tasks.remove(index);
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>To-Do List</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        h2 { color: #333; }
        input[type=text] { padding: 8px; width: 250px; }
        button { padding: 8px 12px; }
        ul { list-style: none; padding: 0; }
        li { margin: 8px 0; }
        a { color: red; margin-left: 10px; text-decoration: none; }
    </style>
</head>
<body>

<h2>📝 To-Do List</h2>

<form method="post">
    <input type="text" name="task" placeholder="Enter new task" required>
    <button type="submit">Add</button>
</form>

<ul>
<%
    for (int i = 0; i < tasks.size(); i++) {
%>
    <li>
        <%= tasks.get(i) %>
        <a href="index.jsp?delete=<%= i %>">Delete</a>
    </li>
<%
    }
%>
</ul>

</body>
</html>
