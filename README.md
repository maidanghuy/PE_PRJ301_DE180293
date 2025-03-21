# Hệ Thống Quản Lý Thẻ ATM 💳

Ứng dụng web Java quản lý thẻ ATM, cho phép xem danh sách thẻ, thực hiện các giao dịch và thống kê giao dịch theo từng loại.

![Banner](https://i.imgur.com/zjXnA0x.png)

## 📋 Mô tả dự án

Hệ thống Quản Lý Thẻ ATM là một ứng dụng web được phát triển bằng Java Servlet, JSP và JSTL, sử dụng cơ sở dữ liệu Microsoft SQL Server. Ứng dụng được xây dựng theo mô hình MVC (Model-View-Controller) và cung cấp giao diện trực quan, thân thiện với người dùng.

### Chức năng chính:

- ✅ Hiển thị danh sách thẻ ATM với thông tin chi tiết
- ✅ Theo dõi trạng thái hoạt động của thẻ (hoạt động/bị khóa)
- ✅ Thêm các giao dịch mới (rút tiền, nạp tiền, chuyển khoản)
- ✅ Xem lịch sử giao dịch của từng thẻ
- ✅ Thống kê tổng tiền theo từng loại giao dịch
- ✅ Kiểm tra thẻ khóa trước khi cho phép giao dịch

## 🚀 Công nghệ sử dụng

- **Back-end**: Java Servlet, JSP, JSTL
- **Cơ sở dữ liệu**: Microsoft SQL Server
- **Front-end**: HTML, CSS, JSP
- **Máy chủ ứng dụng**: Apache Tomcat 10
- **IDE**: NetBeans
- **Java Version**: JDK 17

## 📁 Cấu trúc dự án

```
PRJ301_DE180293/
├── src/
│   └── java/
│       ├── controller/          # Các servlet điều khiển
│       │   ├── DivideServlet.java
│       │   └── TransactionServlet.java
│       ├── dao/                 # Data Access Objects
│       │   ├── CardDAO.java
│       │   └── TransactionDAO.java
│       ├── db/                  # Kết nối database
│       │   ├── ConnectDB.java
│       │   └── DatabaseInfo.java
│       ├── filter/              # Bộ lọc
│       │   └── CardBlockFilter.java
│       └── model/               # Các đối tượng nghiệp vụ
│           ├── Card.java
│           └── Transaction.java
├── web/
│   ├── views/                   # Các trang JSP
│   │   ├── auth/
│   │   │   └── transaction.jsp
│   │   └── home.jsp
│   └── WEB-INF/
│       └── web.xml
└── database/
    └── CreateDB.sql             # Script tạo cơ sở dữ liệu
```

## 💾 Cơ sở dữ liệu

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

## 🏗️ Mô hình phân lớp (MVC)

### Model

- **Card.java**: Chứa thông tin về thẻ ATM (số thẻ, tên chủ thẻ, ngày hết hạn, trạng thái)
- **Transaction.java**: Chứa thông tin về giao dịch (ID, số thẻ, số tiền, loại giao dịch, ngày giao dịch)

### DAO (Data Access Object)

- **CardDAO.java**: Truy xuất dữ liệu về thẻ (lấy danh sách thẻ, kiểm tra trạng thái thẻ)
- **TransactionDAO.java**: Truy xuất dữ liệu về giao dịch (thêm giao dịch, lấy lịch sử giao dịch, tính tổng tiền theo loại)

### Controller

- **DivideServlet.java**: Xử lý hiển thị danh sách thẻ, xem giao dịch và thống kê
- **TransactionServlet.java**: Xử lý thêm giao dịch mới và kiểm tra tính hợp lệ

### View

- **home.jsp**: Hiển thị danh sách thẻ ATM, lịch sử giao dịch và bảng thống kê
- **transaction.jsp**: Form thêm giao dịch mới

## 📋 Chức năng chi tiết

### 1. Xem danh sách thẻ

- Hiển thị tất cả thẻ ATM trong hệ thống với giao diện hiện đại
- Phân biệt rõ ràng giữa thẻ đang hoạt động và thẻ bị khóa
- Cung cấp các nút chức năng cho từng thẻ (Xem giao dịch, Thêm giao dịch)

### 2. Xem giao dịch của thẻ

- Hiển thị lịch sử giao dịch theo thứ tự thời gian
- Hiển thị chi tiết: ID, số tiền, loại giao dịch (với màu sắc phân biệt), ngày giao dịch
- Tự động tính toán tổng tiền theo từng loại giao dịch

### 3. Thêm giao dịch mới

- Giao diện form đơn giản, dễ sử dụng
- Hỗ trợ 3 loại giao dịch: Rút tiền, Nạp tiền, Chuyển khoản
- Kiểm tra thẻ bị khóa và hiển thị thông báo phù hợp

### 4. Thống kê giao dịch

- Tính tổng tiền theo từng loại giao dịch (Withdrawal, Deposit, Transfer)
- Hiển thị bảng thống kê với thiết kế trực quan, dễ đọc

## ⚙️ Hướng dẫn cài đặt và sử dụng

### Yêu cầu hệ thống

- JDK 17 trở lên
- Apache Tomcat 10
- Microsoft SQL Server
- NetBeans IDE 18 trở lên

### Cài đặt

1. **Clone dự án từ GitHub**

   ```
   git clone https://github.com/yourusername/PRJ301_DE180293.git
   ```

2. **Thiết lập cơ sở dữ liệu**

   - Mở SQL Server Management Studio
   - Chạy script SQL trong tệp `database/CreateDB.sql`

3. **Cấu hình kết nối cơ sở dữ liệu**

   - Mở file `src/java/db/DatabaseInfo.java`
   - Cập nhật thông tin kết nối (username, password, port) phù hợp với môi trường của bạn

4. **Biên dịch và triển khai**

   - Mở dự án trong NetBeans
   - Chuột phải vào dự án và chọn "Clean and Build"
   - Chuột phải vào dự án và chọn "Run"

5. **Truy cập ứng dụng**
   - Mở trình duyệt web
   - Truy cập: `http://localhost:8080/PRJ301_DE180293/DivideServlet`

## 💡 Một số tính năng nổi bật

- **Giao diện hiện đại**: Thiết kế responsive, hỗ trợ nhiều thiết bị
- **Phân biệt trạng thái**: Hiển thị rõ ràng trạng thái thẻ bằng màu sắc và biểu tượng
- **Thống kê trực quan**: Bảng tổng hợp giao dịch theo từng loại
- **Xác thực dữ liệu**: Kiểm tra tính hợp lệ của thẻ trước khi thực hiện giao dịch
- **Thông báo**: Hệ thống thông báo lỗi và thành công rõ ràng

## 👨‍💻 Tác giả

- **Họ tên**: Mai Đăng Huy
- **Mã sinh viên**: DE180293
- **Lớp**: SE18D04
- **Môn học**: PRJ301 - Java Web Application Development

## 📄 Giấy phép

Dự án được phát triển cho mục đích học tập trong môn PRJ301 tại FPT University.

---

© 2024 Mai Đăng Huy - DE180293
