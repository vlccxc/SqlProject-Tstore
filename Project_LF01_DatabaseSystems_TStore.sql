-- ANGGOTA KELOMPOK
-- 2301858313	Billy Yong
-- 2301853943	Fiorenza Fransisca Laura
-- 2301853930	Dikky Larson
-- 2301857443	Vlarancia

CREATE DATABASE TStore
USE TStore

-- BAGIAN B
CREATE TABLE Gender (
	GenderID CHAR(5) PRIMARY KEY,
	[Name] VARCHAR (50)
)

CREATE TABLE Staff (
	StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	[Name] VARCHAR(255) NOT NULL,
	[Address] VARCHAR(255) NOT NULL,
	PhoneNumber VARCHAR(50) CHECK(PhoneNumber LIKE '08%') NOT NULL,
	GenderID CHAR(5) FOREIGN KEY REFERENCES Gender(GenderID),
	Email VARCHAR(255) NOT NULL,
	Salary NUMERIC(15,0) CHECK(Salary >= 3000000) NOT NULL
)

CREATE TABLE Customer (
	CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	GenderID CHAR(5) FOREIGN KEY REFERENCES Gender(GenderID),
	[Name] VARCHAR(255) NOT NULL,
	[Address] VARCHAR(255) NOT NULL,
	PhoneNumber VARCHAR(50) CHECK(PhoneNumber LIKE '08%') NOT NULL,
	Email VARCHAR(255) NOT NULL
)

CREATE TABLE Vendor (
	VendorID CHAR(5) PRIMARY KEY CHECK (VendorID LIKE 'VE[0-9][0-9][0-9]'),
	[Name] VARCHAR(255) NOT NULL,
	[Address] VARCHAR(255) NOT NULL,
	PhoneNumber VARCHAR(50) CHECK(PhoneNumber LIKE '08%') NOT NULL,
	Email VARCHAR(255) NOT NULL
)

CREATE TABLE ClothCategory (
	CategoryID CHAR(5) PRIMARY KEY CHECK (CategoryID LIKE 'CA[0-9][0-9][0-9]'),
	[Name] VARCHAR(255) NOT NULL
)

CREATE TABLE Cloth (
	ClothID CHAR(5) PRIMARY KEY CHECK (ClothID LIKE 'CL[0-9][0-9][0-9]'),
	CategoryID CHAR(5) FOREIGN KEY REFERENCES ClothCategory(CategoryID),
	Brand VARCHAR(255) CHECK(LEN(Brand) > 5) NOT NULL,
	Price NUMERIC(15,0) CHECK(Price >= 20000) NOT NULL,
	Stock INT NOT NULL
)

CREATE TABLE PurchaseTransaction (
	TransactionID CHAR(5) PRIMARY KEY CHECK (TransactionID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID),
	VendorID CHAR(5) FOREIGN KEY REFERENCES Vendor(VendorID),
	PurchaseDate DATETIME CHECK(PurchaseDate < DATEADD(HOUR, -1, GETDATE())) NOT NULL
)

CREATE TABLE PurchaseTransactionDetail (
	TransactionID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransaction(TransactionID),
	ClothesID CHAR(5) FOREIGN KEY REFERENCES Cloth(ClothID),
	Quantity INT NOT NULL
)

CREATE TABLE SalesTransaction (
	SalesID CHAR(5) PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID),
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID),
	SalesDate DATETIME CHECK(SalesDate < DATEADD(HOUR, -1, GETDATE())) NOT NULL
)

CREATE TABLE SalesTransactionDetail (
	SalesID CHAR(5) FOREIGN KEY REFERENCES SalesTransaction(SalesID),
	ClothesID CHAR(5) FOREIGN KEY REFERENCES Cloth(ClothID),
	Quantity INT NOT NULL
)

-- BAGIAN C
-- master data
INSERT INTO Gender VALUES('GE001', 'Male')
INSERT INTO Gender VALUES('GE002', 'Female')

