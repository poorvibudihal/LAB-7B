<%@ page import="javax.servlet.http.Cookie" %>
<%
    String name = request.getParameter("cname");
    String domain = request.getParameter("cdomain");
    String ageStr = request.getParameter("cage");

    int age = 60; // default

    // Safe conversion
    if (ageStr != null && !ageStr.trim().equals("")) {
        try {
            age = Integer.parseInt(ageStr);
        } catch (Exception e) {
            age = 60;
        }
    }

    // Create cookie
    if (name != null && !name.trim().equals("")) {
        Cookie cookie = new Cookie(name, name);

        // Avoid domain issues in localhost
        // cookie.setDomain(domain);

        cookie.setMaxAge(age);
        response.addCookie(cookie);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Cookie Added</title>
</head>
<body>

<h2>Cookie Added Successfully!</h2>

<p><b>Name:</b> <%= name %></p>
<p><b>Domain:</b> <%= domain %></p>
<p><b>Max Age:</b> <%= age %> seconds</p>

<br>
<a href="showCookies.jsp">Go to Active Cookie List</a>

</body>
</html>