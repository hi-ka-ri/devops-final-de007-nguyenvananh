# Campus Hub — Docker & Docker Compose

> **Lưu ý:** ZIP đầu vào được cung cấp là project mẫu `PTITSession12Ex5` (bài IT209 Session 12 Exercise 05), không chứa source code Campus Hub Base. Các cấu hình Docker dưới đây đã được bổ sung để minh họa backend Spring Boot + MySQL + Actuator trên project hiện có; cần thay source bằng Campus Hub Base thật nếu đề thi yêu cầu đúng ứng dụng Campus Hub.

## Thông tin sinh viên

- Họ tên: Nguyễn Văn Ánh
- Mã sinh viên: B24DTCN076

## 1. Kiểm thử bằng Gradle

Windows PowerShell:

```powershell
.\gradlew.bat clean test
```

Linux/macOS/Git Bash:

```bash
chmod +x gradlew
./gradlew clean test
```

## 2. Build Docker Image

```bash
docker build -t campus-hub-backend:latest .
docker images
```

## 3. Chạy backend và MySQL

Tại thư mục chứa `compose.yml`:

```bash
docker compose config
docker compose up -d --build
docker compose ps
docker compose logs -f backend
```

Compose dùng tên service `mysql` trong JDBC URL (`jdbc:mysql://mysql:3306/campus_hub`), không dùng `localhost` để backend kết nối tới MySQL.

## 4. Kiểm tra health endpoint

Mở trình duyệt hoặc chạy:

```bash
curl http://localhost:8080/actuator/health
```

Kết quả mong đợi khi ứng dụng khởi động thành công:

```json
{"status":"UP"}
```

Nếu dùng PowerShell:

```powershell
Invoke-RestMethod http://localhost:8080/actuator/health
```

MySQL được công khai ở cổng `3307` trên máy host; backend ở cổng `8080`. Dữ liệu MySQL được lưu trong named volume `campus_hub_mysql_data`.

## 5. Minh chứng cần thêm trước khi nộp

Chụp 2–3 ảnh thật từ máy của bạn:
1. Kết quả `docker images` có `campus-hub-backend`.
2. Kết quả `docker compose ps` cho thấy backend và MySQL đang chạy.
3. Kết quả gọi `http://localhost:8080/actuator/health` trả về `UP`.

Không đưa mật khẩu thật hoặc token vào GitHub. Mật khẩu mặc định trong file Compose chỉ dùng cho bài lab; có thể đặt biến môi trường `MYSQL_PASSWORD` và `MYSQL_ROOT_PASSWORD` trước khi chạy.
