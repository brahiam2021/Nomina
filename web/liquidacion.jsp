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

                int n = rs.getInt("Salario");
                int Sub =0;
                String re = "";
                String Tr = "";
                /**
                 * ***** bono del 3% y deducion de 4%**************
                 */

                double bono = 0;
                double deducion=(n*4/100);
          
                String dedu = String.valueOf(deducion);
                
                           if (n<=828663){
                                bono =(n * 3 / 100);
                              re=String.valueOf(bono);
                           }
                           else{
                               re="N/A";
                           }
                               bono=bono;
                /**
                 * *******sub de transporte**************
                 */
                
                if (n > 1801700) {
                    Tr = "N/A";

                } else if (n <= 1801700) {
                    Sub=106454;
                    Tr = Integer.toString(Sub);

                }
                       Sub=Sub;

                /**
                 * *******horario segun el turno**************
                 */
                String h1 = "";
                String h2 = "";
                String h3 = "";
                String hora = "";
                int h = rs.getInt("turno");
                if (h == 1) {
                    hora = Integer.toString(h);
                    h1 = "6am-2pm";
                    hora = h1;
                }
                if (h == 2) {
                    hora = Integer.toString(h);
                    h2 = "2pm-10pm";
                    hora = h2;

                }
                if (h == 3) {
                    hora = Integer.toString(h);
                    h3 = "10pm-6am";
                    hora = h3;

                }

                String ope = rs.getString("celular");
                String operador = ope.substring(0, 3);

                String Valor = "";
                String Nop = "";

                int n1 = Integer.parseInt(operador);

                if (n1 == 300 || n1 == 301) {
                   
                    Nop = "Tigo";
                    Valor = "20000";

                } else if (n1 == 302 || n1 == 303) {
                    Nop = "Uff Movil";
                    Valor = "15000";

                } else if (n1 == 304) {
                    Nop = "Uff Movil";
                    Valor = "15000";
                } else if (n1 == 305) {
                    Nop = "Movil Exito";
                    Valor = "15000";
                } else if (n1 == 310 || n1 == 311) {
                    Nop = "Claro";
                    Valor = "25000";
                } else if (n1 == 312 || n1 == 313) {
                    Nop = "Claro";
                    Valor = "25000";
                } else if (n1 == 314 || n1 == 320) {
                    Nop = "Claro";
                    Valor = "25000";
                } else if (n1 == 321) {
                    Nop = "Claro";
                    Valor = "25000";
                } else if (n1 == 315 || n1 == 316) {
                    Nop = "Movitar";
                    Valor = "20000";
                } else if (n1 == 317 || n1 == 318) {
                    Nop = "Movistar";
                    Valor = "20000";
                } else if (n1 == 319) {
                    Nop = "Virgin";
                    Valor = "18000";
                }
                
               
                


        %> 


        <div class="container">
            <h1>liquidacion Empleado</h1>
            <hr> 

            <form action="" method="post" class="form-control" style="width: 500px; height: 950px">
                <fieldset disabled>  
                    Cedula:
                    <input type="text" readonly="" class="form-control"  value="<%= rs.getString("DNI")%>"/><br>
                    Nombres:
                    <input type="text" name="txtNom" class="form-control"  value="<%= rs.getString("Nombres")%>"/><br>

                    Salario:
                    <input type="text" name="txtsal" class="form-control" value="<%= rs.getInt("Salario")%>"/>
                    <br>
                   
                    Cargo:
                    <input type="text" name="txtcargo" class="form-control" value="<%= rs.getString("cargo")%>"/>
                    <br>
                  
                    valor operador:
                    <input type="text" name="txtcargo" class="form-control" value="<% out.print(Valor);%>"/>
                    <br>
     
                    bono:
                    <input type="text" name="txtcargo" class="form-control" value="<% out.print(re);%>"/>
                    <br>
                    sub transporte:
                    <input type="text" name="txtcargo" class="form-control" value="<% out.print(Tr);%>"/>
                    <br>
                     recaudo de pension y seguro:
                    <input type="number" name="txtcargo" class="form-control" value="<% out.print(dedu);%>"/>
                    <br>
                    <%
                        
                /****deduciones****/
                double total;
                double totalb=bono+n+Sub;
                
              double precio = Double.parseDouble(Valor);
                total=(bono+n+Sub-deducion-precio);
                    %>
                    <h2>Total bruto</h2>
                    <hr>
                    <input type="text" name="txtcargo" class="form-control" value="<% out.print(totalb);%>"/>
                    <br>
                    <h2>Total neto</h2>
                    <hr>
                    <input type="text" name="txtcargo" class="form-control" value="<% out.print(total);%>"/>
                    <br>
                </fieldset> 
                <a class="btn btn-primary" href="principal.jsp">Regresar</a>
                <hr>
            </form>
            <%}%>

        </div>

       
    </body>
</html>