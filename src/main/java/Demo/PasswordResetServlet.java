package Demo;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/PasswordResetServlet")

public class PasswordResetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Check if passwords match
        if (newPassword.equals(confirmPassword)) {
            // Logic to update the password in the database
            updatePasswordInDatabase(newPassword);
            // Redirect to a success message
            response.sendRedirect("passwordReset.jsp?msg=success");
        } else {
            // Redirect back to reset page with error
            response.sendRedirect("passwordReset.jsp?msg=mismatch");
        }
    }

    // Simulated method to update the password in the database
    private void updatePasswordInDatabase(String password) {
        // Update logic
    }
}
