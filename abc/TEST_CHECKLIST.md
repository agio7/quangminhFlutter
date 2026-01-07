# ✅ CHECKLIST KIỂM TRA - Đánh dấu khi hoàn thành

## 📋 PHẦN 1: SETUP & CHẠY APP

```
[ ] 1.1. Đã mở PowerShell/Terminal
[ ] 1.2. Đã cd vào thư mục: D:\D_64KTPM3\QM_flutter\abc
[ ] 1.3. Đã chạy: flutter clean
[ ] 1.4. Đã chạy: flutter pub get
[ ] 1.5. Đã chạy: flutter run -d chrome
[ ] 1.6. Chrome đã mở và hiển thị app
[ ] 1.7. Thấy màn hình Login
[ ] 1.8. Không có lỗi compile trong terminal
```

---

## 📋 PHẦN 2: TEST ĐĂNG KÝ

### Test Case 2.1: Đăng ký thành công
```
[ ] 2.1.1. Click "Đăng ký ngay"
[ ] 2.1.2. Nhập username: test123
[ ] 2.1.3. Nhập password: 1234
[ ] 2.1.4. Nhập confirm password: 1234
[ ] 2.1.5. Click "Đăng ký"
[ ] 2.1.6. Popup hiện "✅ Đăng ký thành công"
[ ] 2.1.7. Message chứa: "Tài khoản test123 đã được tạo"
[ ] 2.1.8. Có nút "Đăng nhập ngay"
```

### Test Case 2.2: Validation
```
[ ] 2.2.1. Username < 3 ký tự → Lỗi "phải có ít nhất 3 ký tự"
[ ] 2.2.2. Password < 4 ký tự → Lỗi "phải có ít nhất 4 ký tự"
[ ] 2.2.3. Password không khớp → Lỗi "Mật khẩu không khớp"
[ ] 2.2.4. Để trống username → Lỗi "Vui lòng nhập tên đăng nhập"
[ ] 2.2.5. Để trống password → Lỗi "Vui lòng nhập mật khẩu"
```

### Test Case 2.3: Đăng ký trùng
```
[ ] 2.3.1. Đăng ký lại với username: test123
[ ] 2.3.2. Popup hiện "❌ Đăng ký thất bại"
[ ] 2.3.3. Message: "Tên đăng nhập test123 đã tồn tại"
```

---

## 📋 PHẦN 3: TEST ĐĂNG NHẬP

### Test Case 3.1: Đăng nhập thành công
```
[ ] 3.1.1. Nhập username: test123
[ ] 3.1.2. Nhập password: 1234
[ ] 3.1.3. Click "Đăng nhập"
[ ] 3.1.4. Chuyển sang màn hình Dashboard
[ ] 3.1.5. Thấy header "Quản Lý Cửa Hàng"
[ ] 3.1.6. Thấy menu icon (☰) góc trái
[ ] 3.1.7. Thấy bottom navigation (4 tab)
```

### Test Case 3.2: Đăng nhập sai
```
[ ] 3.2.1. Nhập username: test123
[ ] 3.2.2. Nhập password: wrong
[ ] 3.2.3. Click "Đăng nhập"
[ ] 3.2.4. Popup/Snackbar: "Đăng nhập thất bại"
[ ] 3.2.5. Vẫn ở màn hình login
```

### Test Case 3.3: Username không tồn tại
```
[ ] 3.3.1. Nhập username: khongtontai
[ ] 3.3.2. Nhập password: 1234
[ ] 3.3.3. Click "Đăng nhập"
[ ] 3.3.4. Báo lỗi "Đăng nhập thất bại"
```

### Test Case 3.4: Tài khoản demo
```
[ ] 3.4.1. Nhập username: mor_2314
[ ] 3.4.2. Nhập password: 83r5^_
[ ] 3.4.3. Click "Đăng nhập"
[ ] 3.4.4. Đăng nhập thành công
```

---

