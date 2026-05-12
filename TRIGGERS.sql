----CREATING AUDIT TABLE----------
CREATE TABLE AuditTable (
	AuditID INT IDENTITY(1,1) PRIMARY KEY,
	TableName nvarchar(100) not null,
	ActionType nvarchar(10) not null,
	userName nvarchar(100) not null,
	ActionDateTime datetime not null,
	Description nvarchar(500) not null
)

-----------CUSTOMER TRIGGER---------
	Create TRIGGER Insert_Trigger
	on sales.customer
	after insert
	as 
	begin
	 insert into AuditTable (TableName, ActionType, userName, ActionDateTime, Description)
		select
			'Sales.Customer',
			'insert',
			SYSTEM_USER,
			GETDATE(),
			'The record that was inserted by ' + SYSTEM_USER + ' belong to customer  with CustomerID: ' + cast(inserted.CustomerID as varchar) from inserted
	
	end


	CREATE TRIGGER Update_Trigger
	on sales.customer
	after update
	as 
	begin
	 insert into AuditTable (TableName, ActionType, userName, ActionDateTime, Description)
		select
			'Sales.Customer',
			'update',
			SYSTEM_USER,
			GETDATE(),
			'The record that was updated by ' + SYSTEM_USER + ' belong to customer  with CustomerID: ' + cast(inserted.CustomerID as varchar) from inserted
	
	end
	CREATE TRIGGER Delete_Trigger
	on sales.customer
	after delete
	as 
	begin
	 insert into AuditTable (TableName, ActionType, userName, ActionDateTime, Description)
		select
			'Sales.Customer',
			'delete',
			SYSTEM_USER,
			GETDATE(),
			'The record that was deleted by ' + SYSTEM_USER + ' belong to customer  with CustomerID: ' + cast(deleted.CustomerID as varchar) from deleted
	
	end


	------PRODUCT TRIGGERS---------

	CREATE TRIGGER Insert_Trigger
	on Production.product
	after insert
	as 
	begin
	 insert into AuditTable (TableName, ActionType, userName, ActionDateTime, Description)
		select
			'Production.product',
			'insert',
			SYSTEM_USER,
			GETDATE(),
			'The record that was inserted by ' + SYSTEM_USER + ' belong to product  with ProductID:  ' + cast(inserted.ProductID as varchar) from inserted
	
	end



	CREATE TRIGGER Update_Trigger
	on Production.product
	after update
	as 
	begin
	 insert into AuditTable (TableName, ActionType, userName, ActionDateTime, Description)
		select
			'Production.product',
			'update',
			SYSTEM_USER,
			GETDATE(),
			'The record that was updated by ' + SYSTEM_USER + ' belong to product  with ProductID: ' + cast(inserted.ProductID as varchar) from inserted
	
	end
	CREATE TRIGGER Delete_Trigger
	on Production.product
	after delete
	as 
	begin
	 insert into AuditTable (TableName, ActionType, userName, ActionDateTime, Description)
		select
			'Production.product',
			'delete',
			SYSTEM_USER,
			GETDATE(),
			'The record that was deleted by ' + SYSTEM_USER + ' belong to product  with ProductID:  ' + cast(deleted.ProductID as varchar) from deleted
	
	end

	------------TESTING---------
update Sales.Customer
set ModifiedDate=GETDATE()
where CustomerID=56

update Production.Product
set ListPrice=78
where ProductID=1
select * from AuditTable
