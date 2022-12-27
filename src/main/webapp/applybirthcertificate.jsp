<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
      <title>Log in with your account</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>

<h2>Apply birth certificate page</h2>
<jsp:include page="header.jsp"  />




	<a href="#" style="background-color:pink;">Apply Birth Certificate </a><p>
    

<a href="/csp/viewbcstatus" style="background-color:pink;"> View Birth Certificate Application Status</a>
<h1>
<p style="background-color:LightGray;color:green">Birth Certificate Application Form</p>
</h1>


<form action="/action_page.php">
<label for="Child Name">Child Name: *</label>
<input type=" " id="Child Name" name="Child Name">
<label for="Father Name">Father Name: *</label>
<input type=" " id="Father Name" name="Father Name">
<label for="Mother Name">Mother Name: *</label>
<input type=" " id="Mother Name" name="Mother Name">
<label for="Place Of Birth">Place Of Birth: *</label>
<input type=" " id="Place Of Birth" name="Place Of Birth">
 <label for="Date Of Birth">Date Of Birth: *</label>
  <input type="date" id="Date Of Birth" name="Date Of Birth">
  Sex:
<label for="male">Male</label>
        <input type="radio" name="gender" id="male" value="male">
        <label for="female">Female</label>
        <input type="radio" name="gender" id="female" value="female">
<p>Permanent Address Of Parent: *</p>

<label for="State">State:*</label>
<select name="state" id="state" class="form-control">
<option value="Select State">Select State</option>
<option value="Andhra Pradesh">Andhra Pradesh</option>
<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
<option value="Arunachal Pradesh">Arunachal Pradesh</option>
<option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chandigarh">Chandigarh</option>
<option value="Chhattisgarh">Chhattisgarh</option>
<option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
<option value="Daman and Diu">Daman and Diu</option>
<option value="Delhi">Delhi</option>
<option value="Lakshadweep">Lakshadweep</option>
<option value="Puducherry">Puducherry</option>
<option value="Goa">Goa</option>
<option value="Gujarat">Gujarat</option>
<option value="Haryana">Haryana</option>
<option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jammu and Kashmir">Jammu and Kashmir</option>
<option value="Jharkhand">Jharkhand</option>
<option value="Karnataka">Karnataka</option>
<option value="Kerala">Kerala</option>
<option value="Madhya Pradesh">Madhya Pradesh</option>
<option value="Maharashtra">Maharashtra</option>
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option>
<option value="Mizoram">Mizoram</option>
<option value="Nagaland">Nagaland</option>
<option value="Odisha">Odisha</option>
<option value="Punjab">Punjab</option>
<option value="Rajasthan">Rajasthan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Telangana">Telangana</option>
<option value="Tripura">Tripura</option>
<option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="Uttarakhand">Uttarakhand</option>
<option value="West Bengal">West Bengal</option>
</select>
<label for="District">District: *</label>
<input type="text" id="District" name="District">



<label for="House no-locality-zip">House no-locality-zip: *</label>
<input type="text" id="House no-locality-zip" name="House no-locality-zip">

<label for="Upload Addressproof">Upload Addressproof: *</label>
<input type="file" id="Browse">

<script>
function myFunction() {
  var x = document.getElementById("Browse");
  x.disabled = true;
  
}
</script>
  <h2><input type="Submit" style="background-color:LightBlue;">
  <input type="Reset">

</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
     // this is the id of the form
     $("#Submit").click(function(e) {

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
                                window.location.href = '/csp/viewbcstatus';
                        } else {
                                window.location.href = '/';
                        }
                          }
         });

     });
     </script>
</body>
</html>
