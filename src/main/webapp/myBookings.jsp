<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>
<%@ page import="model.Customer" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Bookings | HotelBooking</title>

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

/* Navbar (same as other guest pages) */

.navbar{
  background: var(--navy) !important;
  padding: 18px 0;
}

.navbar-brand{
  font-size: 26px;
  font-weight: 700;
  color: var(--gold-light) !important;
}

.navbar-nav .nav-link{
  color: #dfe3e7 !important;
  font-weight: 500;
  margin-left: 6px;
  padding: 8px 14px !important;
  border-radius: 4px;
  transition: all 0.2s ease;
}

.navbar-nav .nav-link:hover{
  color: var(--gold-light) !important;
  background: rgba(255,255,255,0.06);
}

.navbar-nav .nav-link.logout-link{
  color: #e0a05c !important;
}

/* Page header */

.page-header{
  background: var(--navy);
  color: white;
  padding: 45px 0 35px 0;
  text-align: center;
}

.page-header span{
  color: var(--gold-light);
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 13px;
  font-weight: 600;
  display: block;
  margin-bottom: 8px;
}

.page-header h2{
  font-size: 32px;
  font-weight: 700;
  margin: 0;
}

/* Table card */

.content-section{
  padding: 45px 0 80px 0;
}

.table-card{
  background: white;
  border-radius: 10px;
  box-shadow: 0 6px 24px rgba(20,32,43,0.08);
  padding: 8px;
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

.empty-state{
  text-align: center;
  padding: 70px 20px;
  color: var(--muted);
}

.empty-state h3{
  color: var(--navy);
  font-family: 'Playfair Display', serif;
  margin-bottom: 10px;
}

.empty-state a{
  display: inline-block;
  margin-top: 16px;
  background: var(--navy);
  color: white;
  padding: 10px 24px;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 600;
}

.empty-state a:hover{
  background: var(--navy-light);
  color: var(--gold-light);
}

</style>

</head>
<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark">

<div class="container">

<a class="navbar-brand" href="index.jsp">
🏨 HotelBooking
</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#menu">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse"
id="menu">

<ul class="navbar-nav ms-auto">

<li class="nav-item">
<a class="nav-link" href="index.jsp">Home</a>
</li>

<li class="nav-item">
<a class="nav-link" href="rooms">Rooms</a>
</li>

<li class="nav-item">
<a class="nav-link" href="myBookings">My Bookings</a>
</li>

<%

Customer customer =
(Customer) session.getAttribute("customer");

if(customer == null){

%>

<li class="nav-item">
<a class="nav-link" href="customerLogin.jsp">Login</a>
</li>

<li class="nav-item">
<a class="nav-link" href="register.jsp">Register</a>
</li>

<%

}else{

%>

<li class="nav-item">
<a class="nav-link">Welcome, <%= customer.getName() %></a>
</li>

<li class="nav-item">
<a class="nav-link logout-link" href="logout">Logout</a>
</li>

<%

}

%>

</ul>
</div>

</div>

</nav>

<!-- Page Header -->

<div class="page-header">
<div class="container">
<span>Your Reservations</span>
<h2>My Bookings</h2>
</div>
</div>

<!-- Content -->

<div class="content-section">
<div class="container">

<%

List<Booking> bookings =
(List<Booking>) request.getAttribute("bookings");

if(bookings != null && !bookings.isEmpty()){

%>

<div class="table-card">

<table class="table table-hover mb-0">

<thead>
<tr>
<th>ID</th>
<th>Room No.</th>
<th>Room Type</th>
<th>Check In</th>
<th>Check Out</th>
<th>Status</th>
</tr>
</thead>

<tbody>

<%

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

<td><%= booking.getRoomNumber() %></td>

<td><%= booking.getRoomType() %></td>

<td><%= booking.getCheckIn() %></td>

<td><%= booking.getCheckOut() %></td>

<td>
<span class="badge-status <%= badgeClass %>">
<%= status %>
</span>
</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

<%

}else{

%>

<div class="empty-state">
<h3>No Bookings Yet</h3>
<p>You haven't made any reservations. Browse our rooms and book your stay.</p>
<a href="rooms">Explore Rooms</a>
</div>

<%

}

%>

</div>
</div>

</body>
</html>