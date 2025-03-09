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

    # Function to run Flutter app in Chrome with custom entry point
    function Invoke-FlutterChromeCustom {
        <#
        .SYNOPSIS
        Runs a Flutter app in Chrome with a custom entry point.
        .DESCRIPTION
        Executes 'flutter run -t lib/{name}.dart -d chrome' to launch a Flutter application with a specific entry file in Chrome.
        .PARAMETER Name
        The name of the Dart file without the .dart extension.
        .EXAMPLE
        rcc main_v2
        #>
        param(
            [Parameter(Mandatory=$true, Position=0)]
            [string]$Name
        )
        
        try {
            Write-Host "Launching the Flutter app with entry point 'lib/$Name.dart' in Chrome" -ForegroundColor Green
            & flutter run -t "lib/$Name.dart" -d chrome
        } catch {
            Write-Error "Error occurred while running Flutter: $_"
        }
    }

    # Register aliases for the functions
    Set-Alias -Name rc -Value Invoke-FlutterChrome
#    Set-Alias -Name r -Value Invoke-FlutterChrome
    Set-Alias -Name rcc -Value Invoke-FlutterChromeCustom
    Set-Alias -Name nodeserver -Value Start-NodeServer
    Set-Alias -Name nodesvr -Value Start-NodeServer
    Set-Alias -Name nsv -Value Start-NodeServer
}
