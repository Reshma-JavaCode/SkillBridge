<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.skillbridge.model.ProgressModel"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);


if(session == null || session.getAttribute("username") == null)
{
    response.sendRedirect("login.jsp");
    return;
}

List<ProgressModel> list =
        (List<ProgressModel>) request.getAttribute("progresslist");


%>

<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>SkillBridge - Progress</title>

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

    /* Progress Section */

    .progress-container {
        padding-top: 120px;
        padding-bottom: 50px;
    }

    .progress-heading {
        text-align: center;
        margin-bottom: 40px;
    }

    .progress-heading h1 {
        font-weight: bold;
    }

    .progress-heading p {
        color: rgba(255, 255, 255, 0.85);
    }

    /* Progress Table */

    .progress-table {
        background: rgba(0, 0, 0, 0.35);
        border-radius: 15px;
        overflow: hidden;
        backdrop-filter: blur(5px);
        border: 1px solid rgba(255, 255, 255, 0.3);
    }

    .progress-table table {
        margin-bottom: 0;
    }

    .progress-table th,
    .progress-table td {
        color: white;
        background: transparent;
        border-color: rgba(255, 255, 255, 0.25);
        padding: 15px;
    }

    .progress-table th {
        font-weight: bold;
    }

    .score {
        font-weight: bold;
    }
	.progress {
    height: 25px;
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
                    <a class="nav-link active" href="ProgressServlet">
                        Progress
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


<!-- Progress Section -->

<div class="container progress-container">

    <div class="progress-heading">

        <h1>Your Progress</h1>

        <p>Track your practice performance</p>

    </div>


    <div class="progress-table">

        <table class="table table-hover">

            <thead>

                <tr>
                    <th>Skill</th>
                    <th>Attempted</th>
                    <th>Correct</th>
                    <th>Score</th>
                    <th>Percentage</th>
                </tr>

            </thead>

            <tbody>

                <%
                    for(ProgressModel i : list)
                    {
                    	double percentage =
                    	        ((double) i.getQuestionsCorrect()
                    	        / i.getQuestionsAttempted()) * 100;
                %>

                <tr>

                    <td>
                        <%= i.getSkillName() %>
                    </td>

                    <td>
                        <%= i.getQuestionsAttempted() %>
                    </td>

                    <td>
                        <%= i.getQuestionsCorrect() %>
                    </td>

                    <td class="score">
                        <%= i.getQuestionsCorrect() %>
                        /
                        <%= i.getQuestionsAttempted() %>
                    </td>
                    <td>
                    <div class="progress">
                    <div class="progress-bar" role="progressbar" style="width: <%= percentage %>%">

       				 <%= String.format("%.0f", percentage) %>%

    			</div></div>
    			</td>

                </tr>

                <%
                    }
                %>

            </tbody>

        </table>

    </div>

</div>


<!-- Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>
