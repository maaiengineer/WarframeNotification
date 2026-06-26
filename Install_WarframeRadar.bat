@echo off
setlocal enabledelayedexpansion
title Warframe Radar - All-in-One Installer
echo ==========================================
echo  Warframe Radar - All-in-One Installer
echo ==========================================
echo.

rem ---------- Step 1: Detect Python ----------
echo [1/4] Checking for Python...
set PYCMD=
py --version >nul 2>&1
if %errorlevel%==0 set PYCMD=py
if "%PYCMD%"=="" (
    python --version >nul 2>&1
    if %errorlevel%==0 set PYCMD=python
)
if "%PYCMD%"=="" (
    python3 --version >nul 2>&1
    if %errorlevel%==0 set PYCMD=python3
)
if "%PYCMD%"=="" (
    echo.
    echo Python was not found on this PC.
    echo Opening the official Python download page in your browser...
    echo IMPORTANT: during install, CHECK the box "Add python.exe to PATH"
    echo After installing Python, run this file again.
    start https://www.python.org/downloads/
    pause
    exit /b 1
)
echo   Found Python command: %PYCMD%
echo.

rem ---------- Step 2: Rebuild warframe_radar.py from embedded data ----------
echo [2/4] Creating warframe_radar.py ...
if exist py_data.b64 del py_data.b64
echo aW1wb3J0IG9zCmltcG9ydCByZQppbXBvcnQgc3lzCmltcG9ydCB0aW1lCmltcG9y > py_data.b64
echo dCB0aHJlYWRpbmcKaW1wb3J0IHRraW50ZXIgYXMgdGsKZnJvbSB0a2ludGVyIGlt >> py_data.b64
echo cG9ydCB0dGsKCiMgd2luc291bmQg4LmA4Lib4LmH4LiZ4LmC4Lih4LiU4Li54Lil >> py_data.b64
echo IFdpbmRvd3Mtb25seSDguYPguIrguYnguKrguLPguKvguKPguLHguJrguYDguKrg >> py_data.b64
echo uLXguKLguIcgYmVlcAp0cnk6CiAgICBpbXBvcnQgd2luc291bmQKICAgIEhBU19X >> py_data.b64
echo SU5TT1VORCA9IFRydWUKZXhjZXB0IEltcG9ydEVycm9yOgogICAgSEFTX1dJTlNP >> py_data.b64
echo VU5EID0gRmFsc2UKCiMgcGx5ZXIg4Liq4Liz4Lir4Lij4Lix4LiaIG5hdGl2ZSBX >> py_data.b64
echo aW5kb3dzIHRvYXN0IG5vdGlmaWNhdGlvbiAo4Liq4Lin4Lii4LiB4Lin4LmI4Liy >> py_data.b64
echo LCDguYDguJTguYnguIfguJXguKPguIfguKHguLjguKHguIjguK0gV2luZG93cyDg >> py_data.b64
echo uYDguKXguKIpCnRyeToKICAgIGZyb20gcGx5ZXIgaW1wb3J0IG5vdGlmaWNhdGlv >> py_data.b64
echo bgogICAgSEFTX1BMWUVSID0gVHJ1ZQpleGNlcHQgSW1wb3J0RXJyb3I6CiAgICBI >> py_data.b64
echo QVNfUExZRVIgPSBGYWxzZQoKIyA9PT09PT09PT09PT09PT09PSBTZXR0aW5ncyA9 >> py_data.b64
echo PT09PT09PT09PT09PT09PQojIFBhdHRlcm4g4Lir4Lil4Lix4LiB4LiI4Liy4LiB >> py_data.b64
echo IFdhcmZyYW1lIFdpa2k6IOC4l+C4uOC4geC4hOC4o+C4seC5ieC4h+C4l+C4teC5 >> py_data.b64
echo iOC4oeC4teC5geC4l+C5h+C4muC5geC4iuC4l+C4quC5iOC4p+C4meC4leC4seC4 >> py_data.b64
echo p+C5g+C4q+C4oeC5iOC5gOC4m+C4tOC4lOC4guC4tuC5ieC4mSAobG9nIGZvcm1h >> py_data.b64
echo dCDguJvguIHguJXguLQpCiMgICAxNzQzLjI2NiBTY3JpcHQgW0luZm9dOiBDaGF0 >> py_data.b64
echo UmVkdXg6OkFkZFRhYjogQWRkaW5nIHRhYiB3aXRoIGNoYW5uZWwgbmFtZTogRlBy >> py_data.b64
echo aXZhdGVNZXNzZW5nZXJQbGF5ZXIgdG8gaW5kZXggNgojIOC5gOC4geC5h+C4miBm >> py_data.b64
echo YWxsYmFjayBwYXR0ZXJuIOC4reC4t+C5iOC4meC5hOC4p+C5ieC4lOC5ieC4p+C4 >> py_data.b64
echo ouC5gOC4nOC4t+C5iOC4rSBXYXJmcmFtZSDguYDguJvguKXguLXguYjguKLguJkg >> py_data.b64
echo bG9nIGZvcm1hdCDguYPguJnguK3guJnguLLguITguJUKTkVXX1RBQl9QQVRURVJO >> py_data.b64
echo UyA9IFsKICAgIHJlLmNvbXBpbGUociJhZGR0YWI6XHMqYWRkaW5nIHRhYiB3aXRo >> py_data.b64
echo IGNoYW5uZWwgbmFtZTpccypmKFxTKykiLCByZS5JR05PUkVDQVNFKSwKICAgIHJl >> py_data.b64
echo LmNvbXBpbGUociJjaGF0cmVkdXguKmFkZHRhYi4qY2hhbm5lbCBuYW1lOlxzKmYo >> py_data.b64
echo XFMrKSIsIHJlLklHTk9SRUNBU0UpLApdCgpMT0dfUEFUSCA9IG9zLnBhdGguZXhw >> py_data.b64
echo YW5kdmFycyhyJyVMT0NBTEFQUERBVEElXFdhcmZyYW1lXEVFLmxvZycpCiMgPT09 >> py_data.b64
echo PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCgpjbGFz >> py_data.b64
echo cyBXYXJmcmFtZVJhZGFyQXBwOgogICAgZGVmIF9faW5pdF9fKHNlbGYsIHJvb3Qp >> py_data.b64
echo OgogICAgICAgIHNlbGYucm9vdCA9IHJvb3QKICAgICAgICBzZWxmLnJvb3QudGl0 >> py_data.b64
echo bGUoIldhcmZyYW1lIFRyYWRlIFJhZGFyIHYzLjEiKQogICAgICAgIHNlbGYucm9v >> py_data.b64
echo dC5nZW9tZXRyeSgiNDAweDI3MCIpCiAgICAgICAgc2VsZi5yb290LnJlc2l6YWJs >> py_data.b64
echo ZShGYWxzZSwgRmFsc2UpCgogICAgICAgIHNlbGYuaXNfcnVubmluZyA9IEZhbHNl >> py_data.b64
echo CiAgICAgICAgc2VsZi5hY3RpdmVfdG9hc3RzID0gW10gICMg4LmD4LiK4LmJ4LiB >> py_data.b64
echo 4Lix4LiaIGZhbGxiYWNrIHRvYXN0ICjguIHguKPguJPguLXguYTguKHguYjguKHg >> py_data.b64
echo uLUgcGx5ZXIpCgogICAgICAgIHNlbGYuc3R5bGUgPSB0dGsuU3R5bGUoKQogICAg >> py_data.b64
echo ICAgIHNlbGYuc3R5bGUudGhlbWVfdXNlKCdjbGFtJykKCiAgICAgICAgc2VsZi5z >> py_data.b64
echo dGF0dXNfbGFiZWwgPSB0ay5MYWJlbChyb290LCB0ZXh0PSLwn5S0IFN5c3RlbSBP >> py_data.b64
echo ZmZsaW5lIiwgZm9udD0oIkhlbHZldGljYSIsIDE0LCAiYm9sZCIpLCBmZz0icmVk >> py_data.b64
echo IikKICAgICAgICBzZWxmLnN0YXR1c19sYWJlbC5wYWNrKHBhZHk9MTUpCgogICAg >> py_data.b64
echo ICAgIHNlbGYubG9nX2ZyYW1lID0gdHRrLkxhYmVsRnJhbWUocm9vdCwgdGV4dD0i >> py_data.b64
echo IExhdGVzdCBOZXcgQ2hhdCAiKQogICAgICAgIHNlbGYubG9nX2ZyYW1lLnBhY2so >> py_data.b64
echo cGFkeD0yMCwgcGFkeT0xMCwgZmlsbD0iYm90aCIsIGV4cGFuZD1UcnVlKQoKICAg >> py_data.b64
echo ICAgICBzZWxmLmNvbnNvbGVfbXNnID0gdGsuTGFiZWwoc2VsZi5sb2dfZnJhbWUs >> py_data.b64
echo IHRleHQ9IldhaXRpbmcgZm9yIG5ldyBjaGF0Li4uIiwgZm9udD0oIkhlbHZldGlj >> py_data.b64
echo YSIsIDEwKSwgd3JhcGxlbmd0aD0zNTAsIGp1c3RpZnk9ImxlZnQiKQogICAgICAg >> py_data.b64
echo IHNlbGYuY29uc29sZV9tc2cucGFjayhwYWR5PTEwLCBwYWR4PTEwKQoKICAgICAg >> py_data.b64
echo ICB3YXJuX3RleHQgPSAiIgogICAgICAgIGlmIG5vdCBIQVNfUExZRVI6CiAgICAg >> py_data.b64
echo ICAgICAgIHdhcm5fdGV4dCArPSAi4pqgIHBseWVyIG5vdCBpbnN0YWxsZWQgKG5v >> py_data.b64
echo IG5hdGl2ZSB0b2FzdClcbiIKICAgICAgICBpZiBub3QgSEFTX1dJTlNPVU5EOgog >> py_data.b64
echo ICAgICAgICAgICB3YXJuX3RleHQgKz0gIuKaoCB3aW5zb3VuZCBub3QgYXZhaWxh >> py_data.b64
echo YmxlIChubyBiZWVwLCBub3Qgb24gV2luZG93cykiCiAgICAgICAgaWYgd2Fybl90 >> py_data.b64
echo ZXh0OgogICAgICAgICAgICB0ay5MYWJlbChyb290LCB0ZXh0PXdhcm5fdGV4dCwg >> py_data.b64
echo Zm9udD0oIkhlbHZldGljYSIsIDgpLCBmZz0ib3JhbmdlIikucGFjaygpCgogICAg >> py_data.b64
echo ICAgIHNlbGYuYnRuX3RvZ2dsZSA9IHR0ay5CdXR0b24ocm9vdCwgdGV4dD0iU3Rh >> py_data.b64
echo cnQgUmFkYXIiLCBjb21tYW5kPXNlbGYudG9nZ2xlX3N5c3RlbSkKICAgICAgICBz >> py_data.b64
echo ZWxmLmJ0bl90b2dnbGUucGFjayhwYWR5PTEwKQoKICAgIGRlZiB0b2dnbGVfc3lz >> py_data.b64
echo dGVtKHNlbGYpOgogICAgICAgIGlmIG5vdCBzZWxmLmlzX3J1bm5pbmc6CiAgICAg >> py_data.b64
echo ICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhMT0dfUEFUSCk6CiAgICAgICAg >> py_data.b64
echo ICAgICAgICBzZWxmLmNvbnNvbGVfbXNnLmNvbmZpZyh0ZXh0PSLinYwgTG9nIGZp >> py_data.b64
echo bGUgbm90IGZvdW5kISBQbGVhc2Ugb3BlbiBXYXJmcmFtZSBmaXJzdC4iLCBmZz0i >> py_data.b64
echo cmVkIikKICAgICAgICAgICAgICAgIHJldHVybgoKICAgICAgICAgICAgc2VsZi5p >> py_data.b64
echo c19ydW5uaW5nID0gVHJ1ZQogICAgICAgICAgICBzZWxmLnN0YXR1c19sYWJlbC5j >> py_data.b64
echo b25maWcodGV4dD0i8J+foiBSYWRhciBpcyBhY3RpdmUgYW5kIG1vbml0b3Jpbmcu >> py_data.b64
echo Li4iLCBmZz0iZ3JlZW4iKQogICAgICAgICAgICBzZWxmLmJ0bl90b2dnbGUuY29u >> py_data.b64
echo ZmlnKHRleHQ9IlN0b3AgUmFkYXIiKQoKICAgICAgICAgICAgc2VsZi5tb25pdG9y >> py_data.b64
echo X3RocmVhZCA9IHRocmVhZGluZy5UaHJlYWQodGFyZ2V0PXNlbGYucmFkYXJfbG9v >> py_data.b64
echo cCwgZGFlbW9uPVRydWUpCiAgICAgICAgICAgIHNlbGYubW9uaXRvcl90aHJlYWQu >> py_data.b64
echo c3RhcnQoKQogICAgICAgIGVsc2U6CiAgICAgICAgICAgIHNlbGYuaXNfcnVubmlu >> py_data.b64
echo ZyA9IEZhbHNlCiAgICAgICAgICAgIHNlbGYuc3RhdHVzX2xhYmVsLmNvbmZpZyh0 >> py_data.b64
echo ZXh0PSLwn5S0IFN5c3RlbSBPZmZsaW5lIiwgZmc9InJlZCIpCiAgICAgICAgICAg >> py_data.b64
echo IHNlbGYuYnRuX3RvZ2dsZS5jb25maWcodGV4dD0iU3RhcnQgUmFkYXIiKQoKICAg >> py_data.b64
echo IGRlZiBzaG93X2FsZXJ0KHNlbGYsIG1zZyk6CiAgICAgICAgIiIi4LmB4LiI4LmJ >> py_data.b64
echo 4LiH4LmA4LiV4Li34Lit4LiZ4Lir4Lil4Lix4LiBOiDguYPguIrguYkgbmF0aXZl >> py_data.b64
echo IFdpbmRvd3MgdG9hc3Qg4Lic4LmI4Liy4LiZIHBseWVyIOC4luC5ieC4suC4oeC4 >> py_data.b64
echo tSDguYTguKHguYjguIfguLHguYnguJkgZmFsbGJhY2sg4LmA4Lib4LmH4LiZIFRr >> py_data.b64
echo aW50ZXIgdG9hc3Qg4LmA4Lit4LiHIiIiCiAgICAgICAgaWYgSEFTX1BMWUVSOgog >> py_data.b64
echo ICAgICAgICAgICB0cnk6CiAgICAgICAgICAgICAgICBub3RpZmljYXRpb24ubm90 >> py_data.b64
echo aWZ5KAogICAgICAgICAgICAgICAgICAgIHRpdGxlPSLwn5qoIE5ldyBDaGF0ISIs >> py_data.b64
echo CiAgICAgICAgICAgICAgICAgICAgbWVzc2FnZT1tc2csCiAgICAgICAgICAgICAg >> py_data.b64
echo ICAgICAgYXBwX25hbWU9IldhcmZyYW1lIFJhZGFyIiwKICAgICAgICAgICAgICAg >> py_data.b64
echo ICAgICB0aW1lb3V0PTQsCiAgICAgICAgICAgICAgICApCiAgICAgICAgICAgICAg >> py_data.b64
echo ICByZXR1cm4KICAgICAgICAgICAgZXhjZXB0IEV4Y2VwdGlvbiBhcyBlOgogICAg >> py_data.b64
echo ICAgICAgICAgICAgcHJpbnQoZiJwbHllciBub3RpZnkgZXJyb3I6IHtlfSIpCgog >> py_data.b64
echo ICAgICAgICMgRmFsbGJhY2s6IOC4quC4o+C5ieC4suC4hyB0b2FzdCDguYDguK3g >> py_data.b64
echo uIfguJTguYnguKfguKIgVGtpbnRlcgogICAgICAgIHRvYXN0ID0gdGsuVG9wbGV2 >> py_data.b64
echo ZWwoc2VsZi5yb290KQogICAgICAgIHRvYXN0Lm92ZXJyaWRlcmVkaXJlY3QoVHJ1 >> py_data.b64
echo ZSkKICAgICAgICB0b2FzdC5hdHRyaWJ1dGVzKCItdG9wbW9zdCIsIFRydWUpCgog >> py_data.b64
echo ICAgICAgIHNjcmVlbl93aWR0aCA9IHNlbGYucm9vdC53aW5mb19zY3JlZW53aWR0 >> py_data.b64
echo aCgpCiAgICAgICAgc2NyZWVuX2hlaWdodCA9IHNlbGYucm9vdC53aW5mb19zY3Jl >> py_data.b64
echo ZW5oZWlnaHQoKQogICAgICAgIHhfcG9zID0gc2NyZWVuX3dpZHRoIC0gMzIwCiAg >> py_data.b64
echo ICAgICAgeV9wb3MgPSBzY3JlZW5faGVpZ2h0IC0gMTUwIC0gKGxlbihzZWxmLmFj >> py_data.b64
echo dGl2ZV90b2FzdHMpICogOTApCiAgICAgICAgdG9hc3QuZ2VvbWV0cnkoZiIzMDB4 >> py_data.b64
echo ODAre3hfcG9zfSt7eV9wb3N9IikKICAgICAgICB0b2FzdC5jb25maWd1cmUoYmc9 >> py_data.b64
echo IiMyYjJiMmIiKQoKICAgICAgICB0ay5MYWJlbCh0b2FzdCwgdGV4dD0i8J+aqCBO >> py_data.b64
echo ZXcgQ2hhdCEiLCBmb250PSgiSGVsdmV0aWNhIiwgMTEsICJib2xkIiksIGJnPSIj >> py_data.b64
echo MmIyYjJiIiwgZmc9IiNmZmNjMDAiKS5wYWNrKHBhZHk9KDEwLCAwKSkKICAgICAg >> py_data.b64
echo ICB0ay5MYWJlbCh0b2FzdCwgdGV4dD1tc2csIGZvbnQ9KCJIZWx2ZXRpY2EiLCAx >> py_data.b64
echo MCksIGJnPSIjMmIyYjJiIiwgZmc9IndoaXRlIiwgd3JhcGxlbmd0aD0yODApLnBh >> py_data.b64
echo Y2socGFkeT0oNSwgMTApKQoKICAgICAgICBzZWxmLmFjdGl2ZV90b2FzdHMuYXBw >> py_data.b64
echo ZW5kKHRvYXN0KQoKICAgICAgICBkZWYgcmVtb3ZlX2FuZF9kZXN0cm95KCk6CiAg >> py_data.b64
echo ICAgICAgICAgIGlmIHRvYXN0IGluIHNlbGYuYWN0aXZlX3RvYXN0czoKICAgICAg >> py_data.b64
echo ICAgICAgICAgIHNlbGYuYWN0aXZlX3RvYXN0cy5yZW1vdmUodG9hc3QpCiAgICAg >> py_data.b64
echo ICAgICAgIHRvYXN0LmRlc3Ryb3koKQoKICAgICAgICB0b2FzdC5hZnRlcig0MDAw >> py_data.b64
echo LCByZW1vdmVfYW5kX2Rlc3Ryb3kpCgogICAgZGVmIHRyaWdnZXJfYmVlcF9hc3lu >> py_data.b64
echo YyhzZWxmKToKICAgICAgICBpZiBub3QgSEFTX1dJTlNPVU5EOgogICAgICAgICAg >> py_data.b64
echo ICByZXR1cm4KICAgICAgICB0cnk6CiAgICAgICAgICAgIHdpbnNvdW5kLkJlZXAo >> py_data.b64
echo MTAwMCwgMjUwKQogICAgICAgIGV4Y2VwdCBFeGNlcHRpb24gYXMgZToKICAgICAg >> py_data.b64
echo ICAgICAgcHJpbnQoZiJCZWVwIGVycm9yOiB7ZX0iKQoKICAgIGRlZiByYWRhcl9s >> py_data.b64
echo b29wKHNlbGYpOgogICAgICAgIHRyeToKICAgICAgICAgICAgbGFzdF9zaXplID0g >> py_data.b64
echo b3MucGF0aC5nZXRzaXplKExPR19QQVRIKSBpZiBvcy5wYXRoLmV4aXN0cyhMT0df >> py_data.b64
echo UEFUSCkgZWxzZSAwCiAgICAgICAgZXhjZXB0IEV4Y2VwdGlvbiBhcyBlOgogICAg >> py_data.b64
echo ICAgICAgICBwcmludChmIkluaXQgZXJyb3I6IHtlfSIpCiAgICAgICAgICAgIGxh >> py_data.b64
echo c3Rfc2l6ZSA9IDAKCiAgICAgICAgd2hpbGUgc2VsZi5pc19ydW5uaW5nOgogICAg >> py_data.b64
echo ICAgICAgICB0cnk6CiAgICAgICAgICAgICAgICBjdXJyZW50X3NpemUgPSBvcy5w >> py_data.b64
echo YXRoLmdldHNpemUoTE9HX1BBVEgpCgogICAgICAgICAgICAgICAgIyDguJTguLHg >> py_data.b64
echo uIHguIHguKPguJPguLXguYTguJ/guKXguYwgbG9nIOC4luC4ueC4gSByZXNldCAo >> py_data.b64
echo 4LmA4LiB4Lih4Lij4Li14Liq4LiV4Liy4Lij4LmM4LiXKSAtPiDguYTguJ/guKXg >> py_data.b64
echo uYzguYDguKXguYfguIHguKXguIfguIHguKfguYjguLLguJfguLXguYjguIjguLPg >> py_data.b64
echo uYTguKfguYkKICAgICAgICAgICAgICAgIGlmIGN1cnJlbnRfc2l6ZSA8IGxhc3Rf >> py_data.b64
echo c2l6ZToKICAgICAgICAgICAgICAgICAgICBsYXN0X3NpemUgPSAwCgogICAgICAg >> py_data.b64
echo ICAgICAgICAgaWYgY3VycmVudF9zaXplID4gbGFzdF9zaXplOgogICAgICAgICAg >> py_data.b64
echo ICAgICAgICAgIHdpdGggb3BlbihMT0dfUEFUSCwgJ3InLCBlbmNvZGluZz0ndXRm >> py_data.b64
echo LTgnLCBlcnJvcnM9J2lnbm9yZScpIGFzIGZpbGU6CiAgICAgICAgICAgICAgICAg >> py_data.b64
echo ICAgICAgIGZpbGUuc2VlayhsYXN0X3NpemUpCiAgICAgICAgICAgICAgICAgICAg >> py_data.b64
echo ICAgIGxpbmVzID0gZmlsZS5yZWFkbGluZXMoKQogICAgICAgICAgICAgICAgICAg >> py_data.b64
echo ICAgICBsYXN0X3NpemUgPSBmaWxlLnRlbGwoKQoKICAgICAgICAgICAgICAgICAg >> py_data.b64
echo ICAgICAgZm9yIGxpbmUgaW4gbGluZXM6CiAgICAgICAgICAgICAgICAgICAgICAg >> py_data.b64
echo ICAgICBwbGF5ZXJfbmFtZSA9IE5vbmUKICAgICAgICAgICAgICAgICAgICAgICAg >> py_data.b64
echo ICAgIGZvciBwYXR0ZXJuIGluIE5FV19UQUJfUEFUVEVSTlM6CiAgICAgICAgICAg >> py_data.b64
echo ICAgICAgICAgICAgICAgICAgICAgbWF0Y2ggPSBwYXR0ZXJuLnNlYXJjaChsaW5l >> py_data.b64
echo KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIG1hdGNoOgogICAg >> py_data.b64
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbGF5ZXJfbmFtZSA9IG1h >> py_data.b64
echo dGNoLmdyb3VwKDEpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg >> py_data.b64
echo IGJyZWFrCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgcGxheWVyX25h >> py_data.b64
echo bWU6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxlcnRfdGV4dCA9 >> py_data.b64
echo IGYiTmV3IGNoYXQgZnJvbToge3BsYXllcl9uYW1lfSIKICAgICAgICAgICAgICAg >> py_data.b64
echo ICAgICAgICAgICAgICAgICBzZWxmLnJvb3QuYWZ0ZXIoMCwgc2VsZi51cGRhdGVf >> py_data.b64
echo dWlfdGV4dCwgYWxlcnRfdGV4dCkKICAgICAgICAgICAgICAgICAgICAgICAgICAg >> py_data.b64
echo ICAgICBzZWxmLnJvb3QuYWZ0ZXIoMCwgc2VsZi5zaG93X2FsZXJ0LCBhbGVydF90 >> py_data.b64
echo ZXh0KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRocmVhZGluZy5U >> py_data.b64
echo aHJlYWQodGFyZ2V0PXNlbGYudHJpZ2dlcl9iZWVwX2FzeW5jLCBkYWVtb249VHJ1 >> py_data.b64
echo ZSkuc3RhcnQoKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaW50 >> py_data.b64
echo KGYiTmV3IGNoYXQgdGFiIG9wZW5lZCB3aXRoOiB7cGxheWVyX25hbWV9IikgICMg >> py_data.b64
echo RGVidWcKICAgICAgICAgICAgZXhjZXB0IEV4Y2VwdGlvbiBhcyBlOgogICAgICAg >> py_data.b64
echo ICAgICAgICAgcHJpbnQoZiJSYWRhciBsb29wIGVycm9yOiB7ZX0iKQoKICAgICAg >> py_data.b64
echo ICAgICAgdGltZS5zbGVlcCgwLjA1KQoKICAgIGRlZiB1cGRhdGVfdWlfdGV4dChz >> py_data.b64
echo ZWxmLCB0ZXh0KToKICAgICAgICBzZWxmLmNvbnNvbGVfbXNnLmNvbmZpZyh0ZXh0 >> py_data.b64
echo PXRleHQsIGZnPSJibGFjayIpCgoKaWYgX19uYW1lX18gPT0gIl9fbWFpbl9fIjoK >> py_data.b64
echo ICAgIHJvb3QgPSB0ay5UaygpCiAgICBhcHAgPSBXYXJmcmFtZVJhZGFyQXBwKHJv >> py_data.b64
echo b3QpCiAgICByb290Lm1haW5sb29wKCkK >> py_data.b64
certutil -decode py_data.b64 warframe_radar.py >nul
del py_data.b64
echo   Done.
echo.

