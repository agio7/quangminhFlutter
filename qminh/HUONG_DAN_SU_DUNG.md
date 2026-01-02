# 📱 HƯỚNG DẪN SỬ DỤNG - QUẢN LÝ CỬA HÀNG

## 🎯 GIỚI THIỆU ỨNG DỤNG

**Quản Lý Cửa Hàng** là một ứng dụng quản lý bán hàng di động được xây dựng bằng Flutter, sử dụng FakeStore API để quản lý sản phẩm, đơn hàng, khách hàng và thực hiện các giao dịch bán hàng.

### Mục đích sử dụng:
- Quản lý kho hàng và sản phẩm
- Thực hiện bán hàng tại quầy (POS)
- Theo dõi đơn hàng và doanh thu
- Quản lý thông tin khách hàng
- Xem báo cáo và thống kê

---

## 📋 CÁC CHỨC NĂNG CHÍNH

### 1. 📊 **TỔNG QUAN (Dashboard)**

**Vị trí:** Tab đầu tiên ở thanh điều hướng dưới cùng

**Chức năng:**
- Hiển thị các chỉ số tổng quan về cửa hàng
- Xem biểu đồ thống kê sản phẩm theo danh mục
- Xem danh sách đơn hàng mới nhất

**Các thông tin hiển thị:**
- **Tổng Doanh Thu:** Tổng số tiền từ tất cả các đơn hàng
- **Tổng Khách Hàng:** Số lượng khách hàng trong hệ thống
- **Tổng Sản Phẩm:** Tổng số sản phẩm đang có trong kho
- **Biểu đồ:** Hiển thị số lượng sản phẩm của từng danh mục (Điện tử, Quần áo, v.v.)
- **Đơn hàng mới nhất:** 5 đơn hàng gần đây nhất với thông tin chi tiết

**Cách sử dụng:**
- Kéo xuống để làm mới dữ liệu
- Xem các chỉ số để nắm bắt tình hình kinh doanh
- Nhấn vào đơn hàng để xem chi tiết (tính năng đang phát triển)

---

### 2. 🏪 **BÁN HÀNG (POS - Point of Sale)**

**Vị trí:** Tab thứ hai ở thanh điều hướng

**Chức năng:**
- Hiển thị tất cả sản phẩm dưới dạng lưới (grid) 2 cột
- Thêm sản phẩm vào giỏ hàng để bán
- Xem và quản lý giỏ hàng

**Cách sử dụng:**
1. **Xem sản phẩm:** Cuộn để xem tất cả sản phẩm có sẵn
2. **Thêm vào giỏ:** Nhấn nút dấu **+** (màu xanh lá) ở góc trên bên phải của mỗi sản phẩm
3. **Xem giỏ hàng:** Nhấn nút **"Giỏ hàng"** (màu xanh dương) ở góc dưới bên phải màn hình
4. **Số lượng:** Số trên nút giỏ hàng hiển thị tổng số sản phẩm đã thêm

**Lưu ý:**
- Mỗi lần nhấn nút + sẽ thêm 1 sản phẩm vào giỏ
- Có thể thêm cùng một sản phẩm nhiều lần
- Nút giỏ hàng chỉ hiển thị khi có ít nhất 1 sản phẩm

---

### 3. 📦 **SẢN PHẨM (Products)**

**Vị trí:** Tab thứ ba ở thanh điều hướng

**Chức năng:**
- Xem danh sách tất cả sản phẩm trong kho
- Xem thông tin chi tiết: tên, danh mục, giá
- Quản lý sản phẩm (sửa, xóa - tính năng đang phát triển)

**Cách sử dụng:**
1. **Xem danh sách:** Cuộn để xem tất cả sản phẩm
2. **Xem chi tiết:** Mỗi sản phẩm hiển thị:
   - Hình ảnh sản phẩm
   - Tên sản phẩm (in đậm)
   - Danh mục (màu xám)
   - Giá bán (màu đen, in đậm)
