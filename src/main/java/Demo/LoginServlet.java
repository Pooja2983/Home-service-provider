package Demo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_management";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?")) {

                stmt.setString(1, email);
                stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    // Retrieve user role (admin/user)
                    String role = rs.getString("role"); // Assuming 'role' column exists in 'users' table
                    
                    HttpSession session = request.getSession(false);  // Retrieve session if exists
                    if (session != null) {
                        session.invalidate();  // Clear the old session to avoid session issues
                    }
                    session = request.getSession(true);  // Create a new session
                    session.setAttribute("user", rs.getString("name"));  // Store user in session
                    session.setAttribute("role", role);  // Store role in session

                    // Redirect based on role
                    if ("admin".equalsIgnoreCase(role)) {
                        response.sendRedirect("Admin/adminHome.jsp");  // Redirect to admin page
                    } else {
                        response.sendRedirect("FrontPage1.html");  // Redirect to user page
                    }
                } else {
                    // Invalid credentials
                    request.setAttribute("error", "Invalid email or password.");
                    request.getRequestDispatcher("login.html").forward(request, response);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred during login.");
            request.getRequestDispatcher("login.html").forward(request, response);
        }
    }
}
