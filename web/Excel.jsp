<%@page import="java.sql.*"%>
<%@page import="utilerias.Conversiones"%>
<%@page import="java.util.*"%>
<%@page contentType="application-/vnd.ms-excel"%>

   <%
            //CONECTANDO A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/registro";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from persona");
            //Creamos la Tabla:     
        %>
<%
String nombreArchivo="Reporte.xls";
response.setHeader("Content-Disposition","attachment;filrname="+nombreArchivo);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Reporte Empleados</h1>
          <br>
        <div class="container">               
          
            <table class="table table-bordered"  id="tablaDatos"  >
                <thead>
                    <tr>
                        <th class="text-center">Id</th>
                        <th class="text-center">Nombre completo</th>
                        <th class="text-center">Cargo</>
                        <th class="text-center">Edad</th>
                        <th class="text-center">Turno</th>
                        <th class="text-center">Salario</th>
                        <th class="text-center">Estrato</th>
                        <th class="text-center">Correo</th>
                    </tr>
                </thead>
                <tbody id="tbodys">
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td class="text-center"><%= rs.getInt("Id")%></td>
                        <td class="text-center"><%= rs.getString("Nombres")%></td>
                        <td class="text-center"><%= rs.getString("cargo")%></td>
                       
                        <td class="text-center"><%= rs.getInt("edad")%></td>
                        <td class="text-center"><%= rs.getString("turno")%></td>
                        <td class="text-center"><%= rs.getString("salario")%></td>
                        <td class="text-center"><%= rs.getString("estrato")%></td>
                        <td class="text-center"><%= rs.getString("email")%></td>
                        <td class="text-center">

                        </td>
                    </tr>
                    <%}%>
        </table>
    </body>
</html>