3. **Quản lý:** Nhấn vào biểu tượng **3 chấm dọc** (⋮) ở bên phải mỗi sản phẩm để:
   - **Sửa:** Chỉnh sửa thông tin sản phẩm (đang phát triển)
   - **Xóa:** Xóa sản phẩm khỏi kho (đang phát triển)

**Lưu ý:**
- Kéo xuống để làm mới danh sách sản phẩm
- Tính năng sửa và xóa sẽ được cập nhật trong phiên bản sau

---

### 4. 📝 **ĐƠN HÀNG (Orders)**

**Vị trí:** Tab thứ tư ở thanh điều hướng

**Chức năng:**
- Xem lịch sử tất cả các đơn hàng đã được tạo
- Xem thông tin chi tiết từng đơn hàng

**Thông tin hiển thị cho mỗi đơn hàng:**
- **Mã đơn hàng:** Số ID của đơn hàng
- **Ngày đặt hàng:** Thời gian đơn hàng được tạo
- **Số lượng sản phẩm:** Tổng số mặt hàng trong đơn
- **Tổng tiền:** Tổng giá trị đơn hàng (màu xanh lá)

**Cách sử dụng:**
- Cuộn để xem tất cả đơn hàng
- Kéo xuống để làm mới danh sách
- Nhấn vào đơn hàng để xem chi tiết (tính năng đang phát triển)

---

### 5. 🛒 **GIỎ HÀNG (Cart)**

**Vị trí:** Truy cập từ nút giỏ hàng ở AppBar hoặc từ màn hình Bán hàng

**Chức năng:**
- Xem tất cả sản phẩm đã thêm vào giỏ
- Điều chỉnh số lượng sản phẩm
- Xem tổng tiền cần thanh toán
- Thực hiện thanh toán đơn hàng

**Cách sử dụng:**
1. **Xem giỏ hàng:** Danh sách hiển thị:
   - Hình ảnh sản phẩm
   - Tên sản phẩm
   - Giá đơn vị
   - Số lượng (có thể tăng/giảm)
   - Thành tiền (giá × số lượng)

2. **Thay đổi số lượng:**
   - Nhấn **-** (màu xám) để giảm số lượng
   - Nhấn **+** (màu xám) để tăng số lượng
   - Khi số lượng = 0, sản phẩm sẽ tự động bị xóa khỏi giỏ

3. **Thanh toán:**
   - Xem **"Tổng cộng"** ở cuối màn hình
   - Nhấn nút **"THANH TOÁN NGAY"** (màu xanh dương)
   - Sau khi thanh toán thành công, giỏ hàng sẽ được xóa và bạn quay về màn hình trước

**Lưu ý:**
- Tổng tiền được tính tự động dựa trên số lượng và giá từng sản phẩm
- Sau khi thanh toán, đơn hàng sẽ được lưu vào hệ thống

---

## 🔧 CÁC CHỨC NĂNG PHỤ (Từ Menu Drawer)

### 6. 👥 **KHÁCH HÀNG (Customers)**

**Vị trí:** Menu Drawer → "Khách hàng"

**Chức năng:**
- Xem danh sách tất cả khách hàng trong hệ thống
- Xem thông tin: tên, email

**Thông tin hiển thị:**
- Avatar (chữ cái đầu của tên)
- Họ và tên đầy đủ
- Email

**Cách sử dụng:**
- Cuộn để xem tất cả khách hàng
- Kéo xuống để làm mới danh sách

---

### 7. 📂 **DANH MỤC (Categories)**

**Vị trí:** Menu Drawer → "Danh mục"

**Chức năng:**
- Xem tất cả các danh mục sản phẩm
- Lọc sản phẩm theo danh mục

**Cách sử dụng:**
1. **Xem danh mục:** Tất cả danh mục hiển thị dưới dạng lưới 2 cột
2. **Chọn danh mục:** Nhấn vào một danh mục để lọc sản phẩm
3. **Xóa bộ lọc:** Nhấn nút **X** ở AppBar để xóa bộ lọc và xem tất cả sản phẩm