INSERT INTO Staff VALUES('ST120', 'Dikky', 'Jakarta Pusat', '081234567', 'GE001', 'dikky@gmail.com', '4500000')
INSERT INTO Staff VALUES('ST121', 'Vlarancia', 'Cibubur', '087654321', 'GE002', 'vlaran@yahoo.com', '7400000')
INSERT INTO Staff VALUES('ST122', 'Fiorenza', 'Jakarta Barat', '082345678', 'GE002', 'fio@gmail.com' , '3300000')
INSERT INTO Staff VALUES('ST123', 'Billy', 'Bekasi', '088765432', 'GE001', 'billy@gmail.com' , '6200000')
INSERT INTO Staff VALUES('ST124', 'Nikko', 'Padang', '083456789', 'GE001', 'kkoni@yahoo.com' , '4100000')
INSERT INTO Staff VALUES('ST125', 'Sisca', 'Papua', '089876543', 'GE002', 'sis64@hotmail.com' , '8100000')
INSERT INTO Staff VALUES('ST126', 'Maylan', 'Makassar', '084567890', 'GE002', 'lanSon34@gmail.com' , '3900000')
INSERT INTO Staff VALUES('ST127', 'Momon', 'Maluku', '080987654', 'GE002', 'nom90@binus.com' , '5800000')
INSERT INTO Staff VALUES('ST128', 'James', 'Surabaya', '085678901', 'GE001', 'james_angin@yahoo.com' , '4700000')
INSERT INTO Staff VALUES('ST129', 'Jason Octa', 'Denpasar', '081098765', 'GE001', 'octa.jason@binus.com' , '3600000')

INSERT INTO Customer VALUES('CU987', 'GE001', 'Ben Ben', 'Lampung', '0813456789', 'ten_ben@yahoo.com')
INSERT INTO Customer VALUES('CU963', 'GE002', 'Pricilia', 'Pontianak', '0878945613', 'cilla@hotmail.com')
INSERT INTO Customer VALUES('CU789', 'GE002', 'Diamanta', 'Bekasi', '0824567890', 'manta.dia@gmail.com')
INSERT INTO Customer VALUES('CU654', 'GE001', 'Jefman', 'Padang', '0889056724', 'lolajef@binus.com')
INSERT INTO Customer VALUES('CU736', 'GE001', 'Medi', 'Aceh', '0812356789', 'mediam@hotmail.com')
INSERT INTO Customer VALUES('CU456', 'GE001', 'Liong', 'Surabaya', '0878935612', 'liongular@yahoo.com')
INSERT INTO Customer VALUES('CU321', 'GE002', 'Rie', 'Denpasar', '0812346789', 'Rieee@gmail.com')
INSERT INTO Customer VALUES('CU225', 'GE002', 'Angel', 'Denpasar', '0878934612', '4ngell4@hotmail.com')
INSERT INTO Customer VALUES('CU147', 'GE002', 'Lala', 'Medan', '0812345987', 'lalabom@binus.com')
INSERT INTO Customer VALUES('CU123', 'GE001', 'Martin', 'Bekasi', '0898734512', 'Martin_Wisnu@yahoo.com')

INSERT INTO Vendor VALUES('VE010', 'Andeng', 'Palangkaraya', '08987123456', 'gendanggan@hotmail.com')
INSERT INTO Vendor VALUES('VE011', 'King', 'Jambi', '08165432789', 'jamki@gmail.com')
INSERT INTO Vendor VALUES('VE012', 'Feju', 'Palembang', '08984561230', 'Jupalagi@gmail.com')
INSERT INTO Vendor VALUES('VE013', 'Hudo', 'Serang', '08103265984', 'Husendo@yahoo.com')
INSERT INTO Vendor VALUES('VE014', 'Heji', 'Pangkalpinang', '08982378942', 'liHeji@yahoo.com')
INSERT INTO Vendor VALUES('VE015', 'Liso', 'Sukabumi', '08789432980', 'L1Su@gmail.com')
INSERT INTO Vendor VALUES('VE016', 'Saadika', 'Depok', '08189234987', 'deandika@hotmail.com')
INSERT INTO Vendor VALUES('VE017', 'Michael', 'Bengkulu', '08191234567', 'm1cha4el@yahoo.com')
INSERT INTO Vendor VALUES('VE018', 'Gerry', 'Pekalongan', '08765432191', 'gerry_kalong@yahoo.com')
INSERT INTO Vendor VALUES('VE019', 'Ronald', 'Pangkalpinang', '08134569870', 'ronal.pinang@gmail.com')

