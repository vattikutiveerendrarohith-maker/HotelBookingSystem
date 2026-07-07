<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Room" %>

<%

Room room = (Room) request.getAttribute("room");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Room | Admin</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

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

/* Admin Top Bar */

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

/* Form */

.form-wrapper{
  display: flex;
  justify-content: center;
  padding: 55px 20px 80px 20px;
}

.form-box{
  width: 100%;
  max-width: 520px;
  background: white;
  padding: 42px;
  border-radius: 12px;
  box-shadow: 0 8px 30px rgba(20,32,43,0.1);
}

.form-box .eyebrow{
  color: var(--gold);
  text-transform: uppercase;
  letter-spacing: 1.5px;
  font-size: 12px;
  font-weight: 700;
}

.form-box h2{
  font-size: 26px;
  font-weight: 700;
  color: var(--navy);
  margin-top: 6px;
  margin-bottom: 26px;
}

.form-label{
  font-size: 13px;
  font-weight: 600;
  color: var(--navy);
  margin-bottom: 6px;
}

.form-control, .form-select{
  padding: 11px 14px;
  border-radius: 6px;
  border: 1px solid #dde1e5;
  font-size: 14px;
}

.form-control:focus, .form-select:focus{
  border-color: var(--gold);
  box-shadow: 0 0 0 3px rgba(201,162,75,0.15);
}

.form-actions{
  display: flex;
  gap: 12px;
  margin-top: 10px;
}

.btn-submit{
  flex: 1;
  background: var(--navy);
  color: white;
  border: none;
  padding: 12px 0;
  border-radius: 6px;
  font-weight: 600;
  transition: background 0.2s ease;
}

.btn-submit:hover{
  background: var(--navy-light);
  color: var(--gold-light);
}

.btn-cancel{
  flex: 1;
  background: white;
  color: var(--navy);
  border: 1px solid #d8dde1;
  padding: 12px 0;
  border-radius: 6px;
  font-weight: 600;
  text-align: center;
  text-decoration: none;
}

.btn-cancel:hover{
  border-color: var(--navy);
}

</style>

</head>
<body>

<!-- Admin Top Bar -->

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

<div class="form-wrapper">

<div class="form-box">

<div class="eyebrow">Inventory</div>
<h2>Edit Room</h2>

<form action="updateRoom" method="post">

<input type="hidden" name="id" value="<%= room.getId() %>">

<div class="mb-3">
<label class="form-label">Room Number</label>
<input type="text"
       name="roomNumber"
       class="form-control"
       value="<%= room.getRoomNumber() %>"
       required>
</div>

<div class="mb-3">
<label class="form-label">Room Type</label>
<input type="text"
       name="roomType"
       class="form-control"
       value="<%= room.getRoomType() %>"
       required>
</div>

<div class="mb-3">
<label class="form-label">Price (₹ / night)</label>
<input type="number"
       name="price"
       class="form-control"
       value="<%= room.getPrice() %>"
       required>
</div>

<div class="mb-4">
<label class="form-label">Status</label>
<select name="status" class="form-select" required>
<option value="Available" <%= "Available".equalsIgnoreCase(room.getStatus()) ? "selected" : "" %>>Available</option>
<option value="Booked" <%= "Booked".equalsIgnoreCase(room.getStatus()) ? "selected" : "" %>>Booked</option>
</select>
</div>

<div class="form-actions">
<button class="btn-submit" type="submit">Update Room</button>
<a href="adminRooms" class="btn-cancel">Cancel</a>
</div>

</form>

</div>

</div>

</body>
</html>