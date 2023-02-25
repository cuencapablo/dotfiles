#SingleInstance Force
#IfWinActive, ahk_class WorkerW

:B0*:npp::			; Open notepad on windows
run, notepad++.exe
return

:B0*:udemy::			; Open Udemy on windows
run, "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe" --profile-directory=Default --app-id=jhjfilipgobilidojfjedfnkpmebkkee
return

:B0*:fcc::			; Open freeCodeCamp on windows
run, "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=idcicjmfdnncfmmgoogecnlfbkglgcak
return