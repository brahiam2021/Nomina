<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        
        <title>Nomina</title>
    </head>
    <body>
        <div class="container col-lg-3">
           
            <form action="principal.jsp">
            
                <div class=" login form-group text-center">
                    <img class="avatar" src="imagen/customer_person_people_man_you_1625.png"  height=80" width="80" />
                    <br>
               
                    <h1>Login</h1>
                
                
                    <label>User name</label>
                    <input class="form-control" type="text" name="txtnom" placeholder="ingrese nombre completo"><br>
                
                
                    <label>Passwor</label>
                    <input class="form-control" type="password" name="txtcedula"  placeholder="N cedula">
                    <br>
              

                <input class="btn btn-danger btn-block" type="submit" name="accion"  value="Ingresar" >
                 </div> 
            </form>

        </div>
 </body>
</html>
