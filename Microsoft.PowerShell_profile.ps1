# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for choco.
# Be aware that if you are missing these lines from your profile, tab completion
# for choco will not function.
# See https://ch0.co/tab-completion for details.

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

[System.Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Program Files (x86)\Java\jre-1.8\")
[System.Environment]::SetEnvironmentVariable("Path", [System.Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::Machine) + ";$($env:JAVA_HOME)\bin")



# ---------------------------------------------------------------------------------
#
# Check File hashes - verify authenticity 
#
# ---------------------------------------------------------------------------------
function md5 						{ Get-FileHash -Algorithm MD5 $args }
function SHA1 						{ Get-FileHash -Algorithm SHA1 $args }
function SHA256 					{ Get-FileHash -Algorithm SHA256 $args }


# ---------------------------------------------------------------------------------
#
# Obsidian Aliases Windows
#
# ---------------------------------------------------------------------------------
function cdnotescss                    {cd C:\Users\KShannon.pc\Documents\Obsidian\Notes\.obsidian\snippets}


# ---------------------------------------------------------------------------------
#
# quick change directory functions and aliases
#
# ---------------------------------------------------------------------------------
function sshFolder                      { cd "C:\Users\Keylan Shannon\.ssh\" }
function cdH                            { cd c:\}
function cdS                            { cd s: }
function cdP                            { cd p:\}
function cdR                            { cd r:\}
function cdD                            { cd d:\}
function airportproject                 { cd p:\robileware\airport_demo3 }
function shellscriptingprojects         { cd s:\languages\shellscripting\ }
function visualstudio2022               { cd d:\Programs\VisualStudios2022\}
function editvim                        { vim "C:\Users\KShannon.pc\AppData\Local\nvim" }
function ps-config                      { cd "C:\Users\Keylan Shannon\OneDrive\Documents\PowerShell" }
function programFiles86                 { cd "C:\Program Files (x86)\"}
function programFiles                   { cd "C:\Program Files\"}

# ---------------------------------------------------------------------------------
#
# general purpose aliases 
#
# ---------------------------------------------------------------------------------
function editaliases                    { vim $profile }
function mntdriveinfo                   { get-psdrive }
function driveletters                   { (get-psdrive).name -match '^[a-z]$' }
function df                             { get-volume }
function driveinfo                      { get-volume }
function Env:                           { Set-Location Env: }
function env                            { Get-ChildItem Env:}
function tail                           { get-content -Last 20 $args -Wait }  
function realpath                       { resolve-path $args }
function ni                             { new-item -ItemType File -Path . -Name $args }
function vim                            { C:\tools\neovim\nvim-win64\bin\nvim.exe $args }


# ---------------------------------------------------------------------------------
#
# Useful powershell functions 
#
# ---------------------------------------------------------------------------------
<#
.SYNOPSIS
	Finds Files of course
#>
function find-file($name) {
	ls -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach {
		$place_path = $_.directory
			echo "${place_path}\${_}"
	}

}


<#
.SYNOPSIS
	I forgot what id does
#>
function pkill($name) {
    ps $name -ErrorAction SilentlyContinue | kill
}

<#
.SYNOPSIS
	I forgot what id does
#>
function pgrep($name) {
	ps *$name*
}

# ---------------------------------------------------------------------------------
#
# Launch an admin powershell CLI  
#
# ---------------------------------------------------------------------------------
function admin {
    $psVersion = $PSVersionTable.PSVersion.Major
    if ($psVersion -le 5)
    {
        if ($args.Count -gt 0)
        {
            $argList = "$ '" + $args + "'"
            Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $argList
        }
        else
        {
            Start-Process "$psHome\powershell.exe" -Verb runAs
        }
    }
    else
    {
        if ($args.Count -gt 0) 

        {
            $argList = "$args"
            Start-Process pwsh -ArgumentList $argList -Verb runAs
        }

        else
        {
            Start-Process pwsh -Verb runAs
        }
    }
}

#set the following to admin as well
set-Alias -Name sudo -Value admin
set-Alias -Name su -Value admin



# ---------------------------------------------------------------------------------
# quick change directory functions


function sshFolder {
	cd c:/Users/KShannon.pc/.ssh/
}


# ---------------------------------------------------------------------------------
# General Functions



function editAliases {
    vim $PROFILE
}

function hyperConfig {
	vim $Env:AppData/Hyper/.hyper.js
}

function mntDriveInfo {
    Get-PsDrive
}

function getDriveLetters {
    (Get-PsDrive).Name -match '^[a-z]$'
}

function getDriveInfo {
    Get-Volume
}

function downloads {
    cd "C:\Users\KShannon.pc\Downloads" 
}

function documents {
    cd "C:\Users\KShannon.pc\Documents"
}


# ---------------------------------------------------------------------------------
# WSL ALiases 

function ubuntuDev{
    wsl -d ubuntuDev -u calamityesp
}


# ---------------------------------------------------------------------------------
# SSH Aliases

function shankey{
   ssh -Y shankey@10.79.97.167 
}

function shankeyLocal{
   ssh -X shankey@192.168.1.1
}