INSERT INTO ClothCategory VALUES('CA101', 'Sutra')
INSERT INTO ClothCategory VALUES('CA102', 'Poliester')
INSERT INTO ClothCategory VALUES('CA103', 'Katun')
INSERT INTO ClothCategory VALUES('CA104', 'Rajut')
INSERT INTO ClothCategory VALUES('CA105', 'Denim')
INSERT INTO ClothCategory VALUES('CA106', 'Sateen')
INSERT INTO ClothCategory VALUES('CA107', 'Paragon')
INSERT INTO ClothCategory VALUES('CA108', 'Linen')
INSERT INTO ClothCategory VALUES('CA109', 'Sifon')
INSERT INTO ClothCategory VALUES('CA110', 'Brokat')

INSERT INTO Cloth VALUES('CL001', 'CA101', 'Turori Puma', '125000', '20')
INSERT INTO Cloth VALUES('CL002', 'CA102', 'Futeru', '90000', '35')
INSERT INTO Cloth VALUES('CL003', 'CA103', 'Velvet', '120000', '33')
INSERT INTO Cloth VALUES('CL004', 'CA104', 'Homemade', '75000', '35')
INSERT INTO Cloth VALUES('CL005', 'CA105', 'Fashion Style', '70000', '50')
INSERT INTO Cloth VALUES('CL006', 'CA106', 'Lokalis', '60000', '87')
INSERT INTO Cloth VALUES('CL007', 'CA107', 'Simple', '225000', '67')
INSERT INTO Cloth VALUES('CL008', 'CA108', 'Smiles', '73000', '98')
INSERT INTO Cloth VALUES('CL009', 'CA109', 'Janecom', '150000', '100')
INSERT INTO Cloth VALUES('CL010', 'CA110', 'Elegant', '95000', '30')

-- transaction table
INSERT INTO PurchaseTransaction VALUES('PU110', 'ST128', 'VE011', '2020-10-18 10:11:23')
INSERT INTO PurchaseTransaction VALUES('PU111', 'ST126', 'VE010', '2020-11-15 10:30:35')
INSERT INTO PurchaseTransaction VALUES('PU112', 'ST121', 'VE015', '2020-10-23 11:09:02')
INSERT INTO PurchaseTransaction VALUES('PU113', 'ST124', 'VE016', '2020-03-15 11:46:33')
INSERT INTO PurchaseTransaction VALUES('PU114', 'ST125', 'VE019', '2020-04-27 01:43:09')
INSERT INTO PurchaseTransaction VALUES('PU115', 'ST122', 'VE017', '2020-05-11 02:20:44')
INSERT INTO PurchaseTransaction VALUES('PU116', 'ST123', 'VE018', '2020-06-14 05:45:15')
INSERT INTO PurchaseTransaction VALUES('PU117', 'ST120', 'VE013', '2020-08-15 08:04:10')
INSERT INTO PurchaseTransaction VALUES('PU118', 'ST129', 'VE014', '2019-05-11 11:31:09')
INSERT INTO PurchaseTransaction VALUES('PU119', 'ST127', 'VE013', '2019-08-19 01:12:20')
INSERT INTO PurchaseTransaction VALUES('PU120', 'ST123', 'VE014', '2019-10-26 02:47:09')
INSERT INTO PurchaseTransaction VALUES('PU121', 'ST120', 'VE017', '2019-12-09 03:23:11')
INSERT INTO PurchaseTransaction VALUES('PU122', 'ST125', 'VE019', '2019-11-07 05:00:47')
INSERT INTO PurchaseTransaction VALUES('PU123', 'ST124', 'VE012', '2019-09-03 05:45:00')
INSERT INTO PurchaseTransaction VALUES('PU124', 'ST122', 'VE011', '2019-01-17 07:15:20')

