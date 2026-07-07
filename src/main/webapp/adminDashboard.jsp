<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard | HotelBooking</title>

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

h1, h2, h3{
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
  padding: 45px 0 10px 0;
}

.page-header span{
  color: var(--gold);
  text-transform: uppercase;
  letter-spacing: 1.5px;
  font-size: 12px;
  font-weight: 700;
}

.page-header h1{
  font-size: 32px;
  font-weight: 700;
  color: var(--navy);
  margin-top: 4px;
}

/* Dashboard cards */

.dashboard-section{
  padding: 20px 0 70px 0;
}

.card-box{
  padding: 36px 28px;
  border-radius: 12px;
  background: white;
  box-shadow: 0 8px 24px rgba(20,32,43,0.08);
  text-align: left;
  height: 100%;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  border-top: 3px solid var(--gold);
}

.card-box:hover{
  transform: translateY(-4px);
  box-shadow: 0 14px 32px rgba(20,32,43,0.13);
}

.card-icon{
  font-size: 30px;
  margin-bottom: 16px;
}

.card-box h3{
  font-size: 19px;
  font-weight: 700;
  color: var(--navy);
  margin-bottom: 8px;
}

.card-box p{
  color: var(--muted);
  font-size: 14px;
  margin-bottom: 22px;
}

.card-link{
  background: var(--navy);
  color: white;
  border: none;
  padding: 10px 22px;
  border-radius: 6px;
  font-weight: 600;
  font-size: 14px;
  text-decoration: none;
  display: inline-block;
  transition: background 0.2s ease;
}

.card-link:hover{
  background: var(--navy-light);
  color: var(--gold-light);
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
<span>Control Center</span>
<h1>Admin Dashboard</h1>
</div>

<div class="dashboard-section">

<div class="row g-4">

<div class="col-md-4">

<div class="card-box">
<div class="card-icon">🛏️</div>
<h3>Manage Rooms</h3>
<p>View, edit, and remove existing rooms from the property.</p>
<a href="adminRooms" class="card-link">Open →</a>
</div>

</div>

<div class="col-md-4">

<div class="card-box">
<div class="card-icon">➕</div>
<h3>Add Room</h3>
<p>Add a new room with type, price, and availability status.</p>
<a href="addRoom.jsp" class="card-link">Open →</a>
</div>

</div>

<div class="col-md-4">

<div class="card-box">
<div class="card-icon">📋</div>
<h3>View Bookings</h3>
<p>Review pending requests and approve or reject reservations.</p>
<a href="viewBookings" class="card-link">Open →</a>
</div>

</div>

</div>

</div>

</div>

</body>
</html>