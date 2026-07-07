<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Room" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manage Rooms | Admin</title>

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

h1, h2, h4{
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

/* Page header */

.page-header{
  padding: 40px 0 20px 0;
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  flex-wrap: wrap;
  gap: 16px;
}

.page-header span{
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
  margin-bottom: 0;
}

.header-actions .btn-add{
  background: var(--gold);
  color: #1a1a1a;
  border: none;
  padding: 10px 22px;
  border-radius: 6px;
  font-weight: 600;
  text-decoration: none;
  display: inline-block;
  margin-right: 8px;
}

.header-actions .btn-add:hover{
  background: var(--gold-light);
  color: #1a1a1a;
}

.header-actions .btn-back{
  background: transparent;
  color: var(--navy);
  border: 1px solid #d8dde1;
  padding: 10px 22px;
  border-radius: 6px;
  font-weight: 600;
  text-decoration: none;
  display: inline-block;
}

.header-actions .btn-back:hover{
  border-color: var(--navy);
}

/* Room cards */

.rooms-section{
  padding: 10px 0 70px 0;
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
  background: var(--green);
  color: white;
}

.status-booked{
  background: var(--red);
  color: white;
}

.room-card-body{
  padding: 22px;
}

.room-card-body h4{
  font-size: 18px;
  font-weight: 700;
  color: var(--navy);
  margin-bottom: 6px;
}

.room-meta{
  font-size: 14px;
  color: var(--muted);
  margin-bottom: 4px;
}

.room-meta b{
  color: var(--ink);
  font-weight: 600;
}

.room-actions{
  display: flex;
  gap: 10px;
  margin-top: 16px;
}

.btn-edit{
  flex: 1;
  background: var(--navy);
  color: white;
  border: none;
  padding: 9px 0;
  border-radius: 6px;
  font-size: 14px;
  font-weight: 600;
  text-decoration: none;
  text-align: center;
}

.btn-edit:hover{
  background: var(--navy-light);
  color: var(--gold-light);
}

.btn-delete{
  flex: 1;
  background: white;
  color: var(--red);
  border: 1px solid var(--red);
  padding: 9px 0;
  border-radius: 6px;
  font-size: 14px;
  font-weight: 600;
  text-decoration: none;
  text-align: center;
}

.btn-delete:hover{
  background: var(--red);
  color: white;
}

.empty-state{
  text-align: center;
  padding: 70px 20px;
  color: var(--muted);
}

.empty-state h3{
  color: var(--navy);
  font-family: 'Playfair Display', serif;
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

<div class="container">

<div class="page-header">

<div>
<span>Inventory</span>
<h2>Manage Rooms</h2>
</div>

<div class="header-actions">
<a href="addRoom.jsp" class="btn-add">+ Add Room</a>
<a href="adminDashboard.jsp" class="btn-back">Dashboard</a>
</div>

</div>

<div class="rooms-section">

<div class="row g-4">

<%

List<Room> rooms = (List<Room>)request.getAttribute("rooms");

if(rooms != null && !rooms.isEmpty()){

int count = 1;

for(Room room : rooms){

boolean isAvailable = "Available".equalsIgnoreCase(room.getStatus());

%>

<div class="col-md-4">

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

<h4>Room <%= room.getRoomNumber() %></h4>

<p class="room-meta"><b>Type:</b> <%= room.getRoomType() %></p>
<p class="room-meta"><b>Price:</b> ₹ <%= room.getPrice() %></p>

<div class="room-actions">

<a href="editRoom?id=<%= room.getId() %>"
class="btn-edit">

Edit

</a>

<a href="deleteRoom?id=<%= room.getId() %>"
class="btn-delete"
onclick="return confirm('Are you sure you want to delete this room?')">

Delete

</a>

</div>

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
<p>Add your first room to get started.</p>
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