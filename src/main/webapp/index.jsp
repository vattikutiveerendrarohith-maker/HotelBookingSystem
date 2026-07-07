<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="model.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Booking System</title>

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

h1, h2, h3, .brand-font{
  font-family: 'Playfair Display', serif;
}

/* ---------- Navbar ---------- */

.navbar{
  background: var(--navy) !important;
  padding: 18px 0;
}

.navbar-brand{
  font-size: 26px;
  font-weight: 700;
  color: var(--gold-light) !important;
  letter-spacing: 0.5px;
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

/* ---------- Hero ---------- */

.hero{
  min-height: 640px;
  background:
    linear-gradient(180deg, rgba(20,32,43,0.55) 0%, rgba(20,32,43,0.75) 100%),
    url('https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=1600');
  background-size: cover;
  background-position: center;
  display: flex;
  align-items: center;
  color: white;
}

.hero-eyebrow{
  letter-spacing: 3px;
  text-transform: uppercase;
  font-size: 13px;
  color: var(--gold-light);
  font-weight: 600;
  margin-bottom: 18px;
}

.hero h1{
  font-size: 56px;
  font-weight: 700;
  line-height: 1.15;
  max-width: 700px;
}

.hero p.lead{
  max-width: 520px;
  color: #e7e9eb;
  font-size: 17px;
  margin-top: 18px;
}

.btn-gold{
  background: var(--gold);
  border: none;
  color: #1a1a1a;
  font-weight: 600;
  padding: 12px 28px;
  border-radius: 4px;
  transition: all 0.2s ease;
}

.btn-gold:hover{
  background: var(--gold-light);
  color: #1a1a1a;
}

.btn-outline-light-custom{
  border: 1px solid rgba(255,255,255,0.5);
  color: white;
  padding: 12px 28px;
  border-radius: 4px;
  font-weight: 500;
  text-decoration: none;
  transition: all 0.2s ease;
}

.btn-outline-light-custom:hover{
  border-color: var(--gold-light);
  color: var(--gold-light);
}

/* ---------- Stats strip ---------- */

.stats-strip{
  background: var(--navy-light);
  color: white;
  padding: 35px 0;
}

.stat-num{
  font-family: 'Playfair Display', serif;
  font-size: 34px;
  color: var(--gold-light);
  font-weight: 700;
}

.stat-label{
  font-size: 13px;
  color: #b7bfc6;
  text-transform: uppercase;
  letter-spacing: 1px;
}

/* ---------- Section headers ---------- */

.section{
  padding: 80px 0;
}

.section-eyebrow{
  color: var(--gold);
  font-weight: 600;
  letter-spacing: 2px;
  text-transform: uppercase;
  font-size: 13px;
  text-align: center;
  display: block;
  margin-bottom: 10px;
}

.section-title{
  text-align: center;
  font-size: 34px;
  font-weight: 700;
  margin-bottom: 50px;
  color: var(--navy);
}

/* ---------- Room preview cards ---------- */

.room-card{
  background: white;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 8px 24px rgba(20,32,43,0.08);
  transition: transform 0.25s ease;
  height: 100%;
}

.room-card:hover{
  transform: translateY(-6px);
}

.room-card-img{
  height: 220px;
  background-size: cover;
  background-position: center;
}

.room-card-body{
  padding: 22px;
}

.room-card-body h4{
  font-size: 19px;
  font-weight: 700;
  color: var(--navy);
}

.room-price{
  color: var(--gold);
  font-weight: 700;
  font-size: 18px;
}

/* ---------- Services ---------- */

.service-box{
  background:white;
  padding: 32px 24px;
  border-radius: 8px;
  box-shadow: 0 6px 20px rgba(20,32,43,0.06);
  text-align:center;
  height: 100%;
}

.service-icon{
  font-size: 34px;
  margin-bottom: 14px;
}

.service-box h4{
  font-size: 17px;
  font-weight: 700;
  margin-bottom: 8px;
  color: var(--navy);
}

.service-box p{
  color: var(--muted);
  font-size: 14px;
  margin: 0;
}

/* ---------- About ---------- */

.about-section{
  background: var(--navy);
  color: #e7e9eb;
}

.about-section .section-title{
  color: white;
}

.about-section .section-eyebrow{
  color: var(--gold-light);
}

.about-img{
  width: 100%;
  border-radius: 8px;
  height: 380px;
  object-fit: cover;
}

/* ---------- Reviews ---------- */

.review{
  background:white;
  padding: 28px;
  border-radius: 8px;
  box-shadow: 0 6px 20px rgba(20,32,43,0.06);
  height: 100%;
}

.review .stars{
  color: var(--gold);
  letter-spacing: 2px;
  margin-bottom: 12px;
}

.review p{
  color: var(--ink);
  font-style: italic;
}

.review b{
  color: var(--navy);
  font-style: normal;
  display: block;
  margin-top: 10px;
}

/* ---------- CTA ---------- */

.cta-banner{
  background: linear-gradient(120deg, var(--navy) 0%, var(--navy-light) 100%);
  color: white;
  border-radius: 12px;
  padding: 55px;
  text-align: center;
}

.cta-banner h2{
  font-size: 30px;
  margin-bottom: 12px;
}

.cta-banner p{
  color: #cfd5da;
  margin-bottom: 26px;
}

/* ---------- Footer ---------- */

.footer{
  background: #0d161e;
  color: #b7bfc6;
  padding: 55px 0 25px 0;
}

.footer h5{
  color: white;
  font-weight: 700;
  margin-bottom: 16px;
}

.footer a{
  color: #b7bfc6;
  text-decoration: none;
  display: block;
  margin-bottom: 8px;
  font-size: 14px;
}

.footer a:hover{
  color: var(--gold-light);
}

.footer-bottom{
  border-top: 1px solid rgba(255,255,255,0.08);
  margin-top: 35px;
  padding-top: 20px;
  text-align: center;
  font-size: 13px;
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

<!-- Hero Section -->

<section class="hero">

<div class="container">

<span class="hero-eyebrow">Est. 2026 · Boutique Comfort</span>

<h1>A stay that feels like it was arranged just for you</h1>

<p class="lead">
Browse handpicked rooms, check real-time availability, and book in
under a minute. No calls, no waiting — just a clean, honest booking
experience.
</p>

<div class="mt-4 d-flex gap-3 flex-wrap">
<a href="rooms" class="btn btn-gold">Explore Rooms</a>
<a href="myBookings" class="btn-outline-light-custom">View My Bookings</a>
</div>

</div>

</section>

<!-- Stats strip -->

<div class="stats-strip">
<div class="container">
<div class="row text-center">

<div class="col-6 col-md-3 mb-3 mb-md-0">
<div class="stat-num">40+</div>
<div class="stat-label">Rooms Available</div>
</div>

<div class="col-6 col-md-3 mb-3 mb-md-0">
<div class="stat-num">1,200+</div>
<div class="stat-label">Bookings Completed</div>
</div>

<div class="col-6 col-md-3">
<div class="stat-num">4.8/5</div>
<div class="stat-label">Guest Rating</div>
</div>

<div class="col-6 col-md-3">
<div class="stat-num">24/7</div>
<div class="stat-label">Front Desk Support</div>
</div>

</div>
</div>
</div>

<!-- Featured Rooms -->

<div class="section">
<div class="container">

<span class="section-eyebrow">Handpicked</span>
<h2 class="section-title">Featured Rooms</h2>

<div class="row g-4">

<div class="col-md-4">
<div class="room-card">
<div class="room-card-img" style="background-image:url('https://images.unsplash.com/photo-1611892440504-42a792e24d32?q=80&w=800');"></div>
<div class="room-card-body">
<h4>Deluxe Room</h4>
<p class="text-muted mb-2" style="font-size:14px;">City view · King bed · Free WiFi</p>
<span class="room-price">₹3,499 / night</span>
</div>
</div>
</div>

<div class="col-md-4">
<div class="room-card">
<div class="room-card-img" style="background-image:url('https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=800');"></div>
<div class="room-card-body">
<h4>Executive Suite</h4>
<p class="text-muted mb-2" style="font-size:14px;">Balcony · Lounge access · Mini bar</p>
<span class="room-price">₹5,999 / night</span>
</div>
</div>
</div>

<div class="col-md-4">
<div class="room-card">
<div class="room-card-img" style="background-image:url('https://images.unsplash.com/photo-1590490360182-c33d57733427?q=80&w=800');"></div>
<div class="room-card-body">
<h4>Presidential Suite</h4>
<p class="text-muted mb-2" style="font-size:14px;">Private pool · Butler service · Sea view</p>
<span class="room-price">₹12,999 / night</span>
</div>
</div>
</div>

</div>

<div class="text-center mt-5">
<a href="rooms" class="btn btn-outline-dark">View All Rooms →</a>
</div>

</div>
</div>

<!-- Services -->

<div class="section" style="background:white; padding-top:0;">
<div class="container">

<span class="section-eyebrow">Why Stay With Us</span>
<h2 class="section-title">Everything You Need, Included</h2>

<div class="row g-4">

<div class="col-md-3 col-6">

<div class="service-box">
<div class="service-icon">🧹</div>
<h4>Daily Cleaning</h4>
<p>Clean and hygienic rooms, refreshed every day</p>
</div>

</div>

<div class="col-md-3 col-6">

<div class="service-box">
<div class="service-icon">📶</div>
<h4>Free WiFi</h4>
<p>High-speed internet throughout the property</p>
</div>

</div>

<div class="col-md-3 col-6">

<div class="service-box">
<div class="service-icon">🍴</div>
<h4>Food Service</h4>
<p>Round-the-clock in-room dining</p>
</div>

</div>

<div class="col-md-3 col-6">

<div class="service-box">
<div class="service-icon">🏊</div>
<h4>Swimming Pool</h4>
<p>Access to our rooftop pool and deck</p>
</div>

</div>

</div>

</div>
</div>

<!-- About -->

<div class="section about-section">
<div class="container">

<div class="row align-items-center g-5">

<div class="col-md-6">
<img class="about-img" src="https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?q=80&w=900" alt="Hotel lobby">
</div>

<div class="col-md-6">
<span class="section-eyebrow" style="text-align:left;">About Us</span>
<h2 class="section-title" style="text-align:left;">Comfort, Handled Properly</h2>
<p style="color:#cfd5da; line-height:1.8;">
We built this booking system so guests can check real room
availability and reserve instantly, without back-and-forth calls
or waiting on hold. Every room listed here is kept up to date by
our front desk team, so what you see is what you'll get at check-in.
</p>
<p style="color:#cfd5da; line-height:1.8;">
Whether it's a one-night stay or an extended visit, our team
handles the details so you don't have to.
</p>
</div>

</div>

</div>
</div>

<!-- Reviews -->

<div class="section">
<div class="container">

<span class="section-eyebrow">Testimonials</span>
<h2 class="section-title">What Our Guests Say</h2>

<div class="row g-4">

<div class="col-md-4">
<div class="review">
<div class="stars">★★★★★</div>
<p>"Very clean rooms and excellent service. Checked in without any hassle."</p>
<b>— Rahul</b>
</div>
</div>

<div class="col-md-4">
<div class="review">
<div class="stars">★★★★★</div>
<p>"Great experience and friendly staff. Would definitely book again."</p>
<b>— Priya</b>
</div>
</div>

<div class="col-md-4">
<div class="review">
<div class="stars">★★★★★</div>
<p>"Best hotel stay experience I've had. The booking process was so simple."</p>
<b>— Arjun</b>
</div>
</div>

</div>

</div>
</div>

<!-- CTA -->

<div class="container mb-5">
<div class="cta-banner">
<h2>Ready to book your stay?</h2>
<p>Check live availability and reserve your room in under a minute.</p>
<a href="rooms" class="btn btn-gold">Browse Available Rooms</a>
</div>
</div>

<!-- Footer -->

<div class="footer">
<div class="container">

<div class="row g-4">

<div class="col-md-4">
<h5>🏨 HotelBooking</h5>
<p style="font-size:14px; line-height:1.7;">
A simple, reliable way to browse rooms and manage your stay —
built for guests who just want things to work.
</p>
</div>

<div class="col-md-4">
<h5>Quick Links</h5>
<a href="index.jsp">Home</a>
<a href="rooms">Rooms</a>
<a href="myBookings">My Bookings</a>
<a href="register.jsp">Register</a>
</div>

<div class="col-md-4">
<h5>Contact</h5>
<a href="mailto:support@hotel.com">support@hotel.com</a>
<a href="#">+91 63007 33921</a>
<a href="adminLogin.jsp">Admin Login</a>
</div>

</div>

<div class="footer-bottom">
© 2026 HotelBooking. All Rights Reserved.
</div>

</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>