INSERT INTO SalesTransaction VALUES('SA001', 'ST128', 'CU123', '2020-10-11 12:00:01')
INSERT INTO SalesTransaction VALUES('SA002', 'ST126', 'CU147', '2020-11-20 02:59:59')
INSERT INTO SalesTransaction VALUES('SA003', 'ST121', 'CU654', '2020-04-15 03:41:00')
INSERT INTO SalesTransaction VALUES('SA004', 'ST124', 'CU225', '2020-01-13 06:30:35')
INSERT INTO SalesTransaction VALUES('SA005', 'ST125', 'CU736', '2020-07-05 09:42:42')
INSERT INTO SalesTransaction VALUES('SA006', 'ST122', 'CU321', '2020-09-28 11:45:43')
INSERT INTO SalesTransaction VALUES('SA007', 'ST123', 'CU456', '2020-10-15 09:46:15')
INSERT INTO SalesTransaction VALUES('SA008', 'ST120', 'CU789', '2020-05-12 12:48:02')
INSERT INTO SalesTransaction VALUES('SA009', 'ST129', 'CU736', '2019-11-08 03:43:15')
INSERT INTO SalesTransaction VALUES('SA010', 'ST127', 'CU654', '2019-12-30 07:47:50')
INSERT INTO SalesTransaction VALUES('SA011', 'ST123', 'CU123', '2019-05-29 09:59:53')
INSERT INTO SalesTransaction VALUES('SA012', 'ST120', 'CU963', '2019-04-18 10:48:49')
INSERT INTO SalesTransaction VALUES('SA013', 'ST121', 'CU789', '2019-07-15 11:34:09')
INSERT INTO SalesTransaction VALUES('SA014', 'ST124', 'CU987', '2019-08-21 08:06:45')
INSERT INTO SalesTransaction VALUES('SA015', 'ST122', 'CU147', '2019-10-17 10:01:12')

-- transaction detail
INSERT INTO PurchaseTransactionDetail VALUES('PU111', 'CL010', '15')
INSERT INTO PurchaseTransactionDetail VALUES('PU118', 'CL009', '30')
INSERT INTO PurchaseTransactionDetail VALUES('PU113', 'CL008', '50')
INSERT INTO PurchaseTransactionDetail VALUES('PU115', 'CL001', '8')
INSERT INTO PurchaseTransactionDetail VALUES('PU119', 'CL006', '19')
INSERT INTO PurchaseTransactionDetail VALUES('PU121', 'CL005', '5')
INSERT INTO PurchaseTransactionDetail VALUES('PU117', 'CL004', '15')
INSERT INTO PurchaseTransactionDetail VALUES('PU120', 'CL003', '10')
INSERT INTO PurchaseTransactionDetail VALUES('PU122', 'CL010', '6')
INSERT INTO PurchaseTransactionDetail VALUES('PU116', 'CL001', '5')
INSERT INTO PurchaseTransactionDetail VALUES('PU114', 'CL006', '38')
INSERT INTO PurchaseTransactionDetail VALUES('PU123', 'CL003', '20')
INSERT INTO PurchaseTransactionDetail VALUES('PU112', 'CL010', '13')
INSERT INTO PurchaseTransactionDetail VALUES('PU124', 'CL007', '20')
INSERT INTO PurchaseTransactionDetail VALUES('PU110', 'CL004', '20')
INSERT INTO PurchaseTransactionDetail VALUES('PU113', 'CL002', '20')
INSERT INTO PurchaseTransactionDetail VALUES('PU111', 'CL009', '30')
INSERT INTO PurchaseTransactionDetail VALUES('PU114', 'CL001', '15')
INSERT INTO PurchaseTransactionDetail VALUES('PU116', 'CL005', '10')
INSERT INTO PurchaseTransactionDetail VALUES('PU115', 'CL008', '40')
INSERT INTO PurchaseTransactionDetail VALUES('PU124', 'CL009', '40')
INSERT INTO PurchaseTransactionDetail VALUES('PU121', 'CL006', '20')
INSERT INTO PurchaseTransactionDetail VALUES('PU118', 'CL008', '8')
INSERT INTO PurchaseTransactionDetail VALUES('PU120', 'CL007', '30')
INSERT INTO PurchaseTransactionDetail VALUES('PU123', 'CL005', '7')

