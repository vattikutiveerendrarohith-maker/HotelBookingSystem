<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register | HotelBooking</title>

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
  min-height: 100vh;
}

h1, h2, h3{
  font-family: 'Playfair Display', serif;
}

.auth-wrapper{
  min-height: 100vh;
  display: flex;
}

.auth-visual{
  flex: 1;
  background:
    linear-gradient(180deg, rgba(20,32,43,0.6) 0%, rgba(20,32,43,0.85) 100%),
    url('https://images.unsplash.com/photo-1611892440504-42a792e24d32?q=80&w=1200');
  background-size: cover;
  background-position: center;
  color: white;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 60px;
}

.auth-visual span{
  color: var(--gold-light);
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 13px;
  font-weight: 600;
  margin-bottom: 14px;
  display: block;
}

.auth-visual h1{
  font-size: 34px;
  font-weight: 700;
  line-height: 1.3;
  max-width: 380px;
}

.auth-visual p{
  color: #cfd5da;
  margin-top: 16px;
  max-width: 360px;
}

.auth-form-side{
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px 20px;
}

.register-box{
  width: 100%;
  max-width: 420px;
  background: white;
  padding: 42px;
  border-radius: 12px;
  box-shadow: 0 10px 40px rgba(20,32,43,0.1);
}

.register-box .eyebrow{
  color: var(--gold);
  text-transform: uppercase;
  letter-spacing: 1.5px;
  font-size: 12px;
  font-weight: 700;
}

.register-box h2{
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

.btn-register{
  background: var(--navy);
  color: white;
  border: none;
  padding: 12px 0;
  border-radius: 6px;
  font-weight: 600;
  width: 100%;
  margin-top: 8px;
  transition: background 0.2s ease;
}

.btn-register:hover{
  background: var(--navy-light);
  color: var(--gold-light);
}

.auth-footer-link{
  text-align: center;
  margin-top: 22px;
  font-size: 14px;
  color: var(--muted);
}

.auth-footer-link a{
  color: var(--gold);
  font-weight: 600;
  text-decoration: none;
}

.auth-footer-link a:hover{
  text-decoration: underline;
}

@media (max-width: 900px){
  .auth-visual{
    display: none;
  }
}

</style>

</head>
<body>

<div class="auth-wrapper">

<div class="auth-visual">
<span>Join HotelBooking</span>
<h1>Create an account and book in seconds</h1>
<p>Save your details, track your bookings, and check availability faster next time you stay with us.</p>
</div>

<div class="auth-form-side">

<div class="register-box">

<div class="eyebrow">Get Started</div>
<h2>Customer Registration</h2>

<form action="registerCustomer" method="post">

<div class="mb-3">
<label class="form-label">Name</label>
<input type="text"
name="name"
class="form-control"
placeholder="Enter your full name"
required>
</div>

<div class="mb-3">
<label class="form-label">Email</label>
<input type="email"
name="email"
class="form-control"
placeholder="you@example.com"
required>
</div>

<div class="mb-3">
<label class="form-label">Password</label>
<input type="password"
name="password"
class="form-control"
placeholder="Create a password"
required>
</div>

<div class="mb-3">
<label class="form-label">Phone</label>
<input type="text"
name="phone"
class="form-control"
placeholder="Enter your phone number"
required>
</div>

<button class="btn-register" type="submit">

Register

</button>

</form>

<div class="auth-footer-link">
Already have an account? <a href="customerLogin.jsp">Login here</a>
</div>

</div>

</div>

</div>

</body>
</html>