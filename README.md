# DBA-Management
ENTERPRISE DATABASE MANAGEMENT & MONITORING  SYSTEM
I designed, implemented, and manage a secure, efficient, and monitored database system using AdventureWorks2022 database Using MS SQL

I demonstrated my ability to: 
• Automate database operations  
• Secure access using roles  
• Monitor and improve performance  
• Track changes using triggers  
• Send automated alerts to the DBA  

======= STORED PROCEDURES==================

-	AddNewCustomer:
 Inserts customer data into multiple related tables using transactions and error handling.(coming soon!!!!)

-	UpdateProductPrice:
 Updates product prices with validation.

-	Deleting/archiving InactiveCustomers(coming soon!!!!)
Deleting/Archiving inactive customers based on last purchase

-	MonthlySalesReport:(coming soon!!!!)
 Aggregates sales per month.

-	Top10BestSellingProducts:(coming soon!!!!)
 Returns top-selling products.

-	EmployeePerformanceHistory: 
Tracks employee order handling.

-	Monitoring procedures:
 Detect long queries, database size, and index fragmentation.

========Security =======
- Created Roles and giving permission to roles based on thier different roles on the database
- Assigned different users to those rules
- created their LogIn details

========= performane ==========
- created the index that will better the perfomance
- I also optimized the queries using the execution plans

========TRIGGER AND ALERT ================

Audit Table - Stores table name, action type, user, timestamp, and description.

Triggers are created on Customer and Product tables for INSERT, UPDATE, DELETE operations.

1. User performs action.
2. Trigger fires automatically.
3. Data is logged into AuditTable with user and timestamp.

Alerts
-System logs all activities and can send alerts using Database Mail and SQL Server Agent.
- Also sends emails if sensitive data is updated and when the price changed more than 10%(coming soon!!!!)

========= Backup & Recovery =========
- Also created quereis for backup : Full Backup, Differential Backup & Transaction Log Backup
- Also created quereis for Restore : Full Backup, Differential Backup & Transaction Log Backup




