# 🎬 DEMO SCRIPT - Test Chức Năng Đăng Ký/Đăng Nhập

## 🎯 Mục tiêu: Chứng minh tất cả lỗi đã được sửa

---

## ▶️ SCENE 1: KHỞI ĐỘNG APP (30 giây)

**Action:**
1. Mở PowerShell
2. Gõ: `cd D:\D_64KTPM3\QM_flutter\abc`
3. Gõ: `flutter run -d chrome`
4. Đợi app mở trong Chrome

**Expected Result:**
- ✅ App mở thành công
- ✅ Thấy màn hình Login
- ✅ KHÔNG có lỗi trong Console (F12)

**Voice Over:**
"App đã được sửa và khởi động thành công. Không còn lỗi compile hay MissingPluginException."

---

## ▶️ SCENE 2: TEST ĐĂNG KÝ THÀNH CÔNG (45 giây)

**Action:**
1. Click "Đăng ký ngay"
2. Nhập:
   - Username: `demo123`
   - Password: `1234`
   - Confirm: `1234`
3. Click "Đăng ký"

**Expected Result:**
- ✅ Popup hiện: "✅ Đăng ký thành công"
- ✅ Message: "Tài khoản demo123 đã được tạo!"
- ✅ Có nút "Đăng nhập ngay"

**Voice Over:**
"Đăng ký thành công! Trước đây bị lỗi 201, giờ đã fix."

---

## ▶️ SCENE 3: KIỂM TRA DỮ LIỆU LƯU (30 giây)

**Action:**
1. Bấm F12 (mở DevTools)
2. Tab "Application"
3. Local Storage → chọn localhost
4. Tìm key "registered_users"
5. Xem giá trị

**Expected Result:**
- ✅ Có key "registered_users"
- ✅ Giá trị là JSON array
- ✅ Chứa user "demo123"
```json
[{"username":"demo123","password":"1234","createdAt":"..."}]
```

**Voice Over:**
"Dữ liệu đã được lưu vào LocalStorage. Fix lỗi MissingPluginException bằng cách dùng SharedPreferences thay vì path_provider."

---

## ▶️ SCENE 4: TEST ĐĂNG NHẬP THÀNH CÔNG (30 giây)

**Action:**
1. Click "Đăng nhập ngay" (từ popup)
2. Hoặc back về Login screen
3. Nhập:
   - Username: `demo123`
   - Password: `1234`
4. Click "Đăng nhập"

**Expected Result:**
- ✅ Chuyển sang Dashboard
- ✅ Thấy header "Quản Lý Cửa Hàng"
- ✅ Thấy menu bên trái
- ✅ Thấy bottom navigation: Tổng quan, Bán hàng, Sản phẩm, Đơn hàng

**Voice Over:**
"Đăng nhập thành công! Trước đây không login được, giờ đã fix."

---

## ▶️ SCENE 5: TEST SETTINGS - NO RANGEERROR (40 giây)

**Action:**
1. Click icon menu (☰) góc trái trên
2. Click "Cài đặt"
3. Quan sát màn hình

**Expected Result:**
- ✅ Màn hình Settings hiển thị
- ✅ KHÔNG có lỗi RangeError
- ✅ Thấy: "Đã đăng nhập"
- ✅ Thấy: Token (local-user-demo123 hoặc rút gọn)
- ✅ Console (F12) KHÔNG có lỗi đỏ

**Voice Over:**
"Settings mở thành công! Trước đây bị RangeError do substring vượt quá độ dài chuỗi. Đã fix bằng cách kiểm tra length trước."

**Highlight Code (Optional):**
```dart
// BEFORE (❌ Lỗi):
Text('Token: ${token!.substring(0, 20)}...')

// AFTER (✅ Fixed):
Text('Token: ${token!.length > 20 ? token!.substring(0, 20) + '...' : token!}')
```

---

## ▶️ SCENE 6: TEST ĐĂNG KÝ TRÙNG (30 giây)

**Action:**
1. Logout (Menu → Đăng xuất)
2. Click "Đăng ký ngay"
3. Nhập lại:
   - Username: `demo123` (đã tồn tại)
   - Password: `1234`
   - Confirm: `1234`
4. Click "Đăng ký"

**Expected Result:**
- ✅ Popup hiện: "❌ Đăng ký thất bại"
- ✅ Message: "Tên đăng nhập demo123 đã tồn tại"
- ✅ Có nút "Đóng"

**Voice Over:**
"Validation hoạt động! Không cho đăng ký trùng username."

---

## ▶️ SCENE 7: TEST ĐĂNG NHẬP SAI PASSWORD (20 giây)

**Action:**
1. Back về Login
2. Nhập:
   - Username: `demo123`
   - Password: `wrong` (sai)
3. Click "Đăng nhập"

**Expected Result:**
- ✅ Popup/Snackbar: "Đăng nhập thất bại"
- ✅ Vẫn ở màn hình login
- ✅ KHÔNG crash

**Voice Over:**
"Sai password → báo lỗi đúng. Validation hoạt động tốt."

