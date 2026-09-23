<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.skillbridge.model.QuestionModel"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if(session == null || session.getAttribute("username") == null)
    {
        response.sendRedirect("login.jsp");
        return;
    }

    List<QuestionModel> list =
            (List<QuestionModel>) request.getAttribute("questions");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>SkillBridge - Practice</title>

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

.practice-heading {
    margin-top: 50px;
    margin-bottom: 40px;
    text-align: center;
     color:white;
}

.question-card {
    padding: 25px;
    margin-bottom: 25px;
    border-radius: 15px;
    background: rgba(0, 0, 0, 0.23);
    border: 1px solid rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(5px);
     color:white;
}

.question-card h5 {
    margin-bottom: 20px;
}

.option {
    padding: 10px;
    margin-bottom: 8px;
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.1);
}

.option:hover {
    background: rgba(255, 255, 255, 0.2);
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
                data-bs-target="#navbarNav">

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
                    <a class="nav-link" href="LogoutServlet">
                        Logout
                    </a>
                </li>

            </ul>

        </div>

    </div>

</nav>


<!-- Practice Section -->

<div class="container">

    <div class="practice-heading">

        <h1>Practice</h1>

        <p>Test your knowledge</p>

    </div>
     <% String email= (String)session.getAttribute("email");%>
	<form action="PracticeServlet" method="post" name="Questions" class="form-group">

	<input type="hidden" name="skillId"
       value="<%= request.getAttribute("skillId") %>">
       
       <input type="hidden" name="email"
       value="<%= email %>">
     
    <%
        for(QuestionModel q : list)
        {
    %>

    <div class="question-card">

        <h5>
            <%= q.getQuestionText() %>
        </h5>

        <div class="option">
            <input type="radio" class="from-control"
                   name="question<%= q.getQuestionId() %>"
                   value="A" required>

            A. <%= q.getOptionA() %>
        </div>

        <div class="option">
            <input type="radio" class="from-control"
                   name="question<%= q.getQuestionId() %>"
                   value="B">

            B. <%= q.getOptionB() %>
        </div>

        <div class="option">
            <input type="radio" class="from-control"
                   name="question<%= q.getQuestionId() %>"
                   value="C">

            C. <%= q.getOptionC() %>
        </div>

        <div class="option">
            <input class="from-control" type="radio"
                   name="question<%= q.getQuestionId() %>"
                   value="D">

            D. <%= q.getOptionD() %>
        </div>

    </div>

    <%
        }
    %>

    <div class="text-center mb-5">

        <button type="submit" class="btn btn-light">
            Submit
        </button>

    </div>
    </form>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>