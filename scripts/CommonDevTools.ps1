
# tools we expect devs across many scenarios will want
choco install -y vscode $common
choco install -y git -params '"/GitAndUnixToolsOnPath /WindowsTerminal"' $common
choco install -y 7zip.install $common
choco install -y sysinternals $common

choco install -y googlechrome $common
choco install -y notepadplusplus.install $common
choco install -y sourcetree  $common
choco install -y slack $common

choco install -y teamviewer $common
choco install -y resharper-platform $common

choco install -y sql-server-management-studio $common