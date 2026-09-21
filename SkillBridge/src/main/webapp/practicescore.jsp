<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);


if(session == null || session.getAttribute("username") == null)
{
    response.sendRedirect("login.jsp");
    return;
}


%>

<!DOCTYPE html>

<html>

<head>

```
<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>SkillBridge - Practice Completed</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

    body {
        margin: 0;
        min-height: 100vh;

        background:
            linear-gradient(rgba(0, 0, 0, 0.65),
                            rgba(0, 0, 0, 0.65)),
            url("images/hero2.avif");

        background-size: cover;
        background-position: center;
        background-attachment: fixed;

        color: white;
    }

    /* Navbar */

    .navbar-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 10;
        background: transparent;
    }

    .navbar-nav .nav-link {
        position: relative;
        margin: 0 10px;
        transition: color 0.3s ease;
    }

    /* Blue underline */

    .navbar-nav .nav-link::after {
        content: "";
        position: absolute;
        left: 50%;
        bottom: 0;
        width: 0;
        height: 2px;
        background-color: #0d6efd;
        transition: all 0.3s ease;
        transform: translateX(-50%);
    }

    .navbar-nav .nav-link:hover::after {
        width: 100%;
    }

    .navbar-nav .nav-link:hover {
        color: #0d6efd;
    }

    /* Result Section */

    .result-container {
        min-height: 100vh;

        display: flex;
        justify-content: center;
        align-items: center;

        padding-top: 80px;
    }

    /* Result Card */

    .result-card {
        width: 100%;
        max-width: 550px;

        padding: 45px 35px;

        text-align: center;

        border-radius: 20px;

        background: rgba(0, 0, 0, 0.4);

        border: 1px solid rgba(255, 255, 255, 0.3);

        backdrop-filter: blur(7px);

        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
    }

    .result-card h1 {
        font-weight: bold;
        margin-bottom: 15px;
    }

    .username {
        font-size: 20px;
        color: rgba(255, 255, 255, 0.9);
    }

    .score-label {
        margin-top: 30px;
        font-size: 18px;
    }

    .score {
        font-size: 55px;
        font-weight: bold;
        margin: 10px 0 25px;
    }

    .result-buttons {
        margin-top: 25px;
    }

    .result-buttons a {
        margin: 5px;
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
                    <a class="nav-link" href="SkillsServlet">
                        Skills
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="ProgressServlet">
                        Progress
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="ProfileServlet">
                        Profile
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


<!-- Result Section -->

<div class="container result-container">

    <div class="result-card">

        <h1>Practice Completed!</h1>

        <p class="username">
            <%= session.getAttribute("username") %>, your practice is completed.
        </p>

        <p class="score-label">
            Your Score
        </p>

        <div class="score">

            <%= request.getAttribute("score") %>
            /
            <%= request.getAttribute("totalQuestions") %>

        </div>

        <p>
            Keep practicing and improve your skills!
        </p>

        <div class="result-buttons">

            <a href="SkillsServlet"
               class="btn btn-light">

                Back to Skills

            </a>

            <a href="ProgressServlet"
               class="btn btn-primary">

                View Progress

            </a>

        </div>

    </div>

</div>


<!-- Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>






<!--  

<body>
<h2>Practice Completed</h2>
<p><%= session.getAttribute("username") %>Yours score</p>
<p><%= request.getAttribute("score") %> / <%= request.getAttribute("totalQuestions") %></p>
<a href="SkillsServlet" >[Back to Skills]</a>
</body>
</html> -->