INSERT INTO SalesTransactionDetail VALUES('SA014', 'CL001', '3')
INSERT INTO SalesTransactionDetail VALUES('SA001', 'CL002', '10')
INSERT INTO SalesTransactionDetail VALUES('SA012', 'CL003', '5')
INSERT INTO SalesTransactionDetail VALUES('SA010', 'CL004', '2')
INSERT INTO SalesTransactionDetail VALUES('SA003', 'CL005', '1')
INSERT INTO SalesTransactionDetail VALUES('SA005', 'CL006', '5')
INSERT INTO SalesTransactionDetail VALUES('SA008', 'CL007', '20')
INSERT INTO SalesTransactionDetail VALUES('SA006', 'CL008', '25')
INSERT INTO SalesTransactionDetail VALUES('SA004', 'CL009', '23')
INSERT INTO SalesTransactionDetail VALUES('SA007', 'CL010', '3')
INSERT INTO SalesTransactionDetail VALUES('SA009', 'CL004', '1')
INSERT INTO SalesTransactionDetail VALUES('SA011', 'CL001', '2')
INSERT INTO SalesTransactionDetail VALUES('SA002', 'CL008', '35')
INSERT INTO SalesTransactionDetail VALUES('SA013', 'CL010', '1')
INSERT INTO SalesTransactionDetail VALUES('SA015', 'CL003', '3')
INSERT INTO SalesTransactionDetail VALUES('SA002', 'CL002', '10')
INSERT INTO SalesTransactionDetail VALUES('SA009', 'CL003', '5')
INSERT INTO SalesTransactionDetail VALUES('SA004', 'CL010', '5')
INSERT INTO SalesTransactionDetail VALUES('SA008', 'CL005', '1')
INSERT INTO SalesTransactionDetail VALUES('SA013', 'CL008', '32')
INSERT INTO SalesTransactionDetail VALUES('SA004', 'CL005', '7')
INSERT INTO SalesTransactionDetail VALUES('SA013', 'CL001', '2')
INSERT INTO SalesTransactionDetail VALUES('SA009', 'CL007', '40')
INSERT INTO SalesTransactionDetail VALUES('SA008', 'CL006', '15')
INSERT INTO SalesTransactionDetail VALUES('SA002', 'CL009', '14')

--BAGIAN D
BEGIN TRAN
COMMIT
ROLLBACK
SELECT * FROM Cloth WHERE ClothID = 'CL006'
-- PURCHASE TRANSACTION
-- DML
INSERT INTO PurchaseTransaction VALUES ('PU125', 'ST121', 'VE010', '2020-05-20 15:25:30')
INSERT INTO PurchaseTransactionDetail VALUES ('PU114', 'CL006', '100')
-- SIMULATION
UPDATE Cloth
SET Stock = Stock + 100
WHERE ClothID = 'CL006'

