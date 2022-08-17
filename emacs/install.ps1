if (-not (Get-Item $env:appdata/.emacs.d)){
  Write-Host "Configuration directory doesn't exist, creating it..."
  New-Item -Path "$env:appdata/.emacs.d" -ItemType directory
}
foreach ($i in @("init.el","config.org")){
  Write-Host "Copying $i to $env:appdata/.emacs.d"
  Copy-Item $i "$env:appdata/.emacs.d"
}
