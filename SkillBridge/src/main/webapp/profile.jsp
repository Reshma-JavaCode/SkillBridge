<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.skillbridge.model.UserModel"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

if(session == null || session.getAttribute("username") == null)
{
    response.sendRedirect("login.jsp");
    return;
}

UserModel um = (UserModel) request.getAttribute("userdata");

%>

<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>SkillBridge - Profile</title>

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
    color:white;
}


    /* Profile Section */

    .profile-container {
        padding-top: 120px;
        padding-bottom: 50px;
    }

    .profile-heading {
        text-align: center;
        margin-bottom: 35px;
    }

    .profile-heading h1 {
        font-weight: bold;
    }

    .profile-heading p {
        color: rgba(255, 255, 255, 0.85);
    }

    /* Profile Card */

    .profile-card {
        max-width: 650px;
        margin: auto;

        padding: 35px;

        border-radius: 18px;

        background: rgba(0, 0, 0, 0.35);

        border: 1px solid rgba(255, 255, 255, 0.3);

        backdrop-filter: blur(6px);
    }

    .profile-row {
        display: flex;
        justify-content: space-between;
        align-items: center;

        padding: 15px 0;

        border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    }

    .profile-row:last-child {
        border-bottom: none;
    }

    .profile-label {
        font-weight: bold;
    }

    .profile-value {
        color: rgba(255, 255, 255, 0.85);
    }

    .profile-button {
        margin-top: 25px;
        text-align: center;
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
                    <a class="nav-link active" href="ProfileServlet">
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


<!-- Profile Section -->

<div class="container profile-container">

    <div class="profile-heading">

        <h1>My Profile</h1>

        <p>View your SkillBridge account details</p>

    </div>


    <div class="profile-card">

        <div class="profile-row">

            <span class="profile-label">
                Username
            </span>

            <span class="profile-value">
                <%= um.getUsername() %>
            </span>

        </div>


        <div class="profile-row">

            <span class="profile-label">
                First Name
            </span>

            <span class="profile-value">
                <%= um.getFirstname() %>
            </span>

        </div>


        <div class="profile-row">

            <span class="profile-label">
                Last Name
            </span>

            <span class="profile-value">
                <%= um.getLastname() %>
            </span>

        </div>


        <div class="profile-row">

            <span class="profile-label">
                Email
            </span>

            <span class="profile-value">
                <%= um.getEmail() %>
            </span>

        </div>


        <div class="profile-row">

            <span class="profile-label">
                Mobile
            </span>

            <span class="profile-value">
                <%= um.getMobile() %>
            </span>

        </div>


        <div class="profile-button">

            <a href="EditProfileServlet?email=<%=um.getEmail() %>"
               class="btn btn-light">

                Edit Profile

            </a>

        </div>

    </div>

</div>


<!-- Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>