---

## ▶️ SCENE 8: TEST TÀI KHOẢN DEMO (25 giây)

**Action:**
1. Nhập:
   - Username: `mor_2314`
   - Password: `83r5^_`
2. Click "Đăng nhập"

**Expected Result:**
- ✅ Đăng nhập thành công
- ✅ Vào Dashboard
- ✅ Fallback mode hoạt động

**Voice Over:**
"Tài khoản demo vẫn hoạt động như fallback. Hệ thống hỗ trợ cả file user và API user."

---

## ▶️ SCENE 9: TEST DASHBOARD - NO SETSTATE ERROR (30 giây)

**Action:**
1. Sau khi đăng nhập, quan sát Dashboard
2. Mở Console (F12)
3. Kiểm tra có lỗi "setState during build" không

**Expected Result:**
- ✅ Dashboard load thành công
- ✅ Hiển thị stats: Doanh thu, Khách hàng, Sản phẩm
- ✅ Console KHÔNG có lỗi "setState() called during build"
- ✅ KHÔNG có exception

**Voice Over:**
"Dashboard load clean! Trước đây bị lỗi 'setState during build'. Đã fix bằng cách gọi fetchAllData() trong initState với postFrameCallback."

**Highlight Code (Optional):**
```dart
// BEFORE (❌ Lỗi):
List<Product> get products {
  if (!_loaded) fetchProducts(); // ❌ setState in getter
  return _products;
}

// AFTER (✅ Fixed):
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<StoreProvider>(context, listen: false).fetchAllData();
  });
}
```

---

## ▶️ SCENE 10: TEST RELOAD PAGE - DATA PERSIST (25 giây)

**Action:**
1. Đang ở Dashboard (đã login)
2. Bấm F5 (reload page)
3. Quan sát

**Expected Result:**
- ✅ App reload
- ✅ VẪN Ở trạng thái đã đăng nhập
- ✅ KHÔNG bị logout
- ✅ Token persist trong SharedPreferences

**Voice Over:**
"Token được lưu persistent! Reload page vẫn giữ trạng thái đăng nhập."

---

## ▶️ SCENE 11: FINAL CHECK - ALL FEATURES (30 giây)

**Action:**
1. Navigate qua các tab:
   - Tổng quan ✅
   - Bán hàng ✅
   - Sản phẩm ✅
   - Đơn hàng ✅
2. Mở Settings ✅
3. Logout ✅

**Expected Result:**
- ✅ Tất cả navigation hoạt động
- ✅ Không có crash
- ✅ Không có lỗi trong Console
- ✅ UI responsive

**Voice Over:**
"Tất cả tính năng hoạt động tốt! App đã sẵn sàng production."

---

## 📊 TỔNG KẾT (15 giây)

**Display Summary Table:**
```
╔════════════════════════════╦════════╦════════╗
║ Chức năng                  ║ Trước  ║ Sau    ║
╠════════════════════════════╬════════╬════════╣
║ Đăng ký                    ║   ❌   ║   ✅   ║
║ Đăng nhập                  ║   ❌   ║   ✅   ║
║ Settings (RangeError)      ║   ❌   ║   ✅   ║
║ Web support                ║   ❌   ║   ✅   ║
║ Dashboard (setState error) ║   ❌   ║   ✅   ║
║ Data persistence           ║   ❌   ║   ✅   ║
╚════════════════════════════╩════════╩════════╝
```

**Voice Over:**
"Đã sửa xong 6 lỗi chính. App hoạt động hoàn hảo trên Web, với hỗ trợ đăng ký/đăng nhập đơn giản và lưu trữ local."

---

## 🎬 END CREDITS

**Display:**
```
✅ Đã sửa:
   1. Lỗi compile _fileUserService
   2. RangeError trong Settings
   3. MissingPluginException
   4. setState during build
   5. Không đăng ký được
   6. Không đăng nhập được

📂 Files sửa: 5
⏱️ Thời gian: ~30 phút
🧪 Test cases: 25+

🔗 Tài liệu:
   - DA_SUA_XONG.md
   - HUONG_DAN_TEST.md
   - TONG_KET_SUA_CHUA.md

🎉 HOÀN THÀNH!
```

---

## ⏱️ TOTAL TIME: ~6 phút

## 🎥 RECORDING TIPS:

1. **Screen Resolution**: 1920x1080
2. **Browser**: Chrome (latest)
3. **Font Size**: Tăng lên 120% để dễ nhìn
4. **DevTools**: Mở riêng window để dễ record
5. **Slow Motion**: Các bước quan trọng (popup, console)
6. **Highlight**: Dùng tool highlight mouse cursor
7. **Annotations**: Thêm text overlay cho các điểm chính

---

## 📝 SCRIPT VARIATIONS:

### Version 1: Quick Demo (3 phút)
- Scene 1, 2, 4, 5, 9

### Version 2: Full Demo (6 phút)
- All scenes

### Version 3: Technical Deep Dive (10 phút)
- All scenes + code snippets + file structure

---

**END OF SCRIPT** 🎬