## 📋 PHẦN 4: TEST SETTINGS (LỖI RANGEERROR)

### Test Case 4.1: Mở Settings
```
[ ] 4.1.1. Click menu icon (☰)
[ ] 4.1.2. Click "Cài đặt"
[ ] 4.1.3. Settings screen hiển thị
[ ] 4.1.4. KHÔNG có lỗi RangeError
[ ] 4.1.5. Console (F12) KHÔNG có lỗi đỏ
```

### Test Case 4.2: Kiểm tra hiển thị
```
[ ] 4.2.1. Thấy text "Đã đăng nhập"
[ ] 4.2.2. Thấy icon check màu xanh
[ ] 4.2.3. Thấy Token (local-user-test123 hoặc rút gọn)
[ ] 4.2.4. Token hiển thị đúng (không bị crash)
[ ] 4.2.5. Có switch "Chế độ tối"
```

---

## 📋 PHẦN 5: TEST LƯU TRỮ DỮ LIỆU

### Test Case 5.1: LocalStorage (Web)
```
[ ] 5.1.1. Bấm F12 (mở DevTools)
[ ] 5.1.2. Tab "Application"
[ ] 5.1.3. Local Storage → chọn localhost
[ ] 5.1.4. Có key "registered_users"
[ ] 5.1.5. Value là JSON array
[ ] 5.1.6. Chứa user vừa đăng ký
```

### Test Case 5.2: Data persistence
```
[ ] 5.2.1. Đang đăng nhập
[ ] 5.2.2. Bấm F5 (reload page)
[ ] 5.2.3. VẪN ở trạng thái đăng nhập
[ ] 5.2.4. Không bị logout
```

---

## 📋 PHẦN 6: TEST DASHBOARD (LỖI SETSTATE)

### Test Case 6.1: Load Dashboard
```
[ ] 6.1.1. Dashboard hiển thị
[ ] 6.1.2. Thấy cards: Doanh thu, Khách hàng, Sản phẩm
[ ] 6.1.3. Console KHÔNG có lỗi "setState during build"
[ ] 6.1.4. KHÔNG có exception
[ ] 6.1.5. Loading indicator hoạt động (nếu có)
```

### Test Case 6.2: Navigation
```
[ ] 6.2.1. Tab "Tổng quan" → Hiển thị đúng
[ ] 6.2.2. Tab "Bán hàng" → Hiển thị đúng
[ ] 6.2.3. Tab "Sản phẩm" → Hiển thị đúng
[ ] 6.2.4. Tab "Đơn hàng" → Hiển thị đúng
[ ] 6.2.5. Chuyển tab không bị crash
```

---

## 📋 PHẦN 7: TEST ĐĂNG XUẤT

### Test Case 7.1: Logout
```
[ ] 7.1.1. Click menu (☰)
[ ] 7.1.2. Click "Đăng xuất"
[ ] 7.1.3. Quay về màn hình Login
[ ] 7.1.4. Form trống (không còn data cũ)
```

### Test Case 7.2: Login lại
```
[ ] 7.2.1. Đăng nhập lại (test123 / 1234)
[ ] 7.2.2. Đăng nhập thành công
[ ] 7.2.3. Vào Dashboard
```

---

## 📋 PHẦN 8: TEST CONSOLE ERRORS

### Test Case 8.1: Không có lỗi compile
```
[ ] 8.1.1. Terminal KHÔNG có lỗi "Error:"
[ ] 8.1.2. Build thành công
[ ] 8.1.3. Hot reload hoạt động (bấm 'r')
```

### Test Case 8.2: Không có lỗi runtime
```
[ ] 8.2.1. F12 → Console tab
[ ] 8.2.2. KHÔNG có lỗi đỏ
[ ] 8.2.3. KHÔNG có RangeError
[ ] 8.2.4. KHÔNG có MissingPluginException
[ ] 8.2.5. KHÔNG có setState during build
```

---

## 📋 PHẦN 9: KIỂM TRA FILES

