# 📱 QUẢN LÝ CỬA HÀNG - Mobile Retail Management App

Ứng dụng quản lý bán hàng di động được xây dựng bằng Flutter, sử dụng FakeStore API để quản lý sản phẩm, đơn hàng, khách hàng và thực hiện các giao dịch bán hàng.

## 🎯 Giới thiệu

**Quản Lý Cửa Hàng** là một ứng dụng quản lý bán hàng toàn diện dành cho mobile, giúp:
- Quản lý kho hàng và sản phẩm
- Thực hiện bán hàng tại quầy (POS)
- Theo dõi đơn hàng và doanh thu
- Quản lý thông tin khách hàng
- Xem báo cáo và thống kê

## ✨ Tính năng chính

### 📊 Dashboard (Tổng quan)
- Hiển thị tổng doanh thu, tổng khách hàng, tổng sản phẩm
- Biểu đồ thống kê sản phẩm theo danh mục
- Danh sách đơn hàng mới nhất

### 🏪 POS (Bán hàng)
- Hiển thị sản phẩm dưới dạng lưới 2 cột
- Thêm sản phẩm vào giỏ hàng
- Quản lý giỏ hàng và thanh toán

### 📦 Quản lý sản phẩm
- Xem danh sách tất cả sản phẩm
- Thêm sản phẩm mới vào kho
- Sửa/Xóa sản phẩm (đang phát triển)

### 📝 Quản lý đơn hàng
- Xem lịch sử tất cả đơn hàng
- Chi tiết từng đơn hàng với tổng tiền

### 👥 Quản lý khách hàng
- Danh sách khách hàng với thông tin đầy đủ

### 📂 Danh mục
- Xem và lọc sản phẩm theo danh mục

### 💻 Developer Console
- Xem lịch sử API calls
- Debug và kiểm tra lỗi
- Format JSON tự động

### ⚙️ Cài đặt
- Chế độ tối/sáng
- Đăng nhập hệ thống

## 🛠️ Công nghệ sử dụng

- **Framework:** Flutter (Material 3)
- **State Management:** Provider
- **Networking:** HTTP package
- **Local Storage:** Shared Preferences
- **API:** FakeStore API (https://fakestoreapi.com)

## 📦 Cài đặt

1. Clone repository:
```bash
git clone <repository-url>
cd qminh
```

2. Cài đặt dependencies:
```bash
flutter pub get
```

3. Chạy app:
```bash
flutter run
```

## 📱 Yêu cầu hệ thống

- Flutter SDK: ^3.10.3
- Dart SDK: Tương thích với Flutter 3.10.3
- Android: API level 21 trở lên
- iOS: iOS 12.0 trở lên

## 📚 Tài liệu

Xem file [HUONG_DAN_SU_DUNG.md](./HUONG_DAN_SU_DUNG.md) để biết hướng dẫn sử dụng chi tiết.

## 🗂️ Cấu trúc thư mục

```
lib/
├── constants/          # Hằng số (API URLs, Colors)
├── models/            # Data models (Product, Cart, User, etc.)
├── services/          # API service
├── providers/         # State management (StoreProvider, CartProvider, AuthProvider)
├── screens/           # UI Screens (10 màn hình)
├── widgets/           # Reusable components
└── main.dart          # Entry point
```

## 🎨 Giao diện

- Material Design 3
- Màu chủ đạo: Indigo (Xanh dương đậm)
- Responsive design cho mobile
- Dark mode support

## 📝 Chức năng chi tiết

### Màn hình chính (Bottom Navigation):
1. **Tổng quan** - Dashboard với thống kê và biểu đồ
2. **Bán hàng** - POS với lưới sản phẩm và giỏ hàng
3. **Sản phẩm** - Danh sách và quản lý sản phẩm
4. **Đơn hàng** - Lịch sử đơn hàng

### Menu Drawer:
- Khách hàng
- Danh mục
- Nhập hàng
- Bảng điều khiển (Console)
- Cài đặt
- Đăng xuất

## 🚀 Tính năng đang phát triển

- [ ] Sửa thông tin sản phẩm
- [ ] Xóa sản phẩm
- [ ] Chi tiết đơn hàng
- [ ] Tìm kiếm sản phẩm
- [ ] Lọc và sắp xếp nâng cao
- [ ] Xuất báo cáo

## 📄 License

Dự án này là một dự án học tập và demo.

## 👨‍💻 Tác giả

Được phát triển như một dự án Flutter demo sử dụng FakeStore API.

---

**Lưu ý:** App sử dụng FakeStore API (dữ liệu mẫu), không phải dữ liệu thật. Một số tính năng có thể không hoạt động như mong đợi do giới hạn của API.
