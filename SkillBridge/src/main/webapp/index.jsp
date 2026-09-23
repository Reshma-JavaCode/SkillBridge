<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>SkillBridge</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
      <link rel="stylesheet" href="css/navbar1.css">
      
          <style>

.hero-section {
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
.hero-section .container {
    animation: heroFade 1.2s ease;
}

@keyframes heroFade {

    from {
        opacity: 0;
        transform: translateY(30px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }

}


</style>

</head>

<body>
<%@ include file="navbar1.jsp" %>


    <!-- Welcome Section -->
    <!-- Hero Section -->

<!-- Hero Section -->

<section class="hero-section">

    <div class="container text-center text-white">

        <h1 class="display-3 fw-bold">
            Master Your Technical Skills
        </h1>

        <p class="lead mt-3">
            Learn • Practice • Track • Grow
        </p>

        <p class="fs-5">
            Build your Java, SQL and programming skills
            and prepare for your career.
        </p>

        <div class="mt-4">

            <a href="register.jsp" class="btn btn-primary btn-lg me-2">
                Get Started
            </a>

            <a href="SkillsServlet" class="btn btn-outline-light btn-lg">
                Explore Skills
            </a>

        </div>

    </div>

</section>

    <!-- Bootstrap 5 JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>

</body>
</html>