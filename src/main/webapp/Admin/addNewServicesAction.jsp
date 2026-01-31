<%@ page import="Demo.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String image = request.getParameter("image");
    String description = request.getParameter("description");
    String category = request.getParameter("category");
    double price = Double.parseDouble(request.getParameter("price"));

    try {
        ConnectionProvider conProvider = new ConnectionProvider();
        Connection con = conProvider.getCon();

        String query = "INSERT INTO services1 (id, name, image, description, category, price) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, id);
        pstmt.setString(2, name);
        pstmt.setString(3, image);
        pstmt.setString(4, description);
        pstmt.setString(5, category);
        pstmt.setDouble(6, price);

        int rowCount = pstmt.executeUpdate();

        if (rowCount > 0) {
            // Redirect to the appropriate category page
            String redirectPage = "";
            switch (category) {
                case "AC Services":
                    redirectPage = "seedsAndSapling.jsp";
                    break;
                case "Plumbing":
                    redirectPage = "fertilizersAndSoilAmendments.jsp";
                    break;
                case "Beauty":
                    redirectPage = "toolsAndEquipment.jsp";
                    break;
                case "Electrician":
                    redirectPage = "farmMachinery.jsp";
                    break;
                case "Shower filter":
                    redirectPage = "technologyAndSmartFarming.jsp";
                    break;
                case "Home CleaningS":
                    redirectPage = "greenhouseAndHydroponics.jsp";
                    break;
                case "Pest Control":
                    redirectPage = "sustainableFarmingSolutions.jsp";
                    break;
                case "Carpentry":
                    redirectPage = "educationalResources.jsp";
                    break;
                case "Gyser":
                    redirectPage = "educationalResources.jsp";
                    break;
            } 
            response.sendRedirect(redirectPage + "?msg=done");
        } else {
            response.sendRedirect("addNewServices.jsp?msg=wrong");
        }

        pstmt.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("addNewServices.jsp?msg=wrong");
    }
%>
