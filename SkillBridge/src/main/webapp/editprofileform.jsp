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

        <h1>Edit Profile</h1>

        <p>Edit your SkillBridge account details</p>

    </div>


<form name="edituserdata" class="form-group" action="EditProfileServlet" method="post">
<input type="hidden" name="userid" value="<%= um.getUserId()%>">
    <label class="form-label"> Username</label>>
               
         <input type="text" class="form-control" name="username" value="<%= um.getUsername() %>">  

      <label class="form-label"> Firstname</label>>
               
         <input type="text" class="form-control" name="firstname" value="<%= um.getFirstname() %>">  
            
	 <label class="form-label"> Lastname</label>>
               
         <input type="text" class="form-control" name="lastname" value="<%= um.getLastname() %>">  
	
	 <label class="form-label"> Email</label>>
               
         <input type="email" class="form-control" name="email" value="<%= um.getEmail() %>">  
	 <label class="form-label"> Mobile</label>>
               
         <input type="number" class="form-control" name="mobile" value="<%= um.getMobile()%>">      

        
<div class="m-3">
           <button type="submit" class="btn btn-primary btn-register">Edit</button>

       
</div>
    </form>

</div>


<!-- Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>
