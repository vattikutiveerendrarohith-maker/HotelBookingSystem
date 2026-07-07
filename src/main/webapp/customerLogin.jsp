<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Customer Login | HotelBooking</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>

:root{
  --navy: #14202b;
  --navy-light: #1d2f3d;
  --gold: #c9a24b;
  --gold-light: #e0c98a;
  --muted: #6b7280;
}

*{ box-sizing: border-box; }

body{
  margin:0;
  padding:0;
  min-height: 100vh;
  background: var(--navy);
  font-family: 'Inter', sans-serif;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

.login-box{
  width: 100%;
  max-width: 400px;
  background: white;
  padding: 42px;
  border-radius: 10px;
  box-shadow: 0 20px 60px rgba(0,0,0,0.35);
}

.login-badge{
  width: 46px;
  height: 46px;
  background: var(--navy);
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 22px;
  margin-bottom: 20px;
}

.login-box .eyebrow{
  color: var(--gold);
  text-transform: uppercase;
  letter-spacing: 1.5px;
  font-size: 12px;
  font-weight: 700;
}

.login-box h2{
  font-family: 'Playfair Display', serif;
  font-size: 24px;
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

.btn-login{
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

.btn-login:hover{
  background: var(--navy-light);
  color: var(--gold-light);
}

.back-link{
  text-align: center;
  margin-top: 20px;
  font-size: 13px;
}

.back-link a{
  color: var(--muted);
  text-decoration: none;
}

.back-link a:hover{
  color: var(--gold);
}

</style>

</head>
<body>

<div class="login-box">

<div class="login-badge">🔐</div>

<div class="eyebrow">Customer Access</div>
<h2>Customer Login</h2>

<form action="customerLogin" method="post">

<div class="mb-3">
<label class="form-label">Email</label>

<input type="email"
       name="email"
       class="form-control"
       placeholder="Enter your email"
       required>
</div>

<div class="mb-3">
<label class="form-label">Password</label>
<input type="password"
       name="password"
       class="form-control"
       placeholder="Enter your password"
       required>
</div>

<button class="btn-login" type="submit">

Login

</button>

</form>

<div class="back-link">
<a href="index.jsp">← Back to homepage</a>
</div>

</div>

</body>
</html>