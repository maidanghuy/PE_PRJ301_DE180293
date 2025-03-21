-- Tạo database
CREATE DATABASE Books_DE180293;
GO

-- Sử dụng database
USE Books_DE180293;
GO

-- Tạo bảng Cards
CREATE TABLE Cards
(
    card_number VARCHAR(20) PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL,
    customer_name NVARCHAR(100) NOT NULL,
    expiration_date DATE NOT NULL,
    is_blocked BIT NOT NULL
);

-- Tạo bảng Transactions
CREATE TABLE Transactions
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    card_number VARCHAR(20) NOT NULL,
    transaction_date DATETIME DEFAULT GETDATE(),
    amount DECIMAL(18,2) NOT NULL,
    transaction_type NVARCHAR(50) NOT NULL,
    FOREIGN KEY (card_number) REFERENCES Cards(card_number)
);

-- Chèn dữ liệu mẫu vào bảng Cards
INSERT INTO Cards
    (card_number, account_number, customer_name, expiration_date, is_blocked)
VALUES
    ('123123123123', 'ACC1001', N'Mai Dang Huy', '2027-05-30', 0),
    ('987987987987', 'ACC2002', N'Mai Dang Huy B', '2026-12-15', 1),
    ('111111111111', 'ACC3003', N'Mai Dang Huy C', '2028-07-20', 0),
    ('555555555555', 'ACC4004', N'Mai Dang Huy D', '2029-11-25', 0),
    ('999999999999', 'ACC5005', N'Mai Dang Huy E', '2025-09-10', 1);
INSERT INTO Cards
    (card_number, account_number, customer_name, expiration_date, is_blocked)
VALUES
    ('222222222222', 'ACC6006', N'Mai Dang Huy F', '2026-08-14', 0),
    ('333333333333', 'ACC7007', N'Mai Dang Huy G', '2027-03-22', 1),
    ('444444444444', 'ACC8008', N'Mai Dang Huy H', '2028-10-05', 0),
    ('666666666666', 'ACC9009', N'Mai Dang Huy I', '2029-06-18', 1),
    ('777777777777', 'ACC1010', N'Mai Dang Huy J', '2030-12-31', 0);


-- Chèn dữ liệu mẫu vào bảng Transactions
INSERT INTO Transactions
    (card_number, amount, transaction_type)
VALUES
    ('123123123123', 500000, N'Withdrawal'),
    ('987987987987', 1000000, N'Deposit'),
    ('111111111111', 200000, N'Withdrawal'),
    ('555555555555', 1500000, N'Deposit'),
    ('999999999999', 300000, N'Transfer'),
    ('123123123123', 250000, N'Payment'),
    ('987987987987', 450000, N'Withdrawal'),
    ('111111111111', 600000, N'Deposit'),
    ('555555555555', 700000, N'Transfer'),
    ('999999999999', 800000, N'Payment'),
    ('123123123123', 900000, N'Deposit'),
    ('987987987987', 100000, N'Transfer');

-- Kiểm tra dữ liệu
SELECT *
FROM Cards;
SELECT *
FROM Transactions;