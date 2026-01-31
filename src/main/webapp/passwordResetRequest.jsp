<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/signup-style.css">
    <link rel="icon" href="dsfsdv.png" type="image/png" sizes="20x20">
    <title>Forgot Password</title>
</head>
<body>
    <form action="PasswordResetRequestServlet" method="POST">
        <label for="email">Enter your email to reset password:</label>
        <input type="email" name="email" required>
        <button type="submit">Submit</button>
    </form>

    <!-- Displaying messages based on the response -->
    <%
        String msg = request.getParameter("msg");
        if ("done".equals(msg)) {
    %>
        <h1>Password Changed Successfully!</h1>
    <%
        } else if ("invalid".equals(msg)) {
    %>
        <h1>Something Went Wrong! Try Again!</h1>
    <%
        }
    %>
</body>
</html>
