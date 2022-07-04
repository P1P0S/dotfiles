#pokemon
pokemon

#prompt
Import-Module posh-git
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\spaceship.omp.json" | Invoke-Expression

#Icons
Import-Module -Name Terminal-Icons

#PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

#Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'

#Alias
Set-Alias ls la
Set-Alias l lb
Set-Alias vim nvim
Set-Alias cat bat

#git alias
Set-Alias gmoji gitmoji
Set-Alias g git
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

#Alias func
function ll() { Get-ChildItem | Format-Table }
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
    $arg = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($args[1]))
      $arg
  }elseif($args -eq "--encode"){
    $arg = [System.Text.Encoding]::Unicode.GetBytes($args[1])
      $output = [Convert]::ToBase64String($arg)
      $output
  }else{
      Write-Output("Use --decode [arg] or --encode [arg]")
  }
}
