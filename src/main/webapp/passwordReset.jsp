<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/signup-style.css">
    <title>Reset Password</title>
     <link rel="shortcut icon" href="assets/img/favicon.png">
    <link href="assets/css/style.css" rel="stylesheet" media="screen">
    <link href="assets/css/chblue.css" rel="stylesheet" media="screen">
    <link href="assets/css/theme-responsive.css" rel="stylesheet" media="screen">
    <link href="assets/css/dtb/jquery.dataTables.min.css" rel="stylesheet" media="screen">
    <link href="assets/css/select2.min.css" rel="stylesheet" media="screen">
    <link href="assets/css/toastr.min.css" rel="stylesheet" media="screen">        
    <script type="text/javascript" src="assets/js/jquery.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui.1.10.4.min.js"></script>
    <script type="text/javascript" src="assets/js/toastr.min.js"></script>
    <script type="text/javascript" src="assets/js/modernizr.js"></script>
    
</head>
<body>
    <form action="PasswordResetServlet" method="POST">
        <label for="new-password">Enter New Password:</label>
        <input type="password" name="newPassword" required>
        <label for="confirm-password">Confirm New Password:</label>
        <input type="password" name="confirmPassword" required>
        <button type="submit">Reset Password</button>
    </form>

    <!-- Optional: Display messages if something goes wrong -->
    <%
        String msg = request.getParameter("msg");
        if ("mismatch".equals(msg)) {
    %>
        <h1>Passwords do not match! Try again.</h1>
    <%
        } else if ("success".equals(msg)) {
    %>
        <h1>Password Reset Successfully!</h1>
    <%
        }
    %>
</body>
</html>
