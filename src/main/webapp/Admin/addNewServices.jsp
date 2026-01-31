<%@ page import="Demo.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./css/addNewService-style.css">
    <title>Add New Product</title>
    <style>
        body {
            background-image: url('../Images/t2.avif');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
    </style>
</head>
<body>
    <% 
        String msg = request.getParameter("msg");
        if ("done".equals(msg)) { 
    %>
        <h3 class="alert">Service Added Successfully!</h3>
    <% } %>
    <% 
        if ("wrong".equals(msg)) { 
    %>
        <h3 class="alert">Something went wrong! Try Again!</h3>
    <% } %>
    <% 
        int id = 1;
        try {
            ConnectionProvider conProvider = new ConnectionProvider();
            Connection con = conProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT MAX(id) FROM services1");
            if (rs.next()) {
                id = rs.getInt(1) + 1;
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
    %>
    <form action="addNewServicesAction.jsp" method="post">
        <h3 style="color: yellow;">Product ID: <%= id %></h3>
        <input type="hidden" name="id" value="<%= id %>">

        <div class="left-div">
            <h3>Enter Name</h3>
            <input class="input-style" type="text" name="name" placeholder="Enter Name" required>
            <hr>
        </div>

        <div class="right-div">
            <h3>Enter Image URL</h3>
            <input class="input-style" type="text" name="image" placeholder="Enter Image URL" required>
            <hr>
        </div>

        <div class="right-div">
            <h3>Description</h3>
            <textarea class="input-style" name="description" placeholder="Enter Description" required></textarea>
            <hr>
        </div>
        
        <!-- <div class="right-div">
            <h3>Enter Category</h3>
            <select class="input-style" name="category" id="categorySelect" required>
                <option value="" disabled selected>Select a Category</option>
                <option value="Seeds and Sapling">Seeds And Sapling</option>
                <option value="Fertilizers and Soil Amendments">Fertilizers and Soil Amendments</option>
                <option value="Tools and Equipment">Tools and Equipment</option>
                <option value="Farm Machinery">Farm Machinery</option>
                <option value="Technology and Smart Farming">Technology and Smart Farming</option>
                <option value="Greenhouse and Hydroponics">Greenhouse and Hydroponics</option>
                <option value="Sustainable Farming Solutions">Sustainable Farming Solutions</option>
                <option value="Educational Resources">Educational Resources</option>
            </select>
            <hr>
        </div> -->
        
        <div class="left-div">
            <h3>Enter Price</h3>
            <input class="input-style" type="number" name="price" placeholder="Enter Price" required>
            <hr>
        </div>
        
        <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
    </form>
</body>
</html>
