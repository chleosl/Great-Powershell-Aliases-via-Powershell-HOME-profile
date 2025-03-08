# Apply settings only in VS Code integrated terminal
if ($env:TERM_PROGRAM -eq "vscode") {
    # Function to run Flutter app in Chrome
    function Invoke-FlutterChrome {
        <#
        .SYNOPSIS
        Runs a Flutter app in Chrome.

        .DESCRIPTION
        Executes 'flutter run -d chrome' to launch a Flutter application in the Chrome browser. Only available in VS Code terminal.

        .EXAMPLE
        rc
        #>
        try {
            Write-Host "Launching the Flutter app in Chrome" -ForegroundColor Green
            & flutter run -d chrome
        } catch {
            Write-Error "Error occurred while running Flutter: $_"
        }
    }

    # Function to start Node.js server for CORS proxy
    function Start-NodeServer {
        <#
        .SYNOPSIS
        Starts a Node.js server for CORS proxy.

        .DESCRIPTION
        Executes 'node server.js' in the directory 'C:\Users\06hyu\Desktop\VScodeProjects\nodejsServer\cors-proxy' to start a Node.js server. Only available in VS Code terminal.

        .EXAMPLE
        nsv
        #>
        try {
            Set-Location -Path "C:\Users\06hyu\Desktop\VScodeProjects\nodejsServer\cors-proxy"
            Write-Host "Starting the Node.js server:" -ForegroundColor Green
            & node server.js
        } catch {
            Write-Error "Error occurred while starting the server: $_"
        }
    }

    # Register aliases for the functions
    Set-Alias -Name rc -Value Invoke-FlutterChrome
#    Set-Alias -Name r -Value Invoke-FlutterChrome
    Set-Alias -Name nodeserver -Value Start-NodeServer
    Set-Alias -Name nodesvr -Value Start-NodeServer
    Set-Alias -Name nsv -Value Start-NodeServer
}