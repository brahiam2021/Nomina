<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/registro";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            //
            PreparedStatement ps;
            ResultSet rs;
            int id = Integer.parseInt(request.getParameter("id"));
            ps = con.prepareStatement("select * from persona where Id=" + id);
            rs = ps.executeQuery();
            while (rs.next()) {
        

       
        
                         int n=rs.getInt("Salario");
                         int Sub=rs.getInt("Salario");
                          String re="";
                          String Tr="";
                           /******* bono del 3%***************/
                          
                           double bono=(n*3/100);
                           
                           if (n<=828663){
                              re=String.valueOf(bono);
                           }
                           else{
                               re="N/A";
                           }
                               String bon= re;  
                                 /*********sub de transporte***************/
                          
                         if(Sub>1801700){
                             Sub=0;
                            
                         }
                         else if(Sub<=1801700){
                          Sub=106454;
                         
                         }
                                 Tr=Integer.toString(Sub);
    
        
        
        
                                /*********horario segun el turno***************/
        
         
                          String h1="";
                          String h2="";
                          String h3="";
                          String hora="";
                          int h=rs.getInt("turno");
                         if(h==1){
                               hora = Integer.toString(h);
                             h1="6am-2pm";
                             hora=h1;
                         }
                         if(h==2){
                              hora = Integer.toString(h);
                           h2="2pm-10pm";
                           hora=h2;
                            
                         }if(h==3){
                              hora = Integer.toString(h);
                             h3="10pm-6am";
                             hora=h3;
                                     
                         }
                         
String ope = rs.getString("celular");
    String operador = ope.substring(0, 3);

    String Valor = "";
    String Nop = "";

    int n1 = Integer.parseInt(operador);

    if (n1 == 300 || n1 == 301) {
        JOptionPane.showMessageDialog(null, "adentro");
        Nop = "Tigo";
        Valor = "20.000";

    } else if (n1==302 || n1==303) {
        Nop = "Uff Movil";
        Valor = "15.000";
    
    } else if (n1==304) {
        Nop = "Uff Movil";
        Valor = "15.000";
    }
    else if (n1==305) {
        Nop = "Movil Exito";
        Valor = "15.000";
    }
    
     else if (n1==310 || n1==311) {
        Nop = "Claro";
        Valor = "25.000";
    } else if (n1==312 || n1==313) {
        Nop = "Claro";
        Valor = "25.000";
    }else if (n1==314 || n1==320) {
        Nop = "Claro";
        Valor = "25.000";
    }else if (n1==321) {
        Nop = "Claro";
        Valor = "25.000";
    }else if (n1==315 || n1==316) {
        Nop = "Movitar";
        Valor = "20.000";
    }else if (n1==317 || n1==318) {
        Nop = "Movistar";
        Valor = "20.000";
    }else if (n1==319) {
        Nop = "Virgin";
        Valor = "18.000";
    }
                         

                                

        %> 
        

        <div class="container">
            <h1>Detalle Empleado</h1>
            <hr>

            <form action="" method="post" class="form-control" style="width: 500px; height: 1110px">
                <fieldset disabled>  
                    ID:
                    <input type="text" readonly="" class="form-control"  value="<%= rs.getInt("Id")%>"/><br>
                    Nombres:
                    <input type="text" name="txtNom" class="form-control"  value="<%= rs.getString("Nombres")%>"/><br>

                    DNI:
                    <input type="text" name="txtDNI" class="form-control" value="<%= rs.getString("DNI")%>"/>
                    <br>
                    Celular:
                    <input type="text" name="txtcel" class="form-control"  value="<%= rs.getString("celular")%>"/>
                    <br>
                    Correo:
                    <input type="email" name="txtcargo" class="form-control" value="<%= rs.getString("email")%>"/>
                    <br>
                     fecha de nacimiento:
                    <input type="date" name="txtfecha" class="form-control"  value="<%= rs.getString("fecha")%>"/>
                    <br>
                    Edad:
                    <input type="text" name="txtedad" class="form-control" value="<%= rs.getInt("edad")%>"/>
                    <br>
                    Salario:
                    <input type="text" name="txtsal" class="form-control" value="<%= rs.getInt("Salario")%>"/>
                    <br>
                    Turno:
                    <input type="text" name="txtturno" class="form-control" value="<%= rs.getInt("turno")%>"/>
                    <br>
                    cargo:
                    <input type="text" name="txtcargo" class="form-control" value="<%= rs.getString("cargo")%>"/>
                    <br>
                    Horario:
                    <input type="text" name="txtcargo" class="form-control" value="<% out.print(hora);%>"/>
                    <br>
                    valor operador:
                    <input type="text" name="txtcargo" class="form-control" value="<% out.print(Valor);%>"/>
                    <br>
                    Nombre operador:
                    <input type="text" name="txtcargo" class="form-control" value="<% out.print(Nop);%>"/>
                    <br>

                    bono:
                    <input type="text" name="txtcargo" class="form-control" value="<% out.print(bon);%>"/>
                    <br>
                    sub transporte:
                    <input type="number" name="txtcargo" class="form-control" value="<% out.print(Tr);%>"/>
                    <br>
                 
                </fieldset> 
                <a class="btn btn-primary" href="principal.jsp">Regresar</a>
           </form>
            <%}%>

        </div>

       
    </body>
</html>
