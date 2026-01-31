package Demo;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

	@SuppressWarnings("serial")
	@WebServlet("/PasswordResetRequestServlet")
	
	public class PasswordResetRequestServlet extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String email = request.getParameter("email");
	        
	        // Logic to verify the email, send a reset token or process as needed
	        boolean isEmailValid = checkEmailInDatabase(email);
	        
	        if (isEmailValid) {
	            // Redirect to the "Enter new password" page
	            response.sendRedirect("passwordReset.jsp");
	        } else {
	            // Redirect back to the forgot password page with error message
	            response.sendRedirect("passwordResetRequest.jsp?msg=invalid");
	        }
	    }
	    
	    // Simulated method for checking email in the database
	    private boolean checkEmailInDatabase(String email) {
	        // Database check logic
	        return true; // Simulating that the email is valid for now
	    }
	}
