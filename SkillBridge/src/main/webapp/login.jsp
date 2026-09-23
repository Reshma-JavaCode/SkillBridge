<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>SkillBridge - Login</title>

    <!-- Bootstrap 5 -->
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

        .login-container {
            max-width: 650px;
            margin: 50px auto;
            color:white;
        }

        .login-card {
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
            
   
    background: rgba(0, 0, 0, 0.10);
    backdrop-filter: blur(3px);


        }

        .login-card h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .btn-login {
            width: 100%;
            transition: transform 0.3s ease;
        }

        .btn-login:hover {
            transform: scale(1.03);
        }

    </style>

</head>

<body>
<%@ include file="navbar1.jsp" %>
    <!-- Login Container -->

    <div class="container login-container">

        <div class="login-card">

            <h2>Login to SkillBridge</h2>

            <form name="LoginPage"
                  action="LoginServlet"
                  method="post">

                <!-- Username -->

                <div class="mb-3">

                    <label for="email"
                           class="form-label">

                        Email

                    </label>

                    <input type="text"
                           class="form-control"
                           id="email"
                           name="email"
                           placeholder="Enter email"
                           required>

                </div>


                <!-- Password -->

                <div class="mb-3">

                    <label for="password"
                           class="form-label">

                        Password

                    </label>

                    <input type="password"
                           class="form-control"
                           id="password"
                           name="password"
                           placeholder="Enter password"
                           required>

                </div>


                <!-- Login Button -->

                <button type="submit"
                        class="btn btn-primary btn-login">

                    Login

                </button>


                <!-- Register Link -->

                <p class="text-center mt-3">

                    Don't have an account?

                    <a href="register.jsp">
                        Register
                    </a>

                </p>

            </form>

        </div>

    </div>
    <!-- Bootstrap 5 JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

</html>