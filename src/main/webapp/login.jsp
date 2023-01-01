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

      .left-section {
              background: lightpink;
              border: 8px dashed white;
              width: 50%;
              border-radius: 5px;
              text-align: center;
              height: 90vh;
        }

       .right-section {
              background: #eea1a1;
            border: 8px dashed white;
            width: 35%;
            border-radius: 5px;
            text-align: center;
            height: 90vh;
        }
      </style>
  </head>

  <body>

<div class="home">
  <div class="left-section">
  <h4> <u>Mission </u></h4>
  <h5> <p> CSP a single secure portal that acts as a window to the various services is beneficial for the citizens. Portals act as a one stop resource for information. Having a secure e- Government Portal will reduce the costs for the government in delivering timely information to its citizens. The citizens will also benefit from timely and readily available information as well as a medium to avail services. Having a web portal will reduce the need for dedicated governmental representatives to be available by other modes of communication like Phone or email to provide information to citizens. It will be much simpler and cost effective for Governmental Representatives as well as the Representatives in governmental legislation bodies to get in touch with the citizens to pass information on important legislations, Citizen action items etc.
  </div>
  <div class="right-section">
    <h4> <u>User Log In </u></h4>
      <div class="container">
        <h2 class="form-heading">Log in</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            User Name <input id="username" name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
            Password <input id="password" name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit" id="login">Log In</button>
            <h4 class="text-center"><a href="${contextPath}/csp/usersignup">New User Sign Up</a></h4>
        </div>
    </div>
  </div>
</div>




    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
     // this is the id of the form
     $("#login").click(function(e) {

         var username = $('#username').val();
         var password = $('#password').val();
         $.ajax({
             type: 'POST',
             url: '/api/auth/signin',
             crossDomain: true,
              xhrFields: { 'withCredentials': true },
              headers: {
                                           'Accept': 'application/json',
                                           'Content-Type': 'application/json'
                                       },
                                   dataType: 'json',
             data: JSON.stringify({ username: username, password: password }),
               success: function(result, status, jqXHR) {
               var cookies = jqXHR.getResponseHeader('Set-Cookie');
                                  console.log(cookies);
                        if (result?.roles?.includes('ROLE_USER')) {
                                window.location.href = '/csp/applybirthcertificate';
                        } else {
                                window.location.href = '/csp/approverejectapplication';
                        }
                          }
         });

     });
     </script>
  </body>
</html>
