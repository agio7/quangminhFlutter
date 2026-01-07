@echo off
echo ========================================
echo FLUTTER APP - QUICK TEST SCRIPT
echo ========================================
echo.

cd /d D:\D_64KTPM3\QM_flutter\abc

echo [1/3] Cleaning project...
call flutter clean >nul 2>&1

echo [2/3] Getting dependencies...
call flutter pub get

echo [3/3] Running app on Chrome...
echo.
echo ========================================
echo APP IS STARTING...
echo ========================================
echo.
echo PLEASE TEST:
echo [ ] 1. Register: test123 / 1234
echo [ ] 2. Login: test123 / 1234
echo [ ] 3. Open Settings (no RangeError)
echo [ ] 4. Check LocalStorage (F12)
echo [ ] 5. Logout and login again
echo.
echo Press Ctrl+C to stop the app
echo ========================================
echo.

call flutter run -d chrome

pause

