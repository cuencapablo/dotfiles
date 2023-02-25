#
# $PSDefaultParameterValues['*:Encoding'] = 'utf8'
function prompt {
  # $PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'k
  # write-host (get-date -Format "yyyy-MM-dd HH:mm:ss") -ForegroundColor Yellow -NoNewline
  write-host (get-date -Format "HH:mm:ss") -ForegroundColor Magenta -NoNewline
  $p = Split-Path -leaf -path (Get-Location)
  " $p > "

}


# --------------------------------------------
                # Paths #
# --------------------------------------------

### nonyoo
function nonyoo-path {
        cd "C:\Users\Eme\Desktop\nonyoo\"
    }
New-Alias -name nonyoo -value nonyoo-path

### Nvim
function nvim-path {
        cd "C:\Users\Eme\AppData\Local\nvim\"
    }
New-Alias -name pnvim -value nvim-path

### Host
function host-path {
        cd "C:\Windows\System32\drivers\etc"
    }
New-Alias -name phost -value host-path

# --------------------------------------------
                # Scripts #
# --------------------------------------------

### C Compiler



# --------------------------------------------
                # Aliases #
# --------------------------------------------

# CHROME APPS --------------------------------

# The Odin Praject
# function start-odinproject {
#       start "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"  '--profile-directory=Default --app-id=jaelabgnpbbmolfngdlejlkcipalcepp'
#   }
# new-alias -name odin -value start-odinproject

### freeCodeCamp
# function start-freeCodeCamp {
#        start "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe" '--profile-directory=Default --app-id=idcicjmfdnncfmmgoogecnlfbkglgcak'
#    }
# new-alias -name fcc -value start-freeCodeCamp

# WINDOWS APPS -------------------------------

## Affinity Designer
function Start-ADesigner {
        start "C:\Program Files\Affinity\Designer\Designer.exe"
    }
New-Alias -Name designer -Value Start-ADesigner

### Google
function Start-Chrome {
        start chrome
    }
New-Alias -Name chrome -Value Start-Chrome

### Firefox
function Start-Brave {
        start brave
    }
New-Alias -Name brave -Value Start-Brave

### Neovim
New-Alias -Name vim -Value nvim
