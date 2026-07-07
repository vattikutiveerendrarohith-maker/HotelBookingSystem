<%@ page import="model.Customer" %>

<%

Customer customer = (Customer) session.getAttribute("customer");

if(customer == null){

response.sendRedirect("customerLogin.jsp");

return;
}

String roomId = request.getParameter("roomId");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Book Room | HotelBooking</title>

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

h2{
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
}

.navbar-nav .nav-link:hover{
  color: var(--gold-light) !important;
  background: rgba(255,255,255,0.06);
}

.navbar-nav .nav-link.logout-link{
  color: #e0a05c !important;
}

/* Form */

.form-wrapper{
  display: flex;
  justify-content: center;
  padding: 55px 20px 80px 20px;
}

.booking-box{
  width: 100%;
  max-width: 480px;
  background: white;
  padding: 42px;
  border-radius: 12px;
  box-shadow: 0 8px 30px rgba(20,32,43,0.1);
}

.booking-box .eyebrow{
  color: var(--gold);
  text-transform: uppercase;
  letter-spacing: 1.5px;
  font-size: 12px;
  font-weight: 700;
}

.booking-box h2{
  font-size: 26px;
  font-weight: 700;
  color: var(--navy);
  margin-top: 6px;
  margin-bottom: 24px;
}

.form-label{
  font-size: 13px;
  font-weight: 600;
  color: var(--navy);
  margin-bottom: 6px;
}

.form-control{
  padding: 11px 14px;
  border-radius: 6px;
  border: 1px solid #dde1e5;
  font-size: 14px;
}

.form-control:focus{
  border-color: var(--gold);
  box-shadow: 0 0 0 3px rgba(201,162,75,0.15);
}

.btn-confirm{
  background: var(--navy);
  color: white;
  border: none;
  padding: 12px 0;
  border-radius: 6px;
  font-weight: 600;
  width: 100%;
  margin-top: 10px;
  transition: background 0.2s ease;
}

.btn-confirm:hover{
  background: var(--navy-light);
  color: var(--gold-light);
}

.alert-danger{
  background: #fbe8e6;
  color: #a5342c;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  padding: 12px 16px;
}

</style>

</head>
<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark">

<div class="container">

<a class="navbar-brand" href="index.jsp">🏨 HotelBooking</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#menu">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse" id="menu">

<ul class="navbar-nav ms-auto">

<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
<li class="nav-item"><a class="nav-link" href="rooms">Rooms</a></li>
<li class="nav-item"><a class="nav-link" href="myBookings">My Bookings</a></li>

<li class="nav-item">
<a class="nav-link">Welcome, <%= customer.getName() %></a>
</li>

<li class="nav-item">
<a class="nav-link logout-link" href="logout">Logout</a>
</li>

</ul>
</div>

</div>

</nav>

<!-- Form -->

<div class="form-wrapper">

<div class="booking-box">

<div class="eyebrow">Confirm Your Stay</div>
<h2>Book Room</h2>

<%

String error = (String)request.getAttribute("error");

if(error != null){

%>

<div class="alert alert-danger mb-3">

<%= error %>

</div>

<%

}

%>

<form action="bookRoom" method="post">

<input type="hidden"
name="roomId"
value="<%= roomId %>">

<div class="mb-3">
<label class="form-label">Check In</label>
<input type="date"
name="checkIn"
class="form-control"
required>
</div>

<div class="mb-3">
<label class="form-label">Check Out</label>
<input type="date"
name="checkOut"
class="form-control"
required>
</div>

<button class="btn-confirm" type="submit">

Confirm Booking

</button>

</form>

</div>

</div>

</body>
</html>