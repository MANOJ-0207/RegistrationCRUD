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
    <link rel="stylesheet" href="Styles/Register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    
    <title>Edit Details</title>
    <script type="text/javascript" src="Script/Validation.js">
    </script>
</head>
<body>
		<%
		  String rollNo=request.getParameter("rollNo");
          RowData row=SQLOperations.select(rollNo);
        %>
	<div class="formDiv">
        <h1 class="heading-main">
            EDIT DETAILS
        </h1>
        <h3 class="heading-sub">Enter Data to be Changed</h3>
        <form action="UpdateRow" method="get" onsubmit="return validate()" name="registrationForm">
            <table class="formTable">
                <tr>
                    <td>ROLL NUMBER <input type="hidden" name="rollNo" value="<%out.print(row.getRollNo()); %>"></input></td>
                    <td> : <b><%out.print(row.getRollNo()); %></b></td>
                </tr>
                <tr>
                    <td>NAME </td>
                    <td>: <input type="text" name="name" id="name" autocomplete="off" value="<%out.print(row.getName()); %>" required></td>
                </tr>
                <tr>
                    <td>MAIL </td>
                    <td>: <input type="mail" name="mail" id="mail" autocomplete="off" value="<%out.print(row.getMail()); %>" required></td>
                </tr>
            </table>
            <button class="btn btn-md btn-primary  submit" type="submit">Save Changes</button>
        </form>
    </div>
</body>
</html>