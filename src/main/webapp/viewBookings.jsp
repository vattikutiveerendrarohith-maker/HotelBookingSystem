<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>All Bookings | Admin</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>

:root{
  --navy: #14202b;
  --navy-light: #1d2f3d;
  --gold: #c9a24b;
  --gold-light: #e0c98a;
  --cream: #f8f6f2;
  --ink: #2a2a2a;
  --muted: #6b7280;
  --green: #1f8a4c;
  --red: #b3413a;
}

*{ box-sizing: border-box; }

body{
  margin:0;
  padding:0;
  background: var(--cream);
  font-family: 'Inter', sans-serif;
  color: var(--ink);
}

h1, h2{
  font-family: 'Playfair Display', serif;
}

.admin-topbar{
  background: var(--navy);
  color: white;
  padding: 20px 0;
}

.admin-topbar .container{
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.admin-brand{
  font-size: 20px;
  font-weight: 700;
  color: var(--gold-light);
}

.admin-nav a{
  color: #dfe3e7;
  text-decoration: none;
  font-size: 14px;
  font-weight: 500;
  margin-left: 22px;
}

.admin-nav a:hover{
  color: var(--gold-light);
}

.page-header{
  padding: 40px 0 10px 0;
}

.page-header .eyebrow{
  color: var(--gold);
  text-transform: uppercase;
  letter-spacing: 1.5px;
  font-size: 12px;
  font-weight: 700;
}

.page-header h2{
  font-size: 28px;
  font-weight: 700;
  color: var(--navy);
  margin-top: 4px;
}

.table-card{
  background: white;
  border-radius: 10px;
  box-shadow: 0 6px 24px rgba(20,32,43,0.08);
  padding: 8px;
  margin: 25px 0 60px 0;
  overflow-x: auto;
}

table{
  margin: 0;
}

thead th{
  background: var(--navy);
  color: white;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  font-weight: 600;
  padding: 14px 16px;
  border: none;
}

tbody td{
  padding: 14px 16px;
  vertical-align: middle;
  font-size: 14px;
  border-color: #eef0f2;
}

tbody tr:hover{
  background: #faf9f7;
}

.badge-status{
  padding: 5px 12px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.4px;
}

.badge-pending{
  background: #fdf1dc;
  color: #a5720f;
}

.badge-approved{
  background: #e3f3e8;
  color: var(--green);
}

.badge-rejected{
  background: #fbe8e6;
  color: var(--red);
}

.btn-approve{
  background: var(--green);
  color: white;
  border: none;
  padding: 6px 14px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 600;
  text-decoration: none;
  display: inline-block;
  margin-right: 6px;
}

.btn-approve:hover{
  background: #196b3c;
  color: white;
}

.btn-reject{
  background: var(--red);
  color: white;
  border: none;
  padding: 6px 14px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 600;
  text-decoration: none;
  display: inline-block;
}

.btn-reject:hover{
  background: #8f342e;
  color: white;
}

.empty-state{
  text-align: center;
  padding: 60px 20px;
  color: var(--muted);
}

</style>

</head>
<body>

<div class="admin-topbar">
<div class="container">

<div class="admin-brand">🏨 HotelBooking · Admin</div>

<div class="admin-nav">
<a href="adminDashboard.jsp">Dashboard</a>
<a href="adminRooms">Rooms</a>
<a href="viewBookings">Bookings</a>
<a href="logout">Logout</a>
</div>

</div>
</div>

<div class="container">

<div class="page-header">
<span class="eyebrow">Reservations</span>
<h2>All Customer Bookings</h2>
</div>

<div class="table-card">

<table class="table table-hover mb-0">

<thead>
<tr>
<th>ID</th>
<th>Customer</th>
<th>Room No.</th>
<th>Room Type</th>
<th>Check In</th>
<th>Check Out</th>
<th>Status</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<%

List<Booking> bookings =
(List<Booking>) request.getAttribute("bookings");

if(bookings != null && !bookings.isEmpty()){

for(Booking booking : bookings){

String status = booking.getStatus();
String badgeClass = "badge-pending";

if("Approved".equalsIgnoreCase(status)){
badgeClass = "badge-approved";
}else if("Rejected".equalsIgnoreCase(status)){
badgeClass = "badge-rejected";
}

%>

<tr>

<td>#<%= booking.getId() %></td>

<td><%= booking.getCustomerName() %></td>

<td><%= booking.getRoomNumber() %></td>

<td><%= booking.getRoomType() %></td>

<td><%= booking.getCheckIn() %></td>

<td><%= booking.getCheckOut() %></td>

<td>
<span class="badge-status <%= badgeClass %>">
<%= status %>
</span>
</td>

<td>

<%

if("Pending".equalsIgnoreCase(status)){

%>

<a href="updateBookingStatus?id=<%= booking.getId() %>&status=Approved"
class="btn-approve">

Approve

</a>

<a href="updateBookingStatus?id=<%= booking.getId() %>&status=Rejected"
class="btn-reject">

Reject

</a>

<%

}else{

%>

<span class="text-muted" style="font-size:13px;">— No action —</span>

<%

}

%>

</td>

</tr>

<%

}

}else{

%>

<tr>
<td colspan="8">
<div class="empty-state">
<h5>No Bookings Found</h5>
<p>New reservations will appear here once customers start booking.</p>
</div>
</td>
</tr>

<%

}

%>

</tbody>

</table>

</div>

</div>

</body>
</html>