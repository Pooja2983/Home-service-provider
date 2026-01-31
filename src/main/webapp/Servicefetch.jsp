@WebServlet("/servicesbycategory")
public class ServiceByCategoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("category");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdb", "root", "password");
            
            String query = "SELECT * FROM services WHERE category_id=?";
            ps = con.prepareStatement(query);
            ps.setString(1, categoryId);
            rs = ps.executeQuery();
            
            List<Service> services = new ArrayList<>();
            while (rs.next()) {
                Service service = new Service(rs.getInt("id"), rs.getString("name"), rs.getString("description"), rs.getString("price"), rs.getString("image_url"));
                services.add(service);
            }
            request.setAttribute("services", services);
            request.getRequestDispatcher("/category.jsp").forward(request, response);
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(con != null) con.close();
        }
    }
}
