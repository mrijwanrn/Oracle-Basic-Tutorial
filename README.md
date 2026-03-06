# Oracle Basic Tutorials – Oracle APEX Application

## Overview
Oracle Basic Tutorials is a web-based learning management application developed using Oracle APEX and Oracle Database. The application provides structured tutorials for learning Oracle SQL, PL/SQL, and Oracle APEX through an interactive card-based dashboard.

The system demonstrates practical usage of Oracle APEX features including dynamic cards, modal dialog forms, drawer pages, and interactive reports.

---

## Key Features

### Dynamic Dashboard
The Home page displays course categories using a Cards Region.

Available Courses:
- SQL Reference
- PL/SQL Essentials
- Oracle APEX Essentials
- MCQ Practice

Each card redirects to its respective tutorial module.

---

### Dual Navigation System
The application supports two navigation methods:

1. Card Navigation
- Select course card from Home page
- Redirects to course dashboard

2. Hamburger Menu Navigation
- Open sidebar menu
- Navigate through Course section
- Select SQL / PL/SQL / Oracle APEX modules

---

## Course Dashboard
Each course dashboard displays tutorials in card format including:

- Topic Number
- Tutorial Title
- Summary
- Last Updated Information

Cards are dynamically generated using SQL queries from the database.

---

## Tutorial Detail View
When a user clicks a tutorial card:

- A Drawer Page opens
- Detailed tutorial content is displayed
- The dashboard remains visible in the background

The drawer contains:
- Tutorial title
- Module content
- Structured explanations
- Section headings

---

## Add New Tutorial
Each course dashboard includes an Add Tutorial button.

Steps to Add Tutorial:

1. Click Add Tutorial
2. A Modal Dialog form opens
3. Fill required fields:
   - Category
   - Topic Number (Auto Generated)
   - Title
   - Summary
4. Click Create

The system will:
- Insert the record into the database
- Automatically generate topic number
- Refresh the dashboard
- Display the new tutorial card

---

## Review Module
The application includes a Review page for course evaluation.

The report displays:

- Tutorial Title
- Category
- Duration
- Test Rating
- Feedback

Features include:
- Search
- Sorting
- Filtering
- Export options

---

## Database Tables

### COURSE_TOPICS
Stores tutorial information.

Columns include:
- TOPIC_ID
- CATEGORY
- TOPIC_NO
- TITLE
- SUMMARY
- FULL_CONTENT
- CREATED_AT
- UPDATED_AT

### COURSE_CARDS
Stores dashboard card information.

Columns include:
- CARD_ID
- CARD_TITLE
- CARD_SUBTITLE
- IMAGE_URL
- DISPLAY_ORDER
- STATUS

---

## Technologies Used
- Oracle APEX
- Oracle Database
- SQL
- PL/SQL
- Interactive Reports
- Cards Region
- Modal Dialog Pages
- Drawer Pages
- Dynamic SQL Queries
- Session State Protection

---

## Security Features
The application includes:

- Secure URL navigation using APEX_PAGE.GET_URL
- Session State Protection
- Controlled form submission
- Protected page items

---

## Application Architecture

Page 1 – Home Dashboard  
Page 4 – Learn SQL  
Page 5 – Learn PL/SQL  
Page 6 – Learn APEX  
Page 7–13 – Tutorial Detail Pages  
Page 14 – Review Module  
Page 15 – Exam Page  
Page 16 – Create New Tutorial (Modal Form)  
Page 17–21 – PL/SQL Modules  
Page 27–31 – APEX Modules

---

## Additional Features

Switch Button  
Allows users to quickly return to the Home page from any module.

Install App  
Supports Progressive Web App (PWA) installation for desktop and mobile devices.

---

## Release Information

Developer: Mohammad Rijwan  
Version: 1.0  
Platform: Oracle APEX  
Deployment Type: Web Application

---

## Project Purpose
This project demonstrates real-world usage of Oracle APEX to build a scalable and structured tutorial management system using database-driven architecture.

---

## Repository Contents

This repository includes:

- Oracle APEX Application Export File
- SQL Scripts
- Backend Documentation
- Frontend Documentation
- HTML Tutorial Content
- Application Screenshots

---

## Author

Mohammad Rijwan  
Oracle APEX Developer
