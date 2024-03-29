<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt">
  <head>
    <title>UnioN</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link href="images/icons/favicon.png" rel="icon" />
    <link href="images/icons/apple-touch-icon.png" rel="apple-touch-icon" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap/css/bootstrap.min.css"/><!--alinha icons com texto-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <!--alinha icons com texto-->
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assets/fonts/iconic/css/material-design-iconic-font.min.css"/><!--icons-->
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <!--===============================================================================================-->
  </head>
  <body>
    <div class="limiter container-login100" style="background-image: url('images/bg-01.jpg');">
      <div>
        <h1 style="text-align: center;margin-bottom: 7%;font-family: Poppins-Medium;font-size: 3rem;">You are a</h1>
        <div class="container">
          <div class="row">
            <div class="wrap-login100">
              <span class="login100-form-logo">
                <i class="zmdi zmdi-accounts-alt"></i>
              </span>
              <span class="login100-form-title p-b-34 p-t-27">
                Teacher
              </span>
              <div class="container-login100-form-btn">
                <div class="wrap-login100-form-btn">
                  <div class="login100-form-bgbtn"></div>
                  <form class="login100-form validate-form" action="TemplatesProf/TemplateLoginProf.jsp">
                  	<button class="login100-form-btn" type="submit">
                    Login
                  	</button>
                  </form>
                </div>
              </div>
            </div>
            <div style="width:60px;"></div>
            <div class="wrap-login100">
              <span class="login100-form-logo">
                <i class="zmdi zmdi-graduation-cap"></i>
              </span>

              <span class="login100-form-title p-b-34 p-t-27">
                Student
              </span>

              <div class="container-login100-form-btn">
                <div class="wrap-login100-form-btn">
                  <div class="login100-form-bgbtn"></div>
                  <form class="login100-form validate-form" action="TemplatesAluno/EnterRoom.jsp">
                 	 <button class="login100-form-btn" type="submit">
                    Login
                  	</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div id="dropDownSelect1"></div>
  </body>
</html>