
# tools we expect devs across many scenarios will want
choco install -y vscode --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"
choco install -y git -params '"/GitAndUnixToolsOnPath /WindowsTerminal"' --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"
choco install -y 7zip.install --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"
choco install -y sysinternals --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"

choco install -y googlechrome --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"
choco install -y notepadplusplus.install --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"
choco install -y sourcetree  --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"
choco install -y slack --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"

choco install -y teamviewer --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"
choco install -y resharper-platform --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"

choco install -y sql-server-management-studio --cacheLocation "$env:userprofile\AppData\Local\Temp\chocolatey"