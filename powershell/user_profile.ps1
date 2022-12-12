#pokemon
pokemon

#prompt
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\poshmon.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

#Icons
Import-Module -Name Terminal-Icons

#PSReadLine
#Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle InlineView

#Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'

#Alias
Set-Alias ls la
Set-Alias l lb
Set-Alias vim nvim
Set-Alias cat bat
Set-Alias lg lazygit

#git alias
Set-Alias gmoji gitmoji
Set-Alias g git
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

#Alias func
function ll() { Get-ChildItem -Path . -Force | Format-Table }
function la() { Get-ChildItem | Format-Wide }
function lb() { Get-ChildItem | Format-List }
function open() { Invoke-Item $args }
function ..() { cd .. }

function take{
  New-Item -ItemType directory $args
  Set-Location "$args"
}

function b64{
  if($args -eq "--decode"){
    $arg = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($args[1]))
      $arg
  }elseif($args -eq "--encode"){
    $arg = [System.Text.Encoding]::UTF8.GetBytes($args[1])
      $output = [Convert]::ToBase64String($arg)
      $output
  }else{
      Write-Output("Use --decode [arg] or --encode [arg]")
  }
}