### Test Case 9.1: Files đã sửa tồn tại
```
[ ] 9.1.1. lib/providers/auth_provider.dart
[ ] 9.1.2. lib/services/file_user_service.dart
[ ] 9.1.3. lib/screens/settings_screen.dart
[ ] 9.1.4. lib/providers/store_provider.dart
[ ] 9.1.5. lib/screens/dashboard_screen.dart
```

### Test Case 9.2: Tài liệu
```
[ ] 9.2.1. DA_SUA_XONG.md
[ ] 9.2.2. HUONG_DAN_TEST.md
[ ] 9.2.3. TONG_KET_SUA_CHUA.md
[ ] 9.2.4. HUONG_DAN_SUA_LOI.md
[ ] 9.2.5. DEMO_SCRIPT.md
[ ] 9.2.6. README_NHANH.txt
[ ] 9.2.7. run_test.bat / test_app.ps1
```

---

## 📋 PHẦN 10: TỔ HỢP TEST

### Test Case 10.1: Full workflow
```
[ ] 10.1.1. Đăng ký user mới
[ ] 10.1.2. Đăng nhập thành công
[ ] 10.1.3. Vào từng tab (4 tab)
[ ] 10.1.4. Mở Settings
[ ] 10.1.5. Đăng xuất
[ ] 10.1.6. Đăng nhập lại
[ ] 10.1.7. Reload page (F5)
[ ] 10.1.8. Vẫn đăng nhập
```

### Test Case 10.2: Edge cases
```
[ ] 10.2.1. Username có ký tự đặc biệt
[ ] 10.2.2. Password dài (>20 ký tự)
[ ] 10.2.3. Nhiều user đăng ký (3-5 user)
[ ] 10.2.4. Đăng nhập đúng từng user
```

---

## 📊 TỔNG KẾT

```
Tổng số test cases: 80+

Phần 1 (Setup):        [ ] 8/8 passed
Phần 2 (Đăng ký):      [ ] 13/13 passed
Phần 3 (Đăng nhập):    [ ] 15/15 passed
Phần 4 (Settings):     [ ] 7/7 passed
Phần 5 (Lưu trữ):      [ ] 6/6 passed
Phần 6 (Dashboard):    [ ] 9/9 passed
Phần 7 (Logout):       [ ] 4/4 passed
Phần 8 (Console):      [ ] 7/7 passed
Phần 9 (Files):        [ ] 12/12 passed
Phần 10 (Tổng hợp):    [ ] 10/10 passed

══════════════════════════════════════
TOTAL: [ ] 91/91 PASSED ✅
══════════════════════════════════════
```

---

## 🎯 KẾT QUẢ MONG ĐỢI

Nếu **TẤT CẢ 91 test cases PASS**, bạn có thể khẳng định:

✅ 1. Lỗi compile _fileUserService → ĐÃ SỬA
✅ 2. RangeError trong Settings → ĐÃ SỬA
✅ 3. MissingPluginException trên Web → ĐÃ SỬA
✅ 4. setState during build → ĐÃ SỬA
✅ 5. Không đăng ký được → ĐÃ SỬA
✅ 6. Không đăng nhập được → ĐÃ SỬA

---

## 📝 GHI CHÚ

- In checklist này ra và tích ✅ khi test
- Nếu có test case nào FAIL, ghi chú lý do
- Chụp screenshot các lỗi (nếu có)
- Kiểm tra Console log (F12)

---

## 📞 BÁO CÁO KẾT QUẢ

Nếu có vấn đề, cung cấp:
1. Test case nào FAIL (số thứ tự)
2. Error message đầy đủ
3. Screenshot
4. Browser version
5. Flutter version

---

**Date**: ___/___/_____
**Tester**: _____________
**Time**: ___:___ - ___:___
**Status**: [ ] PASS  [ ] FAIL

═══════════════════════════════════════════
     CHÚC BẠN TEST THÀNH CÔNG! 🎉
═══════════════════════════════════════════

