# Hệ Thống Quản Lý Thẻ ATM

Ứng dụng web Java quản lý thẻ ATM, cho phép xem danh sách thẻ, thực hiện các giao dịch và xem thống kê giao dịch theo từng loại.

## Mô tả dự án

Hệ thống Quản Lý Thẻ ATM là một ứng dụng web được phát triển bằng Java Servlet, JSP và JSTL, sử dụng cơ sở dữ liệu Microsoft SQL Server. Ứng dụng cung cấp các chức năng quản lý thẻ ATM và giao dịch, bao gồm:

- Hiển thị danh sách thẻ ATM
- Theo dõi trạng thái hoạt động của thẻ (hoạt động/bị khóa)
- Thêm các giao dịch mới (rút tiền, nạp tiền, chuyển khoản)
- Xem lịch sử giao dịch của từng thẻ
- Thống kê tổng tiền theo từng loại giao dịch

## Cấu trúc dự án

```
PRJ301_DE180293/
├── src/
│   └── java/
│       ├── controller/
│       │   ├── DivideServlet.java
│       │   └── TransactionServlet.java
│       ├── dao/
│       │   ├── CardDAO.java
│       │   └── TransactionDAO.java
│       ├── db/
│       │   ├── ConnectDB.java
│       │   └── DatabaseInfo.java
│       ├── filter/
│       │   └── CardBlockFilter.java
│       └── model/
│           ├── Card.java
│           └── Transaction.java
├── web/
│   ├── views/
│   │   ├── auth/
│   │   │   └── transaction.jsp
│   │   └── home.jsp
│   └── WEB-INF/
│       └── web.xml
└── database/
    └── CreateDB.sql
```

## Cơ sở dữ liệu

Dự án sử dụng Microsoft SQL Server với hai bảng chính:

### Bảng Cards

```sql
CREATE TABLE Cards (
    card_number VARCHAR(20) PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL,
    customer_name NVARCHAR(100) NOT NULL,
    expiration_date DATE NOT NULL,
    is_blocked BIT NOT NULL
);
```

### Bảng Transactions

```sql
CREATE TABLE Transactions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    card_number VARCHAR(20) NOT NULL,
    transaction_date DATETIME DEFAULT GETDATE(),
    amount DECIMAL(18,2) NOT NULL,
    transaction_type NVARCHAR(50) NOT NULL,
    FOREIGN KEY (card_number) REFERENCES Cards(card_number)
);
```

## Mô hình phân lớp (MVC)

### Model

- **Card.java**: Đại diện cho thông tin của thẻ ATM
- **Transaction.java**: Đại diện cho thông tin giao dịch

### DAO (Data Access Object)

- **CardDAO.java**: Cung cấp các phương thức truy xuất cơ sở dữ liệu liên quan đến thẻ
- **TransactionDAO.java**: Cung cấp các phương thức truy xuất cơ sở dữ liệu liên quan đến giao dịch

### Controller

- **DivideServlet.java**: Xử lý các yêu cầu liên quan đến hiển thị danh sách thẻ và xem giao dịch
- **TransactionServlet.java**: Xử lý các yêu cầu liên quan đến thêm giao dịch mới

### View

- **home.jsp**: Hiển thị danh sách thẻ, danh sách giao dịch và thống kê
- **transaction.jsp**: Form thêm giao dịch mới

## Chức năng chính

### Xem danh sách thẻ

- Hiển thị tất cả thẻ ATM trong hệ thống
- Hiển thị thông tin chi tiết: số thẻ, chủ thẻ, ngày hết hạn, trạng thái

### Xem giao dịch của thẻ

- Hiển thị lịch sử giao dịch của thẻ được chọn
- Hiển thị thông tin chi tiết: ID, số tiền, loại giao dịch, ngày giao dịch

### Thêm giao dịch mới

- Tạo giao dịch mới cho thẻ (rút tiền, nạp tiền, chuyển khoản)
- Kiểm tra trạng thái thẻ trước khi cho phép thực hiện giao dịch

### Thống kê giao dịch

- Tính tổng tiền theo từng loại giao dịch (rút tiền, nạp tiền, chuyển khoản)
- Hiển thị số liệu thống kê khi xem giao dịch của thẻ

## Công nghệ sử dụng

- **Ngôn ngữ lập trình**: Java
- **Framework**: Java Servlet, JSP, JSTL
- **Cơ sở dữ liệu**: Microsoft SQL Server
- **Front-end**: HTML, CSS, JSP
- **Máy chủ ứng dụng**: Apache Tomcat 10
- **Công cụ phát triển**: NetBeans

## Hướng dẫn cài đặt

1. **Yêu cầu hệ thống**

   - JDK 17 trở lên
   - Apache Tomcat 10
   - Microsoft SQL Server
   - NetBeans IDE

2. **Thiết lập cơ sở dữ liệu**

   - Chạy script SQL trong tệp `database/CreateDB.sql` để tạo cơ sở dữ liệu và các bảng

3. **Cấu hình kết nối**

   - Cập nhật thông tin kết nối trong `src/java/db/DatabaseInfo.java`

4. **Biên dịch và triển khai**

   - Mở dự án trong NetBeans
   - Xây dựng dự án (Build)
   - Triển khai lên Tomcat (Deploy)

5. **Truy cập ứng dụng**
   - Mở trình duyệt và truy cập: `http://localhost:8080/PRJ301_DE180293/DivideServlet`

## Tác giả

- **Họ tên**: Mai Đăng Huy
- **Mã sinh viên**: DE180293
- **Lớp**: SE18D04
- **Môn học**: PRJ301 - Java Web Application Development
# PE_PRJ301_DE180293
