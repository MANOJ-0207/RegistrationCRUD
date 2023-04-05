<!DOCTYPE html>
<html lang="en">
<%@page import="com.register.util.DButil" %>
<%@page import="com.register.dao.SQLOperations" %>
<%@page import="com.register.dao.RowData" %>
<%@page import="java.util.*" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="Styles/details.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    
    <title>Registration Table</title>
    <script type="text/javascript" src="Script/EditRow.js">
    </script>
</head>
<body>
    <h1 class="heading-main">REGISTRATION DETAILS <a href="Register.html" type="button" class="btn btn-lg btn-light">Add<i class="bi bi-plus-circle"></i></a></h1>
    <table class="data">
    	<tr>
            <th>S.no</th>
            <th>Roll No</th>
            <th>Name</th>
            <th>Mail</th>
            <th>Action</th>
        </tr>
        <%
          List<RowData>rows=new ArrayList<>();
          rows=SQLOperations.selectAll();
          int sNo=1;
          for(RowData row:rows)
          {
        	  String rollNo=row.getRollNo();
        	  String name=row.getName();
        	  String mail=row.getMail();
        %>
        <tr id="<% out.print(rollNo); %>">
            <td class="column-center" ><% out.print(sNo++);%></td>
            <td class="column-center"> <% out.print(rollNo); %></td>
           	<td><% out.print(name); %></td>
           	<td><% out.print(mail); %></td>
           	<td class="column-center" id="<% out.print(rollNo+"Action"); %>">
           		<a type="button" class="btn btn-info" onclick="loadEditRow(<%out.print("'"+(sNo-1)+"','"+rollNo+"','"+name+"','"+mail+"'");%>)"><i class="bi bi-pencil-fill"></i></a>
               	<button type="button" class="btn btn-danger" onclick="removeRow(<%out.print("'"+rollNo+"'");%>)" ><i class="bi bi-trash-fill"></i></button>
           	</td>
        </tr>
        <% } %>
    </table>
   
</body>
</html>