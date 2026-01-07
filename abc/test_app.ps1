# Test script for Flutter app
Write-Host "=== FLUTTER APP TESTING SCRIPT ===" -ForegroundColor Cyan

$projectPath = "D:\D_64KTPM3\QM_flutter\abc"
Set-Location $projectPath

Write-Host "`n1. Checking Flutter installation..." -ForegroundColor Yellow
flutter --version

Write-Host "`n2. Cleaning project..." -ForegroundColor Yellow
flutter clean

Write-Host "`n3. Getting dependencies..." -ForegroundColor Yellow
flutter pub get

Write-Host "`n4. Available devices:" -ForegroundColor Yellow
flutter devices

Write-Host "`n=== SELECT TEST OPTION ===" -ForegroundColor Cyan
Write-Host "1. Test on Chrome (Web)" -ForegroundColor Green
Write-Host "2. Test on Windows (Desktop)" -ForegroundColor Green
Write-Host "3. Test on Android (Emulator)" -ForegroundColor Green
Write-Host "4. Exit" -ForegroundColor Red

$choice = Read-Host "`nEnter your choice (1-4)"

switch ($choice) {
    "1" {
        Write-Host "`nRunning on Chrome..." -ForegroundColor Yellow
        flutter run -d chrome
    }
    "2" {
        Write-Host "`nRunning on Windows..." -ForegroundColor Yellow
        flutter run -d windows
    }
    "3" {
        Write-Host "`nRunning on Android..." -ForegroundColor Yellow
        flutter run -d android
    }
    "4" {
        Write-Host "`nExiting..." -ForegroundColor Red
        exit
    }
    default {
        Write-Host "`nInvalid choice!" -ForegroundColor Red
    }
}

Write-Host "`n=== TEST CHECKLIST ===" -ForegroundColor Cyan
Write-Host "[ ] 1. Dang ky tai khoan moi (username: test1, password: 1234)" -ForegroundColor Yellow
Write-Host "[ ] 2. Kiem tra popup thanh cong" -ForegroundColor Yellow
Write-Host "[ ] 3. Dang nhap bang tai khoan vua dang ky" -ForegroundColor Yellow
Write-Host "[ ] 4. Vao Settings, kiem tra khong co loi" -ForegroundColor Yellow
Write-Host "[ ] 5. Dang xuat va dang nhap lai" -ForegroundColor Yellow
Write-Host "[ ] 6. Thu dang ky trung username -> phai bao loi" -ForegroundColor Yellow
Write-Host "[ ] 7. Thu dang nhap sai password -> phai bao loi" -ForegroundColor Yellow