rem ---------- Step 3: Rebuild app_icon.ico from embedded data ----------
echo [3/4] Creating app_icon.ico ...
if exist icon_data.b64 del icon_data.b64
echo AAABAAMAEBAAAAAAIACJAwAANgAAACAgAAAAACAA/QoAAL8DAAAwMAAAAAAgAD0V > icon_data.b64
echo AAC8DgAAiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAADUElEQVR4 >> icon_data.b64
echo nEXTS2icZRQG4Pec7/uvk/lzMTcTMonWVFpQbDWIXUmteCnaok5tG0QRXXpZFqti >> icon_data.b64
echo N6UoIrhwoyIGbWlishPUWneCYsVS6CKgMWSSmJl0YiaXmf/2fcdFL579y3kX70O4 >> icon_data.b64
echo eeWywtSUgSwEXH3rGefn9Ue5ltwJAdlubz57MLpoS0emQYc3UYbCFMytLCbLCgBU >> icon_data.b64
echo 46Wngo/2X46e39PqHNtpOu/ZkXTee1er8/6dJirfF4fvP3yVa+NHbj0EQJCyAk0Z >> icon_data.b64
echo feW514JPFj52fqjlvJYIPCbpcJuiyHI9LVBqYNtdyR7pdeNXSyfTh6ZP43xZEQCo >> icon_data.b64
echo +gtPhm/PfutOL28TiW/6/BYAISErCkaMuAIitZqElEszO3R7Yevd0aN2+Ox5hkwU >> icon_data.b64
echo 3M8rHzjf13IiCU2psMkbmatW4jYxliS32ltt6X6d1KJR5y9mCfSFWupPVM5APuxi >> icon_data.b64
echo rnx3yPl9/W5eS2D6/G1ejUMYITMUbpDH1rraRqPuwjcnVkZOPVHtyXuDRbWVOc6l >> icon_data.b64
echo Rklf/eWY1r81HldzTQWXDQBQ07hmKGzoSqsdmckIBFu03X8s+f/OzrEVBS0ek5pv >> icon_data.b64
echo Ql3eeEyrenoHYpOaLjeGkJhubxNWRDKbpAf7IZ6ixsxy8PqXfSuUWY9YirbTbSAx >> icon_data.b64
echo PtfzYQ0jDCJLzFYUBEIAkYDIiKeUBCwgEiL0iEOWhHIBCAILEWLb7c7DZZ/rcQQr >> icon_data.b64
echo jqol7SJQxAi9mWX2zlZAhJCIjK4mEYy4qp4USVMgtzkVne0pXjDDwVH156YFkYjP >> icon_data.b64
echo mVpL/HwobIixREzWECXcyDzRlIvLBrERMxJKvjv6ke2OfTP5A+1ztsMVVY3bTJ+/ >> icon_data.b64
echo BQGp5VZEFoBA9D+tNkqNNgPBpq62ilJwbLa3fTnfu/trBr2xkbxYOpEf6HUkl6Ze >> icon_data.b64
echo bEamy41Nr7cFCGCFTLe3bXr8pl5sRhJLM9vf62bjA++ATtUYk2VlBr+ajl8pnUyf >> icon_data.b64
echo HihYh42e3w74WhLgegNwPfH1/FYozCY72F9ovTx4Jts19QUmb0z5pkReOn7cn1h6 >> icon_data.b64
echo z/l1fZj/3taU2FQIAs2eHQnzfKxjKR0fPJ2NnvsMz14XSf9zvkFUPu3SsxePqUsb >> icon_data.b64
echo B/haPAIBSZe3kI8Vf8p37TsHerMKgAFYAPgPHeCuY5AdJJUAAAAASUVORK5CYIKJ >> icon_data.b64
echo UE5HDQoaCgAAAA1JSERSAAAAIAAAACAIBgAAAHN6evQAAArESURBVHicjVdbjJ1X >> icon_data.b64
echo df7WvvyX859z5tzmzMVjT9yxHWM5tnMjaYrgrUJKVKhSm9KoDwVEVaRGOIVASmGA >> icon_data.b64
echo QKkICZEQlD6AUBUklEgRDRQaqTwAVcB2fKmdjDO2Yztz8czYZ+bcz3/de/XhjBOo >> icon_data.b64
echo Y5T98D/9a33f2nt/e32L8IcWg4CDAvScAQBIArKnZ4DV24BoBohHhz/qJuBeAuqn >> icon_data.b64
echo 4X/mNURmM/6gBJ61IOKbQdDNwQ/KN4H5yS3Awl+J1xsP6pebB9QboSvWY1A7AyyD >> icon_data.b64
echo ixpcdZBNeVl6Z/lVs2f0P4DaM6AvnL8h1zsicD2AZ4vAxuecXyx9wvvJWl6eaALd >> icon_data.b64
echo dANa9iyB4cmMNWWym/kWYEpMAF9WeV+JovePZfEHt30fKH4R9M8rNyNxIwGeVaAv >> icon_data.b64
echo ZeDH/kQ2lr+f/+r5XfJnq31bca9yTkrRTorUSX0xMI7NqT7nVShXwxoHKuW8Dk1Z >> icon_data.b64
echo d5FyItfCqn1PbaT32M61bOfUx0FPvAB+nwL9Mrs5gTfBD/+l+6vLPww++Yqwii5z >> icon_data.b64
echo QXvqUq8iOqkDIrAAyDBsQQ/Yl5FciyqsCWQBWIYNVJZtDzZg0JPXounBN/bK6IGZ >> icon_data.b64
echo R0BPf/NNjBsIvLntj3zI+68LPwo+fmqQ7C2tqqX+mFoKA3YFwABlFqwF2BWpHfVa >> icon_data.b64
echo 1pexWujXKbWKYitYEiAIFFuYuhultxZXnGMb5fCJvaXBQ7duknhrJ2izcgH6kgV/ >> icon_data.b64
echo 9h7n1/MvFR46HiUHSledU60pMcgUu5IpMmRHdJxtzzfZlymlVlpHJOzKWLbTInsi >> icon_data.b64
echo o8gouTAoqfXYt65gSplYEsd3V5eclzcKg389UAo/8K4HQV9//nrBNJTaLAGjObHy >> icon_data.b64
echo 21Ol+4/cko77bzivtKYpNhKCGIYp3VNc40CncqFflBtJniIjbEGH7MtQrUUV6wlr >> icon_data.b64
echo y7qfTga9LIXjnW1XFVkwEYNB8bsrl/Vr3bHO8++Os7237QX+6QowSwJ4dlg9zn4+ >> icon_data.b64
echo /8TrM1bSolrqj4vBJjiD4z+uLYqB0e6RxpRajYqwLH7n8tDmh3g1LYycadRmvMHV >> icon_data.b64
echo 4p9V/jdVisEgYoaea28xk/5K/ivnSsDCUyAwMEcCdMiAvz7u/Gr5YfnT1T6PaE8t >> icon_data.b64
echo hTl2BcMw4nuqy+pir6zOdyvsyesPCqeTXi/bWWikuwrrZqvfSSF4spqtzuzACX1x >> icon_data.b64
echo 4IzNN9K9f6r/hxnMkqzcSDUZHhEvt5re88uHwLP7QM8ZMcy38NfeT656XHavqYu9 >> icon_data.b64
echo GrsCFBlK9xQbcjXMq6VBngNlKTKUbcu14nuqi7bm95AYSaFR6YgbufeNXKztd86O >> icon_data.b64
echo l7O7v/fN5sxD93buil/tjU7d557OYgh4wqpLvUq2xW+5P14FsPK3ACDATOLyxiFx >> icon_data.b64
echo tGltXijRSRUYMCM64ZxK9IVemQNlKTQi2Tty1VbcyD2yPuWc3BhXlwdlvTgoqhOt >> icon_data.b64
echo ev3Vq7n1WJf+5ZEe3747Ng9/omu35ZOdasJdxaiTwDBRaIjAOZrrxupo4wPgfw8E >> icon_data.b64
echo 8I1b9LHmfmpnLdlOCyACZRbmlqApFwcjm5IS2XTQZkda99j6OAABTzA7ZKxDBr7g >> icon_data.b64
echo yEovd6njvPCiI8GQcyccsdpSLTXfGYu3BF2yTCwJYj0pwvCGc7KzBTh/hwKa+9Qb >> icon_data.b64
echo kbaO6MtWPMYCgBDMgUrFfDfHigCCzbbmOu7R9SnrSwZh2KgYgAVJwdRoy/L4jF16 >> icon_data.b64
echo 5uf++V/GlWDt5Zi9IFt8bd7ul/vQNL7KKLZK9FLXTAaxvBQy0LtTAP1dohEDBBYD >> icon_data.b64
echo 45BhWFdYxFaJyAhKLEzFjUQ78URoCMxEBkSxBSwTCESRhQTT3Hm1z0TWX7xIl7KS >> icon_data.b64
echo szJ/Tt0RdclXYaZsTmWUWYjQCgZLuhYTEO5WQDJKrQxwVWID1SNHkK06IbsisgXd >> icon_data.b64
echo AwAz4TcpMdKUdI/18EWEldR95g7f1txc8cGjA+obC0W40Jd1XtH5tOoNfKdthIee >> icon_data.b64
echo VSKhmtu0sSmyACOnEmpnQBKPqqGoGKzJcKBCxIbYVxG7MuacjACAcyIGQXFORqwF >> icon_data.b64
echo Dx8vkB11czzqEgo6ZosMikhrDm1OhlQQA8pLhwGwJ2MQJPsyZAlmLTJiBkBQgG5x >> icon_data.b64
echo UUP0Ojm5Go5SbIG+MXCpoVaiGgNgRT6POJFajqrsDZVLkcXInx8b2KKK9Zl2mQMF >> icon_data.b64
echo MA97gK86MhwU1ZWoBAJszSW6GgfyauRBEWzeiXksABzVEkBwjmsOwGAbqIQVMaWW >> icon_data.b64
echo 2FOp8SWzJ1hsJJ6pOAPrSWZJliUx5wSjn1lqpxkHilnAshKWlYCd8Dp0Lc5ZX7B1 >> icon_data.b64
echo CDavIooyyY5g60tLRBmPugx48wIoncmmXCMSk7N5FYNBIjaCIqNsSYcwTCIyUq6F >> icon_data.b64
echo Qbq70BB9IzZVACgCFBGYAUEQ/Uxk24MW9TJHtlMHDLI5lYIA2TcazGQDlSDMHDPt >> icon_data.b64
echo E1A4IYBHL6R3lc9yIMtccrpkGSwJcmFQMltzbTIM9iTrC/0K+zJNbis1KGFCZIky >> icon_data.b64
echo FkhZUGyJIiPSnYVmNuF39Vx7lD3JlFiY6VxTLA1GQEMPwRW3C0Ip3VdoAPuPCRAZ >> icon_data.b64
echo c2vleb69LDnh2AbKQBJkI/bIMqVb/S4NDLFL7B5vToKZo/tqC+nu4rqpu31bcwfp >> icon_data.b64
echo zsJGdG9t0eZV4h5pTEESKLFkam7IgUr1cpRnRcyOgNXUw0yQS99b/RnoUHuzF0z8 >> icon_data.b64
echo IHpg1Mi1sGq2BxsUWbArWJ9p182OwoapOhFFltgRrOc7o86p5iRZFnbU75lxrw9J >> icon_data.b64
echo 0HPtunO6NQZFoNSS9USa7i+t6dOtOmtiii2ZbUFbLoWF+IMTACa/u9kLDkrQ5y/F >> icon_data.b64
echo 79/yA/u+WtFm6Jm6E1PGBEA4R9Yn0/2ltWzS71JoiCWBYqv0hW5Zv9Iad86063q+ >> icon_data.b64
echo UxGhcVkLUGjJlN1BfG9tWZ9sjovYajBg88pkBd3ArnwtOjTx35CP/wY8KwSwhzE7 >> icon_data.b64
echo K4Ctj/Uf3XFNrUeT6a0jV1gSgwBKrHZfakyZLX43uaO8Yos6vK7h660ZIJBlsC/i >> icon_data.b64
echo ZN/IWrarsOEeaWyRndRjTUwZU3KgvKzPd+v9f9yZsN7697AgYI7o9/3gZ+73/vPs >> icon_data.b64
echo T4OPnWwld1e67tH1KTAThlUjG/P6ZjpoQZKlXuawFgl7IpGdtGDzOgZAcqlfVMtR >> icon_data.b64
echo kfUwNaWM+N7KFX2qraPH94z2/2b334Ge/u5bluwGU/rw4dwPzz/lf/rVZnJXpa3n >> icon_data.b64
echo WhNyI3HZE4BhkAFsThjOqdjWvLbNbZrSyGjRNxoEsBoStnmVJQfKV/Txppf8w456 >> icon_data.b64
echo 7/C7ngR9+1O/64xvYss/edj/8YWn/E+/kpqp3CJlXFSXehUKjWA1DBGGYfJ6wDkZ >> icon_data.b64
echo qbWoYjUND8MwWAs200ErK6qmPtcbi7+wO+h/ZNeToG99ajiuPWc3e+nbDSablpkf >> icon_data.b64
echo /Qs198a/5b98riJOtNazCb9DBE804qLopp6IjNwkEKq1qMq+NDZQsa26XatpIJfD >> icon_data.b64
echo ADvy9f5jO5LkPX90GPTkd/DsQYmDb4G/PYHfO47PTQMbX/N+tPBh74VV4Fw3BvM6 >> icon_data.b64
echo XBkzIOGrlB2RUTvxicggMg6Yy9ge5JL7xzH4yLafA9XPgr52Gs8elDj0Tkaz/08C >> icon_data.b64
echo APjLtwMrH1W/ufaAc7I1LS+HoEYM6qQgBrigYKsuzDYf6W3F1fS99Reh6t8DPf7r >> icon_data.b64
echo G3K9YwLAcGABMLTtAPjFAHjpTqB9JxDvRJIMx3NHNwH3daB0HNh1HPRQEwAwC4Ev >> icon_data.b64
echo zr4V/zbr/wDP4Pc7UwXDKwAAAABJRU5ErkJggolQTkcNChoKAAAADUlIRFIAAAAw >> icon_data.b64
echo AAAAMAgGAAAAVwL5hwAAFQRJREFUeJytenmQndV15+/ce7/trd3v9abW0t3aJWzE >> icon_data.b64
echo phjhhMUJGNmEFJPIS9lJZQiWYyw842Q8mUlNWTCTTGqcylTFIIOxHWfGLg9GVZky >> icon_data.b64
echo A3bAFhEkBqIBsQi0oV1q9aZ+r/ut33LvPfPH93qRMEZM5avqf/p9797zO/f8zjn3 >> icon_data.b64
echo dx7h//fhbRIAQLvNRf+f+UI3ipkuIFwNOAQYABKAPgPoCuiRycta5zIfev+G7xTp >> icon_data.b64
echo Nx+wAIDK9iK6g5sA/nXAXgnEaxCboqjEOdKc7kAE2+20OZB1wDsOiDcBPA+Ee0CP >> icon_data.b64
echo jl0E5n0CuXwADAK2ifkN+AubAedzgL5DjjeXuC9U4OydgnpzFmI8BF2IgWQOAMA9 >> icon_data.b64
echo LmyPB7OhgOTGHsS/1gM9kp0F3D0AHgF9/acLDnqAQeB/OQC8U8x7nO+5Fgjup0br >> icon_data.b64
echo Du+nkwi+dRLqpWlwZEM7EDT0imyLuxxtC8qwpzQEDMXWFbOJpHoi5dlmRo62c2SR >> icon_data.b64
echo MZuKCH9/GOHvLIXtzrwEmD8DPfxUus/lncZ7A5hbaOeQj/vvfABx8uXgsTNO9qtv >> icon_data.b64
echo gs6HWq/PV+PryhUuKC2mokBUYl9U40BW4sAUVd32BxXnrdlh2+u1bNGNbMkNTZ/f >> icon_data.b64
echo Is3kvFYtqterZcpIr/VHa9HasQZc8B7D5MSX0b97/HJA/HIAvFOBHtCo/94VyBW/ >> icon_data.b64
echo 6xyobM7fvQ9q/4yJtpSnkqtLVTEbO87r1T45ERYo6py6SBdOup2G7fMr3qH6CpZI >> icon_data.b64
echo +QwGHAFTclvJB7omzbKgpQ7VCt7zk/3c5zn1b21GdNvgGcD8Aejhn83b8L4B8HYH >> icon_data.b64
echo 9GgCvvs2wN+d+eaxQu6L+6FXFartjw+eVyfqeXd/ZYmsaYcdAVYECPBc5JJh0iWn >> icon_data.b64
echo xr1BxTlUG2aXLBgEIoCZSDMotrCBtMkVXePxpq6q9+JUj/fiVH/rj9ej8d+uBEu+ >> icon_data.b64
echo D/TNh+ZtuWwAfJMCPafB228D5BOFz7/sBY8et63fXD6qV2ZrwY/HRtRkmLG+BCQx >> icon_data.b64
echo mFPKzRGPQRRbmC6nYfr8ine4vsL6gucy0vz7ghiWSYQWNiuT9u2DJ2GsyP6Pk8PJ >> icon_data.b64
echo jT1yZs9NxJJ2gB7Z9W4n8U4Ac3HHf3Ar4D1RuGef73/nlG1+buVxmtEq+Nn4CCSB >> icon_data.b64
echo XcGwnH5fECOxRAkDAmBPMHsiMUuCqu3xq86bs8MUG4dCI2EYUALs0AJkQQzDJNoG >> icon_data.b64
echo 0XWlsfia7kru4WNr9FUFNfP8LYLFu4O4GMBctuHfXQvk9hf+8OVs8M2TXPu3aw+7 >> icon_data.b64
echo r1ZL3qsz/TYrL944sUSJhSm7kV6dn7b9QZMzKkFkFAcy5ILTEGPtXs6ohEKj5FQU >> icon_data.b64
echo yOP1khoPs7/IEaKpSQ9lZ1tbl5zNPXxsrbmy4Mz84y3E0L8J+vaTlxJ7AQCDgMcF >> icon_data.b64
echo 9u5ycPPGF4PvHL+qcM/LaHxu9dvqaL3o7Z/ps3m1sBmBqW3IlL0wvrY0Znu9ljpW >> icon_data.b64
echo 75LnWkVZTTKibYQuqpbtC6bdw7XlNietzTmhHQzqydpCBaFW7v7KgHMuzFu/w3oG >> icon_data.b64
echo IFMQydKgEW5dejr/3w+vb//hiKjvum4a7dY1CL57Drif5tL6IgBzofOFrzkn6l/p >> icon_data.b64
echo XvM02h8fPMee1MEzY8Oc6xhPACxAsUX0K6VRvSY/4+2bHlAnmmVoBhSBJYGYYUrO >> icon_data.b64
echo rO0LKs7B2jA7BNJM0ClN7NJgNr6hfB4z2gv2TgwDEFbSPAhqGIo3FSf1uuJs7ltH >> icon_data.b64
echo 18z+6MMI71z+NOgbty8+BbrE+CsB+0pp87MSNVNrbx04l/ufp65gX3CaQQBYBiy4 >> icon_data.b64
echo feeyo1RL3GDvxDA0E6deTN8DQIbZlJya7etkIYcYFgIEJgInLQhohrm+a6K1sljL >> icon_data.b64
echo PHV+TRDFsE5nLwEWdUOtOwdPiLEw8F6rLpke3QrrO58GPfLYnM3iEk5/LXjsrFKv >> icon_data.b64
echo VLn9sSWjwY/HVkHSIqBgsuDWJ1YcUicbxczfj42wIuoAxHwKTRjUNoS2ddEyDjUN >> icon_data.b64
echo UWwF0iTEUSzEyApz6q6PRXs+65x77e7yuTdX/+nAj9ueCzKd9sOCbFayv2diOLmm >> icon_data.b64
echo e5oTG2X/00EG6C8w9tkssNuCQbTg/XuvIh3vL69+hpKlmUnb48X+c5PLODsfOkyh >> icon_data.b64
echo pdZdy46qk42i90q13+YVwyziRGQJgqD7vYYdCBp6STDDXW7dOVpbKiajrBprFeI2 >> icon_data.b64
echo 0Yc3x/sGuk31yZ8HmwxRXrRt+NHbkpdbG7uiPbvCO11hLIMEBJjalpL1+YpZmq0H >> icon_data.b64
echo Pzo3NH1uK0xf/ndBD30fvFMJYNuc93d4P5kkGm2b5OpSxX21OsC+TI0XKWGjzaUx >> icon_data.b64
echo qiWu9/Ii4zvko9BSsjY/3dy24mC8pfcc+yoR05EvKpEHgPU13WO1O4eODW/N7O93 >> icon_data.b64
echo wsbuPdmP/rvP1gd++tBE9qtfrJeffMb/qP9mNVh3m7svDoUgAsOC2Bes3m6UTK/b >> icon_data.b64
echo NlnZDh4+wYC9DzshANjUe1N359GjTnZ//IUyzrQvxFd11TL/5/xKzkqGBcEwbF5F >> icon_data.b64
echo 4dbB45kfntkIhxY4YQAImPbWweMUWeH+84WlshoHFFvoHjfNQm/OLodHaOc8/al/ >> icon_data.b64
echo bZ947FT/8vuHj236o3uqChUIlMDf/ts8/uQvc+Fnvlf+wd/cH38qe7aRtW5a/Khl >> icon_data.b64
echo KN5cHrdKxN7hmRXTh28Fu94HQN94K+VAT/ZmeSEqqxemOd5crrhvzPRBEWBTMlFi >> icon_data.b64
echo EV9bHvP2TS8hs6jLtWAImOYnhw6pY/WuzJOjq2UtCdgXzFnF8EUCTxjOSrYZZdxQ >> icon_data.b64
echo K7G/WlBvVEd+65Y2x1MkwrbgeIpo66+0ycmIINlzoSSu6zprO7kAFsSegDpc6zFr >> icon_data.b64
echo cw06H2nnjRoAcRcYJNL3+Fb3xQpzZCNbVFqOh1l2O/xOmEzJjWyv15Inmt2LMhJT >> icon_data.b64
echo bKn90SUnvP2Vfu/Vap/NK2bZAW6ZeK6rtyBiRsICOutCnm25Tz/jeG4fs68sub3M >> icon_data.b64
echo z73qcQhRt8eaXXHdZuzKbJUimxJaEou6VtQ2ypbdhvfEOAD+CAgs0szBVzp7psgO >> icon_data.b64
echo BE05GQUUp6QFpd7Xa/LT6ni9i4ydu6AwRZaStfkKJSyc12d6bVHZeUK/y0MAXj/i >> icon_data.b64
echo rLr916J9f/qtbjz6t3k6EXvx976XpS/9dZl+45pw/8FRf5l8q9afrMlPwwIgSo+c >> icon_data.b64
echo GPJUs6BX5hrO8xcAxGvB9+YEeHsRiNepN2ZhhrJNUYl9LL4MCYIZCJrybKvISqTe >> icon_data.b64
echo 7eTD+OrShPvPU8vZE4CBeIfFksCS0jNmCNexfPScO9JsU+bj1zee/Y8PdU1f/YOr >> icon_data.b64
echo 3/43D5UrN29qPu8oiwPn/TWZ2bYyeaXZ77QZadsCMRVnzFC2JU40QbWkH+ANCvB6 >> icon_data.b64
echo EDcLNBbCbigm8nw7D9GpiAxYTzIHUsvZJANFqfcTJt3vNaGtkNXEnc9Wl7hbzCQM >> icon_data.b64
echo Kc1cp8oW5DmWn92fuWHDcHzkd7bU9zuDExfsZ/XRA8/K9QfO+hsc11pqWUkJC1Nw >> icon_data.b64
echo IlWNfVYEFgTRiD0OhKW6hqhrZQpiiQJ4RFaSQEzHsHllnekoB077eWjA5oWh0DjU >> icon_data.b64
echo MgQn7YcpsrADQVONt3IUW8ARBMsXGU8tg2j7kK+HcqX8A4dBMQuI1CkeGRw67qw7 >> icon_data.b64
echo clCuozGn2lza3QreGl/qFi1gIChhUF17nJEJTbDfyXcQNe2xFITEajEWKbNUrVMA >> icon_data.b64
echo CWgmJAx4QnPRndEMj1Tqadvnt9lXLVt0auxRyvu2Jj0YVGQl8k3Zq7FPzHPVWhDE >> icon_data.b64
echo jObonmV+46+u9gDhkQOd+c9HmrbkEDpZTBGYtEDClKhBb0oNqpxxBEAC5Gsil9p2 >> icon_data.b64
echo MJg21YTn1ieAOZAJLIMiCwBCzbMLAAsypt+vCFd47FAKoMcNuctp2AGvwq5kAKBQ >> icon_data.b64
echo EXe7NbYc234PaQh1VlEEqxKjV+XKgPQAwKzMxrbPm+aSJ+aaOUMAaQZ3u5HNOS3T >> icon_data.b64
echo 51fn128rMl1OXQiKFq/PApY9Gc/XIBArwKbXPAFQzK5zcHa1mEkEFIE0g7ocY7q9 >> icon_data.b64
echo 086h+jA7Yj48bNEJQIDzVq2fMxKwi1INM/I7D4EktFmRjQtffD1Ds/FKnA8X8gMB >> icon_data.b64
echo FFnwqmxDFh3POVAb5kxH42oZ6KUZJc80i87bjTx7Ah0eId5YPAoJC0ESYKkAe8aU >> icon_data.b64
echo nLYtu4GYTaTp9WZFPelil5gVESWWOCMjm1WMNFAYgSSaioPk6u5x16v2XXQp6VhH >> icon_data.b64
echo CSPzX440ba8/TbPJSs4qe9E7ghjGkhnKVuSFyGNXMLsi3cMXZLvdljpcK7EvmJ30 >> icon_data.b64
echo xmZzTkyWLZRw7KAHwL4tADEJXzW51wPVteIuJ+5sRCBAhFZQxNLmVQTNBAvBikid >> icon_data.b64
echo b+c5I7XNKQNtRVo1Fv0JkO12iEuuSKs6X/y5ZYIUZJZmGvJYvQyHCIYFLAR7EuyS >> icon_data.b64
echo FbXE57QrItJMNqdiRJY4I2FzygI8JkC7pgF53FxRgDzTzNhuL1w4ZgKMhZgKAzMQ >> icon_data.b64
echo 1EjbVHnoVGHncK0Ub+oeo7YF5CVKGgMwDGjGJZ9grjlM1uQqYjoKZDV2WVGauLWF >> icon_data.b64
echo KbtNalsl2kZAdm4YlsElty3PtgO7IgNbcqcBPtwpPuLN5OYelqOtrOn3W6wE5r2k >> icon_data.b64
echo BNTxeilZl68ssB3EgWD39Zl+syJT10OZOjUNQdJ7y4GCmGImm1NJtKV31Pv51DL2 >> icon_data.b64
echo BHf6LlDCSDYUp9TJRnHeEQDABD2UrasTjZzeUgbgHAftmu4AoL3xjT1EjACJIVt2 >> icon_data.b64
echo 23PZgl1iNR5mKTRKLw0aFFmaq8UgUPDU6Krw9sGTeiBoiIZeUCkWa5sE7pwcRMuQ >> icon_data.b64
echo 9UXc2jZ0xH92YoVoGQei4xjDZPNK224nco7Wyx3ypg1dIKztdkI53s7FdwwwIP8x >> icon_data.b64
echo PUwAaMw8o5f5DXNVkZxXZ7qSDxQnKbYLQpUE3FeqS+Lre0ZhkPYnDLAiiIbxgr87 >> icon_data.b64
echo uya8beB0eH15FMxWtAxRaIk0C9ZWUGSJWlZQwog3FKZanxg64u+dWKbONIvsy84V >> icon_data.b64
echo kpjaFvGHes45h2tliq2YD9fIQq/KV+TZdoCi40Zbugmw/7sTjdsk8t+fBNyfhXcP >> icon_data.b64
echo s/P6TNkszbQ4kBa2Ey6uZDXaytJs7EXXlcZFQ6fhwgA7BDmbBNnHzmyEI2xr24pD >> icon_data.b64
echo 7V/vP5msL1Rsr9/kstfWq3PV8Mbe081PrnhLL880MrtPr1enm13zvY6glBMjuZrp >> icon_data.b64
echo cUP3wGxv+llHyQMQbyxU3Bcu9EX/apA54x7FK8nLaTs9/9ivh59eSpSRjjpSKyRX >> icon_data.b64
echo FKYoNAQBhmViX7K/d3Io2ViYTkYyNWpeDAIC5P3T1PLgR+fWiakwq0eys8m1pfHk >> icon_data.b64
echo g13T8YZiRbSN4//k/OrgmfERitlZiHtiii3ZvIqj2wZOBT8ZWwlFcyHKFBnSy4M6 >> icon_data.b64
echo RVaq8+1c+8urCXAexnWPJsBOOXdZF9h7k8DNG/dlv3boqsxXD+nGF9cczfzw9DrS >> icon_data.b64
echo VoKI0Kmc1hdx61Mjh/2/Hx12TrcKNrdIKxJgmFRWpKRzI+tPb2TsihSoooWq3fG8 >> icon_data.b64
echo zauo9anhI/6Pz42osTDP7nzhYootNT89fCj4u7Mr9K+WM7M//NAM6vE65L97YYED >> icon_data.b64
echo 2Ea45TkN4D+0/v1a4j5XeS9c6AtvHzwh2pbmuMCKWLStm3ns1PrwN5acia7umhBN >> icon_data.b64
echo TWQ4JW6nWl5yI9OcUcyBsJ0ul+beFQ1Neig70/rk0BH/qXMjajTMs9dROASxaBoK >> icon_data.b64
echo t5RHxUQYyMkw2/jrTQSo/4rCd6fSYQu4My7abVJ14uFnGPLx+vc2k/fSVC+MldF1 >> icon_data.b64
echo pXFqmrlNiR2CCI2b/cGpjWZZtt68a/lRU3RboqmJIrso9/zijEoxQzQ1sUNJ+9aB >> icon_data.b64
echo k9GHyuOZx0+vU2NhngPJ89fY0FAylKnpNYXZzO7TQ82vfRBmIHMAuye/nk5xdl+q >> icon_data.b64
echo zHVmX+PHezBQeC33J68NZP7yKNf/eP0h/+mx5epsq8CZS9S5yECvzlXjTaVJio1w >> icon_data.b64
echo Ds72iIkwL9pGUczQJadte/1p91BtGfsC7Elrym5TbyhOmW43cg7PltwDs/0dNW8h >> icon_data.b64
echo G0WGbEbFzc8MHcl98/havbnLmXn6JgOYG0CPvvxOZW4exJxGtP0Wgni265a9rP5v >> icon_data.b64
echo 1dR3rD0cPDk65Iy28zajLhJjO0SHHslVk9X5ChecGNqSqGsPSkS2262L860+W3JD >> icon_data.b64
echo SGGprZU61Syqo/Veim2q6M0dWGc9m1VR89NDb2cePzMiEhNUTmwV1qUvgR598FKF >> icon_data.b64
echo +hfI63Ozgc/fSwa7um76BysP1JLm9lXH3X2VckehTglr00wBgCiygAXYF7AFp42M >> icon_data.b64
echo ipNBv8rd3qxzuLYCLe3KWhJQK1UD2VskRXbWEE0DPZSdbd+x5Ezwv1Ljq/tvlabP >> icon_data.b64
echo fwj08H3vLa8vhFP6In9+B1k82HXjXnZerJjmPatOoKllsGd8mCIrO95bMILSpo1M >> icon_data.b64
echo On3R3U7L9vnT7qH6cvYFWFDaM6Vdz5xwAIpSfSrc0nNWryvUsn9zYhUywq3uv1WY >> icon_data.b64
echo vsxDoF33pfPk3fbS6eVljJg+v4M0PZi/bz+CR45x+JElY/E13RXv5xf6nbfrvdAW >> icon_data.b64
echo 7M1PahYWNox5cfdgbZhdmhd+54GmtyrooexM9Ks958VkFGQePz0U39Yvars/DFtw >> icon_data.b64
echo doG+sQP8uAQ+8Q7jfzmAi0/itwD1qP/4mb78F14BJzYMbx8cs71e6ByrF9WhWq9o >> icon_data.b64
echo aGeu7WBBIAZ0edGMTAGkkarbDHAgrF6dv5BsKFQRWun/bHxAToW55p9/EM2vrI0A >> icon_data.b64
echo +RXQrgffzfOXBwBY4MTYJ4cxMPCguNC4I/vnBxF84zhMVrWSG3qm9Kpcg0Kj1Mlm >> icon_data.b64
echo QVyIMtTQnqwlnulSNdsfTDsHaytNlxNyVsa25LXNcLZmu7xYnG363gsXeuVYuxD9 >> icon_data.b64
echo 9jI0/+JK6NWFV4HwXtC3X7poPv0uz2UOuheNdfjezwDiq+p0ba3/nZPwv38GNBZq >> icon_data.b64
echo W3YbeiTXMEOZFgfKsiTiQMbsyUTU4gwZBkWWxNlWoE42s3K8nUfBcaO7BtHesRrJ >> icon_data.b64
echo FcUJwP0rfOmpr+PBY9F7jVffHwCgUyfuZxAxXr4jg2tXbgPsdmq2b3DeqMF7chzO >> icon_data.b64
echo P12AONUE1RIgYQ3LDEBAkIUih7MSvCyD5PoS4o8tQbylG7YQHAScb6Mx/gPkH5uY >> icon_data.b64
echo 3+s9PP/+AcwDuWR6zjs2AfIOwH4EiNdQNRoUTS3lWARENm1WCDBLfHBWwfZ64+kP >> icon_data.b64
echo PugFAE/g/tdfwgPP6fm1f0m8/8sAADoDwZ0SeMBctBlvLwKZNQD6Ab0RkCKVKwQA >> icon_data.b64
echo PgaIccAcBT04dfF6O9U71rrM5/8BUd6sLNNItTMAAAAASUVORK5CYII= >> icon_data.b64
certutil -decode icon_data.b64 app_icon.ico >nul
del icon_data.b64
echo   Done.
echo.

rem ---------- Step 4: Install packages and build EXE ----------
echo [4/4] Installing packages and building EXE (1-2 minutes)...
%PYCMD% -m pip install --quiet pyinstaller plyer
%PYCMD% -m PyInstaller --onefile --noconsole --name "WarframeRadar" --icon=app_icon.ico warframe_radar.py
echo.
if exist "dist\WarframeRadar.exe" (
    echo ==========================================
    echo  SUCCESS!
    echo  Your app is ready at: dist\WarframeRadar.exe
    echo ==========================================
) else (
    echo ==========================================
    echo  BUILD FAILED - please scroll up to see the error
    echo ==========================================
)
echo.
pause
