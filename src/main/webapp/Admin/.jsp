<%@ page import="Demo.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>AC Services</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Seeds and Sapling Products</h1>
        <div class="row">
            <%
                ConnectionProvider conProvider = new ConnectionProvider();
                Connection con = conProvider.getCon();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM products2 WHERE category = ?");
                ps.setString(1, "AC Services");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
            %>
            <div class="col-md-4 mb-4">
    <div class="card h-100">
        <img class="card-img-top" src="<%= image %>" alt="<%= name %>" style="height: 200px; object-fit: cover;">
        <div class="card-body">
            <h5 class="card-title"><%= name %></h5>
            <p class="card-text"><%= description %></p>
            <p class="card-text"><strong>Price: &#x20B9;<%= price %></strong></p>
        </div>
        <div class="card-footer text-center">
            <a href="myCart.jsp" class="btn btn-primary">Add to Cart</a>
        </div>
    </div>
</div>
            
            <%
                }
                rs.close();
                ps.close();
                con.close();
            %>
        </div>
    </div>

    <!-- Bootstrap JS (Optional if needed for additional Bootstrap features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
