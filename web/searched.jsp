<%-- 
    Document   : searched
    Created on : Feb 3, 2020, 9:54:27 PM
    Author     : PAVAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/table.css" />
        <title>JSP Page</title>
    </head>
    <body style="width: 100%; background-image: url('rbc.jpg'); background-repeat: no-repeat; background-size:cover;  background-attachment: fixed;" > 
         <style>
            #details{
                display: inline-block;
                position: absolute;
            }
            #sch{
                outline:solid;
            }
        </style>
        <div id="header">
            <img src="img3.jpg" style="width: 200px; height: 140px;">
      <div id="logo">
        <div id="logo_text" style="display: inline;">
          <h1 style="font-size: 31px;"><a>BLOODR</a></h1><H2 style="font-size: 15px;">Blood Bank Management</H2>
          <h2 style="font-size: 15px;">Donate blood...<br>save life...</h2>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
            <li class="selected"><a href="bankpage.jsp">Dashboard</a></li>
        </ul>
      </div>
    </div>
        <div id="content"> <center>
          <h1>Welcome to BLOODR Blood Bank Management System</h1>
       <p>Helping you to help others</p>
       <br><br>
       <h2>Manage your Donar</h2>
       <br><br>
        <%
            try{
                HttpSession bankid=request.getSession();
            String id="";
            if(bankid!=null){
            id=(String)bankid.getAttribute("bank");}    
            Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/blood","root","root");
              String bgroup=request.getParameter("bgroup");
              if(bgroup.isEmpty()||bgroup.equals("blood")){
              response.sendRedirect("bankpage.jsp");
              }else{
              Statement bst=conn.createStatement();
              ResultSet brs=bst.executeQuery("select * from donar where bgroup='"+bgroup+"';");
              if(brs.next()){
        %><table style="width:600px;"><caption>AVALIABLE BLOOD</caption>
              <tr><td>DONAR ID</td>
                  <td>BLOOD GROUP</td>
              </tr><%
                  ResultSet brs1=bst.executeQuery("select * from donar where bgroup='"+bgroup+"';");
                  while(brs1.next()){
                      %>
                      <td><%=brs1.getString(1)%></td>
                  <td><%=brs1.getString(5)%></td>
                  <%  } %></table> </center> </div><%    }
else{
%><h2>NO BLOOD AVAILABLE</h2><%
}

              }}catch(Exception e){
out.println(e.getMessage());
}        %>
    </body>
</html>