-- SALES TRANSACTION
-- DML
INSERT INTO SalesTransaction VALUES('SA016', 'ST128', 'CU123', '2020-10-30 15:00:00')
INSERT INTO SalesTransactionDetail VALUES('SA016', 'CL006', '15')
-- SIMULATION
UPDATE Cloth
SET Stock = Stock - 15
WHERE ClothID = 'CL006'

DROP DATABASE TStore
--BAGIAN E

--no 1
SELECT COUNT(pt.TransactionID) AS [Transaction Count], s.[Name] AS [StaffName], v.[Name] AS [VendorName]
FROM Staff s
JOIN PurchaseTransaction pt
ON s.StaffID = pt.StaffID
JOIN Vendor v
ON pt.VendorID = v.VendorID
WHERE s.Salary BETWEEN 5000000 AND 10000000
AND v.[Name] LIKE '%o%'
GROUP BY s.[Name], v.[Name]

--no 2
SELECT st.SalesID, st.SalesDate, cu.[Name] AS CustomerName, cu.[Address] AS CustomerAddress
FROM Customer cu
JOIN SalesTransaction st
ON cu.CustomerID = st.CustomerID
JOIN SalesTransactionDetail std
ON st.SalesID = std.SalesID
JOIN Cloth c
ON std.ClothesID = c.ClothID
WHERE DAY(SalesDate) = 15
GROUP BY st.SalesID, st.SalesDate, cu.[Name], cu.[Address]
HAVING SUM(std.Quantity * c.Price) > 150000

--no 3
SELECT DATENAME(MONTH, st.SalesDate) AS [Month], COUNT(st.SalesID) [Transaction Count], SUM(std.Quantity) AS [Cloth Sold Count]
FROM Staff s
JOIN SalesTransaction st
ON s.StaffID = st.StaffID
JOIN SalesTransactionDetail std
ON st.SalesID = std.SalesID
JOIN Cloth c
ON std.ClothesID = c.ClothID
JOIN Gender g
ON s.GenderID = g.GenderID
WHERE s.GenderID LIKE 'GE002'
AND c.Price > 70000
AND st.SalesDate > DATEADD(MONTH, -1, GETDATE()) 
AND st.SalesDate < GETDATE()
GROUP BY DATENAME(MONTH, st.SalesDate)

--no 4
SELECT SUBSTRING(c.Brand, CHARINDEX(' ', c.Brand)+1, LEN(c.Brand) - CHARINDEX(' ', c.Brand)+1) AS [Brand Last Name], MAX(std.Quantity) AS [Maximum Cloth(s) Sold]
FROM Cloth c
JOIN SalesTransactionDetail std
ON c.ClothID = std.ClothesID
GROUP BY c.Brand
HAVING SUM(std.Quantity) BETWEEN 5 AND 10

--no 5
SELECT c.Brand AS ClothBrand, c.Price AS ClothPrice, c.Stock
FROM Cloth c, PurchaseTransactionDetail ptd, PurchaseTransaction pt, Vendor v, (
	SELECT AVG(Price) AS [Average Price]
	FROM Cloth c
) AS ap
WHERE c.ClothID = ptd.ClothesID
AND ptd.TransactionID = pt.TransactionID
AND pt.VendorID = v.VendorID
AND c.Price BETWEEN ap.[Average Price]-35000 AND ap.[Average Price]
AND v.[Name] LIKE 'Saad%'
GROUP BY c.Brand, c.Price, c.Stock

--no 6
SELECT CONVERT(VARCHAR, st.SalesDate, 101) AS [Sales Date], c.Brand AS ClothBrand, SUM(std.Quantity) AS Quantity
FROM SalesTransaction st, SalesTransactionDetail std, Cloth c, (
	SELECT COUNT(st.SalesID) AS [Total Sales]
	FROM SalesTransaction st, SalesTransactionDetail std
	WHERE st.SalesID = std.SalesID 
	AND DATENAME(MONTH, st.SalesDate) LIKE 'May'
) AS q
WHERE st.SalesID = std.SalesID
AND std.ClothesID = c.ClothID
GROUP BY st.SalesDate, c.Brand, std.Quantity, q.[Total Sales]
HAVING SUM(std.Quantity) > q.[Total Sales]
ORDER BY std.Quantity ASC