**Lưu ý:**
- Sau khi chọn danh mục, bạn sẽ quay về màn hình Sản phẩm với danh sách đã được lọc
- Danh mục được chọn sẽ có màu xanh nhạt

---

### 8. ➕ **NHẬP HÀNG (Add Product)**

**Vị trí:** Menu Drawer → "Nhập hàng"

**Chức năng:**
- Thêm sản phẩm mới vào kho
- Nhập đầy đủ thông tin sản phẩm

**Các trường thông tin cần nhập:**
1. **Tên sản phẩm** (bắt buộc): Tên của sản phẩm
2. **Nhập giá bán** (bắt buộc): Giá bán của sản phẩm (chỉ nhập số)
3. **Mô tả** (bắt buộc): Mô tả chi tiết về sản phẩm (tối đa 3 dòng)
4. **URL hình ảnh** (tùy chọn): Link ảnh của sản phẩm. Nếu để trống, sẽ dùng ảnh mặc định
5. **Danh mục** (bắt buộc): Chọn danh mục từ danh sách xổ xuống

**Cách sử dụng:**
1. Điền đầy đủ các thông tin bắt buộc
2. Chọn danh mục từ menu xổ xuống
3. Nhấn nút **"Lưu sản phẩm"** (màu xanh dương) ở cuối màn hình
4. Sau khi lưu thành công, sản phẩm sẽ xuất hiện trong danh sách sản phẩm

**Lưu ý:**
- Tất cả các trường có dấu * (bắt buộc) phải được điền
- Giá phải là số hợp lệ (ví dụ: 25.50)
- Nếu có lỗi, thông báo sẽ hiển thị màu đỏ

---

### 9. 💻 **BẢNG ĐIỀU KHIỂN (Console)**

**Vị trí:** Menu Drawer → "Bảng điều khiển"

**Chức năng:**
- Xem lịch sử tất cả các API calls (yêu cầu mạng)
- Debug và kiểm tra lỗi API
- Xem request và response chi tiết

**Cách sử dụng:**
1. **Xem danh sách logs:**
   - Cột bên trái hiển thị tất cả các API calls
   - Mỗi log hiển thị: Method (GET/POST), URL, Status code, Thời gian
   - Màu sắc:
     - 🟢 Xanh lá: Thành công (200-299)
     - 🔴 Đỏ: Có lỗi
     - 🟠 Cam: Đang xử lý hoặc status khác

2. **Xem chi tiết:**
   - Nhấn vào một log ở cột trái
   - Cột phải hiển thị:
     - **Method & URL:** Phương thức và địa chỉ API
     - **Thời gian:** Thời điểm gọi API
     - **Headers:** Tiêu đề của request (nếu có)
     - **Nội dung yêu cầu:** Dữ liệu gửi đi (nếu có)
     - **Mã trạng thái:** HTTP status code
     - **Nội dung phản hồi:** Dữ liệu nhận về (format JSON)
     - **Lỗi:** Thông báo lỗi (nếu có)

3. **Các tính năng:**
   - **Sao chép:** Nhấn nút copy để sao chép URL, Request Body, hoặc Response Body
   - **Xóa logs:** Nhấn nút thùng rác để xóa tất cả logs
   - **Làm mới:** Nhấn nút refresh để cập nhật danh sách

**Lưu ý:**
- Console chỉ lưu tối đa 50 logs gần nhất
- Đây là công cụ dành cho developer để debug
- JSON được format tự động để dễ đọc

---

### 10. ⚙️ **CÀI ĐẶT (Settings)**

**Vị trí:** Menu Drawer → "Cài đặt"

**Chức năng:**
- Thay đổi giao diện (chế độ tối/sáng)
- Đăng nhập vào hệ thống

#### A. Giao diện:
- **Chế độ tối:** Bật/tắt chế độ tối cho app
- Lưu ý: Cần khởi động lại app để áp dụng thay đổi

