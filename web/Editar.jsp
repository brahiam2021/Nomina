

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
       //CONECTANDO LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/registro";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
       PreparedStatement ps;
       ResultSet rs;
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from persona where Id="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 820px">
                ID:
                <input type="text" readonly="" class="form-control" value="<%= rs.getInt("Id")%>"/>
                 Nombres:
                <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("Nombres")%>"required/><br>
              
                DNI:
                <input type="number" name="txtDNI" class="form-control" value="<%= rs.getString("DNI")%>"required/>
                 <br>
               
                 Celular:
                <input type="number" name="txtcel" class="form-control"  value="<%= rs.getString("celular")%>"required/><br>
                fecha de nacimiento:
                <input type="date" name="txtfecha" class="form-control"  value="<%= rs.getString("fecha")%>"required/>
                <br>
                 Edad:
                <input type="number" name="txtedad" class="form-control" value="<%= rs.getInt("edad")%>"required/><br>
                Salario:
                <input type="number" name="txtsal" class="form-control" value="<%= rs.getInt("Salario")%>"required/>
                <br>
                 Turno:
                <input type="number" name="txtturno" class="form-control" value="<%= rs.getInt("turno")%>"required/><br>
                cargo:
                <input type="text" name="txtcargo" class="form-control" value="<%= rs.getString("cargo")%>"required/>
                <br>
                Correo:
                    <input type="email" name="txtemail" class="form-control" value="<%= rs.getString("email")%>" required/>
                    <br>
                 Estrato:
                    <input type="number" name="txtestrato" class="form-control" value="<%=rs.getString("estrato")%>" required/>
                    <br>    
                  <input type="submit" value="Guardar" class="btn btn-primary "/>
                  <a class="btn btn-dark" href="principal.jsp">Regresar</a>
                 
                <br>
                
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
    
    
      String dni, nom,celular,fecha,cargo;
       String edad,salario,turno,Correo,Estrato;
       nom=request.getParameter("txtNom");
       dni=request.getParameter("txtDNI"); 
       celular=request.getParameter("txtcel");
       fecha=request.getParameter("txtfecha");
        edad=request.getParameter("txtedad");
       salario=request.getParameter("txtsal");
       turno=request.getParameter("txtturno");
       cargo=request.getParameter("txtcargo");
       Correo=request.getParameter("txtemail");
       Estrato=request.getParameter("txtestrato");
       if(nom!=null && dni!=null ){
           ps=con.prepareStatement("update persona set Nombres='"+nom+"', DNI='"+dni+"', celular='"+celular+"',fecha='"+fecha+"'"
                   + ", edad='"+edad+"',salario='"+salario+"',turno='"+turno+"',cargo='"+cargo+"',email='"+Correo+"',estrato='"+Estrato+"' where Id="+id);
           ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Se ha editado con exito");
           response.sendRedirect("principal.jsp");
       }
       
       
%>
