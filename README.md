# 🏨 Hotel Booking System

A full-stack Hotel Booking System developed using Java, JSP, Servlets, JDBC, MySQL, HTML, CSS, and Bootstrap. The application allows customers to register, log in, browse available rooms, book rooms, and manage their bookings. It also provides an admin panel to manage rooms and view customer bookings.

---

## 🚀 Features

### Customer
- Customer Registration
- Customer Login & Logout
- View Available Rooms
- Book Rooms
- View My Bookings
- Session Management

### Admin
- Admin Login
- Add New Rooms
- Edit Room Details
- Delete Rooms
- View All Bookings
- Manage Hotel Rooms

---

## 🛠️ Technologies Used

### Backend
- Java
- JSP
- Servlets
- JDBC

### Frontend
- HTML5
- CSS3
- Bootstrap 5
- JavaScript

### Database
- MySQL

### Server
- Apache Tomcat 10

### IDE
- Eclipse IDE

### Version Control
- Git
- GitHub

---

## 📂 Project Structure

```
HotelBookingSystem
│
├── src/
│   ├── controller/
│   ├── dao/
│   ├── daoImpl/
│   ├── model/
│   └── util/
│
├── WebContent/
│   ├── index.jsp
│   ├── rooms.jsp
│   ├── customerLogin.jsp
│   ├── register.jsp
│   ├── adminDashboard.jsp
│   └── ...
│
├── pom.xml
└── README.md
```

---

## Database

Create a MySQL database.

```sql
CREATE DATABASE hotel_booking;
```

Import the SQL file provided with the project.

Update the database connection in:

```
util/DBConnection.java
```

---

## ▶️ How to Run

1. Clone the repository

```
git clone https://github.com/vattikutiveerendrarohith-maker/HotelBookingSystem.git
```

2. Import the project into Eclipse.

3. Configure Apache Tomcat 10.

4. Create the MySQL database.

5. Update the database username and password in `DBConnection.java`.

6. Run the project on Tomcat.

---

## Future Improvements

- Online Payment Integration
- Email Notifications
- OTP Verification
- Room Availability Calendar
- Search & Filter Rooms
- Customer Profile Management
- Booking Cancellation
- Forgot Password
- Hotel Image Gallery
- Reports & Analytics

---

## Author

**Veerendra Rohith**

GitHub:
https://github.com/vattikutiveerendrarohith-maker

---

## License

This project is developed for learning and portfolio purposes.