#### B. Đăng nhập:
- **Tên đăng nhập:** Nhập username
- **Mật khẩu:** Nhập password
- **Đăng nhập:** Nhấn nút để đăng nhập

**Thông tin đăng nhập mặc định:**
- Username: `mor_2314`
- Password: `83r5^_`

**Sau khi đăng nhập:**
- Hiển thị trạng thái "Đã đăng nhập"
- Hiển thị một phần token (20 ký tự đầu)

**Lưu ý:**
- Token được lưu tự động, không cần đăng nhập lại mỗi lần mở app
- Nhấn "Đăng xuất" ở menu để đăng xuất

---

## 🎨 GIAO DIỆN VÀ ĐIỀU HƯỚNG

### Thanh điều hướng chính (Bottom Navigation Bar):
- 📊 **Tổng quan:** Xem báo cáo và thống kê
- 🏪 **Bán hàng:** Thực hiện bán hàng
- 📦 **Sản phẩm:** Quản lý kho hàng
- 📝 **Đơn hàng:** Xem lịch sử đơn hàng

### Menu Drawer (Menu bên trái):
- Mở bằng cách nhấn nút **☰** (3 gạch ngang) ở góc trên bên trái
- Chứa các chức năng phụ: Khách hàng, Danh mục, Nhập hàng, Console, Cài đặt, Đăng xuất

### AppBar (Thanh trên cùng):
- **Tiêu đề:** "Quản Lý Cửa Hàng"
- **Nút menu:** Mở Drawer
- **Nút giỏ hàng:** Vào giỏ hàng (có badge hiển thị số lượng)
- **Avatar:** Biểu tượng admin

---

## 💡 MẸO SỬ DỤNG

1. **Làm mới dữ liệu:** Kéo xuống ở bất kỳ màn hình nào để làm mới dữ liệu
2. **Thêm sản phẩm nhanh:** Ở màn hình Bán hàng, nhấn nút + trên sản phẩm để thêm vào giỏ
3. **Xem tổng quan:** Màn hình Tổng quan giúp nắm bắt tình hình kinh doanh nhanh chóng
4. **Debug API:** Sử dụng Console để kiểm tra lỗi khi có vấn đề với API
5. **Lọc sản phẩm:** Dùng chức năng Danh mục để tìm sản phẩm nhanh hơn

---

## ⚠️ LƯU Ý QUAN TRỌNG

1. **Kết nối Internet:** App cần kết nối internet để tải dữ liệu từ API
2. **Dữ liệu mẫu:** App sử dụng FakeStore API, dữ liệu là dữ liệu mẫu, không phải dữ liệu thật
3. **Tính năng đang phát triển:** Một số tính năng như Sửa/Xóa sản phẩm, Chi tiết đơn hàng đang được phát triển
4. **Lưu trữ:** Dữ liệu giỏ hàng chỉ lưu trong phiên làm việc hiện tại, sẽ mất khi đóng app

---

## 🆘 XỬ LÝ SỰ CỐ

### App không tải được dữ liệu:
- Kiểm tra kết nối internet
- Thử kéo xuống để làm mới
- Xem Console để kiểm tra lỗi API

### Giỏ hàng bị mất:
- Giỏ hàng chỉ lưu trong phiên làm việc
- Cần thêm lại sản phẩm sau khi đóng app

### Không thêm được sản phẩm:
- Kiểm tra đã điền đầy đủ thông tin bắt buộc chưa
- Kiểm tra giá có phải là số hợp lệ không
- Xem Console để kiểm tra lỗi

---

## 📞 HỖ TRỢ

Nếu gặp vấn đề hoặc có câu hỏi, vui lòng:
- Xem Console để kiểm tra lỗi chi tiết
- Kiểm tra kết nối internet
- Thử khởi động lại app

---

**Chúc bạn sử dụng app hiệu quả! 🎉**


