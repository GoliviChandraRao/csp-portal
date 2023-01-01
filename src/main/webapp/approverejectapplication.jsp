<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<h2>Approve or reject birth certificate admin page (only admin can access)</h2>
<jsp:include page="header.jsp" />
<h1>
<p style="background-color:LightGray;color:green">All Applications</p>
</h1>

<table>
  <tr>
    <th>Application Type</th>
    <th>Applied By</th>
    <th>Applied On</th>
    <th>Child Name</th>
    <th>Father Name</th>
    <th>Gender</th>
    <th>Address Proof</th>
    <th>Action</th>
  </tr>



  <c:forEach var="bcRequest" items="${pendingRequests}" varStatus="loop">
  <tr>
      <td> Birth Certificate </td>
      <td> ${bcRequest.appliedBy} </td>
      <td> ${bcRequest.appliedOn} </td>
      <td> ${bcRequest.childName} </td>
      <td> ${bcRequest.fatherName} </td>
      <td> ${bcRequest.gender} </td>
      <td><button class="btn success download" data-id="${bcRequest.id}">Download</button> </td>
      <td><button class="btn success accept" data-id="${bcRequest.id}" >✅ </button>
      <button class="btn fail reject" data-id="${bcRequest.id}" >❌</button>
      </td>

    </tr>
    </c:forEach>
</table>

</body>
</html>


