FROM mcr.microsoft.com/powershell:lts-debian-buster-slim

COPY ./src/*.ps1 /src/

ENTRYPOINT [ "pwsh", "/src/Get-Envs.ps1" ]