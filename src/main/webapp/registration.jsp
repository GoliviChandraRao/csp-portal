<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Log in with your account</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
     

      <style>
      .home {
        display: flex;
        margin: 10px 20px;
        justify-content: space-around;
      }

      </style>
  </head>

  <body>
  <div>
<div class="home">
  <div>
  User Name <input id="username" name="username" type="text" class="form-control" placeholder="Username"
                     autofocus="true"/>

                    Phone Number <input id="username" name="username" type="text" class="form-control" placeholder="Username"
                                          autofocus="true"/>
          Email <input id="username" name="username" type="text" class="form-control" placeholder="Username"
                                                    autofocus="true"/>

  </div>
  <div>
              Enter Password <input id="password" name="password" type="password" class="form-control" placeholder="Password"/>
Date of Birth <input type="date" id="Date Of Birth" name="Date Of Birth"><br>

        Address:
        <textarea></textarea>
    </div>

    <div>
                  Repeat Password <input id="password" name="password" type="password" class="form-control" placeholder="Password"/>

                  Sex:<br>
	<label for="male">Male</label>
        <input type="radio" name="gender" id="male" value="male"><br>
        <label for="female">Female</label>
        <input type="radio" name="gender" id="female" value="female">
        </div>


</div>
 <button class="btn btn-lg btn-primary btn-block" type="submit" id="apply">Apply</button>
     <button class="btn btn-lg btn-primary btn-block" type="reset" id="reset">Reset</button>
</div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
     // this is the id of the form
     $("#Apply").click(function(e) {

        // var username = $('#username').val();
         // var password = $('#password').val();
         $.ajax({
             type: 'POST',
             url: '/api/auth/signup',
             crossDomain: true,
             xhrFields: { 'withCredentials': true },
             headers: {
                     'Accept': 'application/json',
                     'Content-Type': 'application/json'
                 },
             
	     dataType: 'json',
             data: JSON.stringify({ "username": "chandra",
                   "email": "golivi.chandrarao@gmail.com", "password": "chandrapassword", "role": ["user"] }),
           success: function(result, status, jqXHR) {
                   var cookies = jqXHR.getResponseHeader('Set-Cookie');
                   console.log(cookies);
                   window.location.href = '/api/auth/signup';
             }
         });

     });</script>
  </body>
</html>
