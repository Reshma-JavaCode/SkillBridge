<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.skillbridge.model.SkillModel"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if(session == null || session.getAttribute("username") == null)
    {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");

    List<SkillModel> list =
            (List<SkillModel>) request.getAttribute("skillsList");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>SkillBridge - Skills</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
<link rel="stylesheet" href="css/navbar1.css">
     
<style>

 body {
             min-height: 100vh;

    background-image:
        linear-gradient(rgba(105, 105, 135, 0.5),
                        rgba(105, 105, 180, 0.5)),
        url("images/hero2.avif");

    background-size: cover;
    background-position: center;

    display: flex;
    align-items: center;
    justify-content: center;
}


/* Page heading */

.skills-heading {
    margin-top: 50px;
    margin-bottom: 40px;
    text-align: center;
}

.skills-heading h1 {
    font-weight: bold;
     color: white;
}

.skills-heading p {
    color: rgba(255, 255, 255, 0.85);
    font-size: 25px;
}

/* Skill cards */

.skill-card {
    padding: 30px;
    border-radius: 15px;
    background: rgba(0, 0, 0, 0.3);
    border: 1px solid rgba(255, 255, 255, 0.3);
    color: white;
    backdrop-filter: blur(5px);
    transition: transform 0.3s ease, background 0.3s ease;
    height: 100%;
}

.skill-card:hover {
    transform: translateY(-8px);
    background: rgba(0, 0, 0, 0.6);
}

.skill-card h3 {
    margin-bottom: 15px;
}

.skill-card p {
    min-height: 50px;
    color: rgba(255, 255, 255, 0.85);
}

</style>

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark navbar-overlay">

    <div class="container">

        <a class="navbar-brand fw-bold" href="dashboard.jsp">
            SkillBridge
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav"
                aria-controls="navbarNav"
                aria-expanded="false"
                aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">
                        Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="SkillsServlet">
                        Skills
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">
                        Logout
                    </a>
                </li>

            </ul>

        </div>

    </div>

</nav>


<!-- Skills Section -->

<div class="container">

    <div class="skills-heading">

        <h1>Skills</h1>

        <p>Choose a skill and start learning</p>

    </div>


    <div class="row g-4">

        <%
            for(SkillModel i : list)
            {
        %>

        <div class="col-md-6">

            <div class="skill-card">

                <h3><%= i.getSkillName() %></h3>

                <p>
                    <%= i.getDescription() %>
                </p>

                <a href="QuestionServlet?skillId=<%= i.getSkillId() %>" class="btn btn-light">
                    Practice
                </a>

            </div>

        </div>

        <%
            }
        %>

    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>