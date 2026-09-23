<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillBridge Dashboard</title>
    <!-- Bootstrap CSS -->
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
        

.dashboard-content {
    color: white;
}

.dashboard-card {
    padding: 30px;
    border-radius: 15px;

    background: rgba(0, 0, 0, 0.3);

    border: 1px solid rgba(255, 255, 255, 0.3);

    color: white;

    backdrop-filter: blur(5px);

    transition: transform 0.3s ease,
                background 0.3s ease;
}

.dashboard-card:hover {
    transform: translateY(-8px);
    background: rgba(0, 0, 0, 0.3);
}

.dashboard-card h3 {
    margin-bottom: 15px;
}

.dashboard-card p {
    min-height: 60px;
}


    </style>
         
</head>


<body>
    <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-overlay">
    <div class="container">

        <a class="navbar-brand text-white fw-bold" href="dashboard.jsp">
            SkillBridge
        </a>

        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link text-white" href="dashboard.jsp">
                        Home
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white" href="SkillsServlet">
                        Skills
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white" href="SkillsServlet">
                        Practice
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white" href="ProgressServlet">
                        Progress
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white" href="LogoutServlet">
                        Logout
                    </a>
                </li>

            </ul>

        </div>
    </div>
</nav>

 
  <%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);

    if(session == null || session.getAttribute("email") == null)
    {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");
%>
<!--  Body -->
<section class="container dashboard-content mt-5">

    <div class="text-center ">

        <h1>Welcome, <%= username %> 👋</h1>

        <p class="lead">
            Learn • Practice • Track • Grow
        </p>

       
        

    </div>
    <!-- Dashboard Cards -->
<div class="container mt-5">

    <div class="row g-4 justify-content-center">

        <!-- Skills Card -->
         <div class="col-md-6 col-lg-5">
            <div class="dashboard-card text-center">

                <h3>Skills</h3>

                <p>
                    Learn and improve your technical skills
                    step by step.
                </p>

                <a href="SkillsServlet" class="btn btn-light">
                    Explore Skills
                </a>

            </div>
        </div>


        <!-- Practice Card -->
         <div class="col-md-6 col-lg-5">
            <div class="dashboard-card text-center">

                <h3>Practice</h3>

                <p>
                    Practice Java and interview questions
                    to improve your preparation.
                </p>

                <a href="SkillsServlet" class="btn btn-light">
                    Start Practice
                </a>

            </div>
        </div>


        <!-- Progress Card -->
         <div class="col-md-6 col-lg-5">
            <div class="dashboard-card text-center">

                <h3>Progress</h3>

                <p>
                    Track your learning and practice
                    progress.
                </p>

                <a href="ProgressServlet" class="btn btn-light">
                    View Progress
                </a>

            </div>
        </div>


        <!-- Profile Card -->
        <div class="col-md-6 col-lg-5">
            <div class="dashboard-card text-center">

                <h3>Profile</h3>

                <p>
                    View and manage your SkillBridge
                    profile.
                </p>

                <a href="ProfileServlet" class="btn btn-light">
                    View Profile
                </a>

            </div>
        </div>

    </div>

</div>

</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>