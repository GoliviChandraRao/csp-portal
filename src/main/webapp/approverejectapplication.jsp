
<!DOCTYPE html>
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
  <tr>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    
    <td><button class="btn success">Download</button> </td>
    <td><button class="btn success">✅ </button>
    <button class="btn fail">❌</button>
    </td>
    
  </tr>
  
</table>

</body>
</html>