--no 7
SELECT 
	pt.TransactionID AS PurchaseID, 
	LOWER(s.[Name]) AS [Staff Name], 
	'IDR ' + CAST((s.Salary) AS VARCHAR) AS [Staff Salary],
	CONVERT(VARCHAR, pt.PurchaseDate, 107) AS [Purchase Date],
	SUM(ptd.Quantity) AS [Total Quantity]
FROM Staff s, PurchaseTransaction pt, PurchaseTransactionDetail ptd, (
	SELECT MIN(ptd.Quantity) AS MinQuantity
	FROM PurchaseTransaction pt, PurchaseTransactionDetail ptd
	WHERE pt.TransactionID = ptd.TransactionID 
	AND MONTH(PurchaseDate) LIKE '4'
) AS mq
WHERE s.StaffID = pt.StaffID
AND pt.TransactionID = ptd.TransactionID
AND Quantity > mq.MinQuantity 
GROUP BY pt.TransactionID, s.[Name], s.Salary, pt.PurchaseDate

--no 8
SELECT 
	RIGHT(v.VendorID, 3) AS [Vendor ID],
	v.[Name] AS VendorName, 
	CAST(SUM(ptd.Quantity) AS VARCHAR) + ' piece(s)' AS [Clothes Bought], 
	REPLACE(v.PhoneNumber, LEFT(v.PhoneNumber, 2), '+62') AS [Vendor Phone]
FROM Cloth c, PurchaseTransactionDetail ptd, PurchaseTransaction pt, Vendor v, (
	SELECT AVG(Quantity) AS Quantity
	FROM PurchaseTransactionDetail ptd
) AS q
WHERE c.ClothID = ptd.ClothesID
AND ptd.TransactionID = pt.TransactionID
AND pt.VendorID = v.VendorID
GROUP BY v.VendorID, v.[Name], v.PhoneNumber, q.Quantity
HAVING SUM(ptd.Quantity) > q.Quantity
AND SUM(ptd.Quantity) < 100

--no 9
GO
CREATE VIEW StoreSalesView AS
SELECT 
	st.SalesID, 
	cu.[Name] AS CustomeName, 
	cu.PhoneNumber AS CustomerPhone,
	'IDR ' + CAST(CAST(AVG(c.Price) AS NUMERIC(15, 0)) AS VARCHAR) AS [Cloth Average Price],
	CAST(SUM(std.Quantity) AS VARCHAR) + ' piece(s)' AS [Sales Quantity]
FROM Staff s
JOIN SalesTransaction st
ON s.StaffID = st.StaffID
JOIN SalesTransactionDetail std
ON st.SalesID = std.SalesID
JOIN Cloth c
ON std.ClothesID = c.ClothID
JOIN Customer cu
ON st.CustomerID = cu.CustomerID
GROUP BY st.SalesID, cu.[Name], cu.PhoneNumber
HAVING AVG(c.Price) > 100000 
AND SUM(std.Quantity) > 4

GO
SELECT * FROM StoreSalesView

--no 10
GO
CREATE VIEW StorePurchaseView AS
SELECT 
	DATENAME(MONTH, pt.PurchaseDate) AS [Purchase Month], 
	MIN(ptd.Quantity) AS [Minimum Purchase Quantity],
	COUNT(pt.TransactionID) AS [Purchase Cloth Count]
FROM PurchaseTransaction pt
JOIN PurchaseTransactionDetail ptd
ON pt.TransactionID = ptd.TransactionID
GROUP BY DATENAME(MONTH, pt.PurchaseDate)
HAVING MIN(ptd.Quantity) > 10
AND COUNT(pt.TransactionID) > 1

GO
SELECT * FROM StorePurchaseView