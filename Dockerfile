FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN powershell -Command Add-WindowsFeature Web-Server

### Install Chocolatey
RUN powershell -NoProfile -ExecutionPolicy Bypass \ 
        -Command "$env:ChocolateyUseWindowsCompression='false'; \
         iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

### Configure Windows
RUN powershell add-windowsfeature web-asp-net45


RUN powershell -NoProfile -ExecutionPolicy Bypass -Command \
    Invoke-WebRequest "https://aka.ms/vs/16/release/vs_community.exe" \
    -OutFile "%TEMP%\vs_community.exe" -UseBasicParsing

RUN "%TEMP%\vs_community.exe"  --quiet --wait --norestart --noUpdateInstaller \
    --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 \
    --add Microsoft.VisualStudio.Component.Windows10SDK.18362

