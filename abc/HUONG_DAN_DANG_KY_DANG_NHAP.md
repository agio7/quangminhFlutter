# HƯỚNG DẪN SỬ DỤNG CHỨC NĂNG ĐĂNG KÝ ĐĂNG NHẬP

## ✅ Đã hoàn thành

### 1. **Đăng ký tài khoản**
- Chỉ cần 3 trường: **Tên đăng nhập**, **Mật khẩu**, **Xác nhận mật khẩu**
- Tài khoản được lưu vào:
  - **Web:** Browser LocalStorage
  - **Mobile/Desktop:** File `users.txt` trong bộ nhớ thiết bị
- Kiểm tra trùng tên đăng nhập tự động
- Hiển thị vị trí lưu trữ sau khi đăng ký thành công

### 2. **Đăng nhập**
- Hệ thống kiểm tra theo thứ tự:
  1. **User đã đăng ký** (từ file users.txt) - Ưu tiên
  2. **User API demo** (mor_2314 / 83r5^_)
  3. **User từ Fake Store API**

### 3. **Cấu trúc lưu trữ**

**Web (LocalStorage):**
```json
{
  "registered_users": [
    {
      "username": "testuser",
      "password": "1234",
      "createdAt": "2026-01-07T10:30:00.000Z"
    }
  ]
}
```

**Mobile/Desktop (File users.txt):**
```
username|password|createdAt
testuser|1234|2026-01-07T10:30:00.000Z
admin|admin123|2026-01-07T11:00:00.000Z
```

## 🎯 Cách sử dụng

### Đăng ký tài khoản mới:
1. Mở app → Nhấn "Đăng ký ngay"
2. Nhập tên đăng nhập (tối thiểu 3 ký tự)
3. Nhập mật khẩu (tối thiểu 4 ký tự)
4. Nhập lại mật khẩu để xác nhận
5. Nhấn "Đăng ký"
6. Sau khi thành công → Nhấn "Đăng nhập ngay"

### Đăng nhập:
1. Nhập tên đăng nhập và mật khẩu
2. Nhấn "Đăng nhập"
3. Hệ thống tự động kiểm tra và cho phép truy cập

## 📂 Vị trí lưu trữ

**Web (Browser):** LocalStorage với key `registered_users`
- Chrome DevTools → Application → Local Storage → localhost

**Android:** `/data/data/com.example.qminh/app_flutter/users.txt`

**iOS:** `Documents/users.txt` trong app sandbox

**Windows:** `C:\Users\[username]\AppData\Roaming\com.example.qminh\users.txt`

## 🔧 Files đã tạo/sửa

1. ✅ `lib/services/file_user_service.dart` - Service quản lý file user
2. ✅ `lib/providers/auth_provider.dart` - Thêm hỗ trợ user từ file
3. ✅ `lib/screens/register_screen.dart` - Đơn giản hóa form đăng ký
4. ✅ `pubspec.yaml` - Thêm dependency `path_provider`

## 🚀 Test

### Test đăng ký:
```
Username: testuser
Password: 1234
```

### Test đăng nhập với tài khoản vừa tạo:
```
Username: testuser
Password: 1234
```

### Test đăng nhập với tài khoản demo API:
```
Username: mor_2314
Password: 83r5^_
```

## 💡 Lưu ý

- Tài khoản được lưu **local** trên thiết bị/browser, không đồng bộ giữa các thiết bị
- Mật khẩu được lưu dạng **plain text** (chỉ dùng cho demo/học tập)
- **Web:** Xem trong Chrome DevTools → Application → Local Storage
- **Mobile/Desktop:** File `users.txt` có thể xem được từ đường dẫn hiển thị sau khi đăng ký
- Nếu xóa app hoặc xóa browser data, user cũng bị xóa theo

## 🎉 Kết quả

✅ Đăng ký đơn giản với 3 trường
✅ Đăng nhập hoạt động với tài khoản đã đăng ký
✅ Hỗ trợ cả Web (localStorage) và Mobile/Desktop (file txt)
✅ Kiểm tra trùng username
✅ Hiển thị lỗi chi tiết
✅ Hỗ trợ cả tài khoản local và API

