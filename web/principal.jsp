<%@page import="java.io.FileOutputStream"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>  
        
        <title>JSP Page</title>
    </head>
    <body style="margin-top: 20px">      
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

        
        
        
        
      
        <div class="buscar">            
            <button tittle="Agregar usuarios" type="button" class="btn btn-link" data-toggle="modal" data-target="#myModal">
            <img src="imagen/3592854-add-user-business-man-employee-general-human-member-office_107767.png" alt=""/></button>
             <a href="Excel.jsp"><img src="imagen/excel_theapplication_3130 (1).png" alt=""/></a>
            
            <form class="form">
                <input class="form-control" style="width:500px;" type="number" name="txtbuscar">
                <input class="btn btn" type="submit" value="BUSCAR">
                
            </form> 
            
                                     
            
              <%
             /*metodo buscar*/
                String dniBuscar = request.getParameter("txtbuscar");
                if (dniBuscar != null) {

                    smt = con.createStatement();
                    rs = smt.executeQuery("select * from persona where DNI LIKE" + "'%" + dniBuscar + "%'");
                } else {
                    System.err.print("error");
                }
            %>

        </div>  

        <br>
        <div class="tabla">               
          
            <table class="table table-bordered"  id="tablaDatos"  >
                <thead>
                    <tr>
                        <th class="text-center">Id</th>
                        <th class="text-center">Nombre completo</th>
                        <th class="text-center">Cargo</th>
                        <th class="text-center">Fecha de nacimiento</th>
                        <th class="text-center">Edad</th>
                        <th class="text-center">Turno</th>
                        <th class="text-center">Acciones</th>
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
                        <td class="text-center"><%= rs.getString("fecha")%></td>
                        <td class="text-center"><%= rs.getInt("edad")%></td>
                        <td class="text-center"><%= rs.getString("turno")%></td>
                        <td class="text-center">

                            <a href="Editar.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-primary" >Editar</a>
                            <a href="Delete.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-danger">Delete</a>
                            <a href="Detalle.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-warning">Detalle</a>
                            <a href="liquidacion.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-success">Liquidacion</a>

                        </td>
                    </tr>
                    <%}%>
            </table>
        </div>        
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 650px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar Empleado</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                
                                
                                <label>Nombres:</label>
                                <input type="text" name="txtNom" class="form-control"  id="nombre" placeholder="Nombre completo" required/>
                                <br>
                                <label>DNI:</label> 
                                <input type="number" name="txtDNI" class="form-control"required  pleceholder="1234...."/> 
                                <br>
                                <label>Celular:</label>
                                <input type="number" name="txtcel" class="form-control"required pleceholder="32134..."/>
                                <br>
                                <label> fecha de nacimiento:</label>
                                <input type="date" name="txtfecha" class="form-control"required pleceholder=""/>
                                <br>
                                <label> Edad:</label>
                                <input type="number" name="txtedad" class="form-control"required/>
                                <br>
                                <label>Salario:</label>
                                <input type="number" name="txtsal" class="form-control" required/>
                                <br>
                                <label>Turno:</label>
                                <input type="number" name="txtturno" class="form-control"required/>
                                <br>
                              
                                <label>cargo:</label>
                                <input type="text" name="txtcargo" class="form-control"required/>
                                <br>
                               
                                <label>Correo eletronico:</label>
                                <input type="email" name="txtemail" class="form-control"required/>
                                <br>
                                <label>Estrato:</label>
                                <input type="number" name="txtestrato" class="form-control"required/>
                                <br>
                                

                                <br>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>                            
                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
            <%
                
                String dni, nom, celular, fecha, cargo;
                String edad, salario, turno,Correo,Estrato;
                nom = request.getParameter("txtNom");
                dni = request.getParameter("txtDNI");
                celular = request.getParameter("txtcel");
                fecha = request.getParameter("txtfecha");
                edad = request.getParameter("txtedad");
                salario = request.getParameter("txtsal");
                turno = request.getParameter("txtturno");
                cargo = request.getParameter("txtcargo");
                Correo=request.getParameter("txtemail");
                Estrato=request.getParameter("txtestrato");
                if (nom != null && dni != null) {
                    ps = con.prepareStatement("insert into persona(Nombres, DNI,celular,fecha,edad,salario,turno,cargo,email,estrato)values('" + nom + "','" + dni + "','" + celular + "','" + fecha + "','" + edad + "','" + salario + "','" + turno + "','" + cargo +"','"+Correo+"','"+Estrato+"')");
                   
                    ps.executeUpdate();
                    JOptionPane.showMessageDialog(null, "Se Agrego Correctamete");
                    response.sendRedirect("principal.jsp");

                }

        
            %>

        </div> 

        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>  
        
    </body>
</html>
