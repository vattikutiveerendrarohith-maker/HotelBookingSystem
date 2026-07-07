<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Room" %>
<%@ page import="model.Customer" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Rooms | HotelBooking</title>

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
}

*{ box-sizing: border-box; }

body{
  margin:0;
  padding:0;
  background: var(--cream);
  font-family: 'Inter', sans-serif;
  color: var(--ink);
}

h1, h2, h3, h4{
  font-family: 'Playfair Display', serif;
}

/* Navbar */

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

.rooms-header{
  background: var(--navy);
  color: white;
  padding: 55px 0 45px 0;
  text-align: center;
}

.rooms-header span{
  color: var(--gold-light);
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 13px;
  font-weight: 600;
  display: block;
  margin-bottom: 10px;
}

.rooms-header h1{
  font-size: 36px;
  font-weight: 700;
  margin: 0;
}

/* Room cards */

.rooms-section{
  padding: 55px 0 80px 0;
}

.room-card{
  border: none;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 8px 24px rgba(20,32,43,0.08);
  transition: transform 0.25s ease, box-shadow 0.25s ease;
  height: 100%;
  background: white;
}

.room-card:hover{
  transform: translateY(-6px);
  box-shadow: 0 14px 32px rgba(20,32,43,0.14);
}

.room-img-wrap{
  position: relative;
}

.room-img{
  height: 220px;
  object-fit: cover;
  width: 100%;
}

.status-badge{
  position: absolute;
  top: 14px;
  right: 14px;
  padding: 5px 14px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.status-available{
  background: #1f8a4c;
  color: white;
}

.status-booked{
  background: #b3413a;
  color: white;
}

.room-card-body{
  padding: 22px;
}

.room-card-body h4{
  font-size: 19px;
  font-weight: 700;
  color: var(--navy);
  margin-bottom: 4px;
}

.room-type-tag{
  color: var(--muted);
  font-size: 13px;
  margin-bottom: 14px;
}

.room-price{
  color: var(--gold);
  font-weight: 700;
  font-size: 20px;
}

.room-price span{
  color: var(--muted);
  font-weight: 400;
  font-size: 13px;
}

.btn-book{
  background: var(--navy);
  color: white;
  border: none;
  padding: 10px 0;
  border-radius: 6px;
  font-weight: 600;
  width: 100%;
  display: inline-block;
  text-align: center;
  text-decoration: none;
  transition: background 0.2s ease;
}

.btn-book:hover{
  background: var(--navy-light);
  color: var(--gold-light);
}

.btn-book-disabled{
  background: #d8dde1;
  color: #8a9096;
  border: none;
  padding: 10px 0;
  border-radius: 6px;
  font-weight: 600;
  width: 100%;
  display: inline-block;
  text-align: center;
  pointer-events: none;
}

/* Empty state */

.empty-state{
  text-align: center;
  padding: 80px 20px;
  color: var(--muted);
}

.empty-state h3{
  color: var(--navy);
  margin-bottom: 10px;
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
<a class="nav-link" href="index.jsp">

Home

</a>
</li>

<li class="nav-item">
<a class="nav-link" href="rooms">

Rooms

</a>
</li>

<li class="nav-item">
<a class="nav-link" href="myBookings">

My Bookings

</a>
</li>

<%

Customer customer =
(Customer) session.getAttribute("customer");

if(customer == null){

%>

<li class="nav-item">
<a class="nav-link" href="customerLogin.jsp">

Login

</a>
</li>

<li class="nav-item">
<a class="nav-link" href="register.jsp">

Register

</a>
</li>

<%

}else{

%>

<li class="nav-item">

<a class="nav-link">

Welcome,
<%= customer.getName() %>

</a>

</li>

<li class="nav-item">
<a class="nav-link logout-link"
href="logout">

Logout

</a>
</li>

<%

}

%>

</ul>
</div>

</div>

</nav>

<!-- Page Header -->

<div class="rooms-header">
<div class="container">
<span>Live Availability</span>
<h1>Available Rooms</h1>
</div>
</div>

<!-- Rooms -->

<div class="rooms-section">
<div class="container">

<div class="row">

<%

List<Room> rooms = (List<Room>) request.getAttribute("rooms");

if(rooms != null && !rooms.isEmpty()){

int count = 1;

for(Room room : rooms){

boolean isAvailable = "Available".equalsIgnoreCase(room.getStatus());

%>

<div class="col-md-4 mb-4">

<div class="room-card">

<div class="room-img-wrap">

<img src="images/room<%= count %>.jpg"
class="room-img"
onerror="this.src='https://images.unsplash.com/photo-1611892440504-42a792e24d32?q=80&w=800'">

<span class="status-badge <%= isAvailable ? "status-available" : "status-booked" %>">
<%= room.getStatus() %>
</span>

</div>

<div class="room-card-body">

<h4>
Room <%= room.getRoomNumber() %>
</h4>

<p class="room-type-tag">
<%= room.getRoomType() %>
</p>

<p class="room-price mb-3">
₹ <%= room.getPrice() %> <span>/ night</span>
</p>

<%

if(isAvailable){

%>

<a href="bookRoom.jsp?roomId=<%= room.getId() %>"
class="btn-book">

Book Now

</a>

<%

}else{

%>

<span class="btn-book-disabled">

Not Available

</span>

<%

}

%>

</div>

</div>

</div>

<%

count++;

}

}else{

%>

<div class="col-12">
<div class="empty-state">
<h3>No Rooms Found</h3>
<p>Please check back later or contact the front desk.</p>
</div>
</div>

<%

}

%>

</div>

</div>
</div>

</body>
</html>