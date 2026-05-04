@echo off
chcp 65001 > nul
cd /d "%~dp0"
echo =====================================
echo  ffmpeg.wasm 0.12.15 ファイル4つをダウンロードします
echo =====================================
echo.

echo 古いファイルを削除...
del /f /q ffmpeg.min.js 2>nul
del /f /q ffmpeg-core.worker.js 2>nul
echo.

echo [1/4] ffmpeg.js をダウンロード中...
powershell -NoProfile -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://cdn.jsdelivr.net/npm/@ffmpeg/[email protected]/dist/umd/ffmpeg.js' -OutFile 'ffmpeg.js'"
if errorlevel 1 goto :error
echo OK
echo.

echo [2/4] 814.ffmpeg.js をダウンロード中...
powershell -NoProfile -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://cdn.jsdelivr.net/npm/@ffmpeg/[email protected]/dist/umd/814.ffmpeg.js' -OutFile '814.ffmpeg.js'"
if errorlevel 1 goto :error
echo OK
echo.

echo [3/4] ffmpeg-core.js をダウンロード中...
powershell -NoProfile -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://cdn.jsdelivr.net/npm/@ffmpeg/[email protected]/dist/umd/ffmpeg-core.js' -OutFile 'ffmpeg-core.js'"
if errorlevel 1 goto :error
echo OK
echo.

echo [4/4] ffmpeg-core.wasm をダウンロード中（30MBあるので30秒〜1分かかります）...
powershell -NoProfile -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://cdn.jsdelivr.net/npm/@ffmpeg/[email protected]/dist/umd/ffmpeg-core.wasm' -OutFile 'ffmpeg-core.wasm'"
if errorlevel 1 goto :error
echo OK
echo.

echo =====================================
echo  ダウンロード完了！フォルダの中身：
echo =====================================
dir /b *.js *.wasm *.html
echo.
echo 次は 2-deploy.bat をダブルクリックしてデプロイしてください。
echo.
pause
exit /b 0

:error
echo.
echo =====================================
echo  エラー発生
echo =====================================
echo.
pause
exit /b 1
