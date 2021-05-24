Function loadConfig ($fileName, $oneSection) {
	$config = Get-Content ($fileName)    
	$cfg = @{}
	$sec = $cfg
	$section = ''
	ForEach ($line in $config) {
	   $line = $line.Trim()
	   if ($line.startswith('[')) {
		  $section = $line.replace('[','').replace(']','')
		  if ($oneSection -eq '*') {
			 $cfg.Add($section,@{})
			 $sec = $cfg.$section
		  }   
		  continue
	   }       
	   if ($oneSection -ne $null -and $section -ne $oneSection -and $oneSection -ne '*') {continue}
	   $k = $line.IndexOf('=')
	   if ($line -eq '' -or $k -lt 1 -or $line[0] -in '[','#') {continue}
	   #$sec.Add($line.Substring(0,$k), $line.Substring($k+1))
	   if ($line -eq '' -or $k -lt 1 -or $line[0] -in '[','#') {continue}
	   $sec.Add($line.Substring(0,$k), $line.Substring($k+1).Trim('"'))
	}
	Return $cfg
}

$prevPwd = $PWD; Set-Location -ErrorAction Stop -LiteralPath $PSScriptRoot

try {

	$envfile = [String]$prevPwd + "\.env"

	if(-not(Get-Item -Path $envfile -ErrorAction Ignore)) {
		echo "Arquivo " + $envfile + " nao localizado. Dica: copie o arquivo .env.example da raiz do projeto"
		exit
	}
	
	$conf = loadConfig $envfile "*"

	$conf.CNTLM_NO_PROXY
	$conf.CNTLM_LISTEN
	$conf.CNTLM_PROXY
	$conf.LOCAL_PROXY_ADDRESS

	echo ""
	echo "==> set PROXY_WINDOWS_PATH environment variable"
	[Environment]::SetEnvironmentVariable("PROXY_WINDOWS_PATH", $prevPwd, "User")
	
	echo ""
	"    - PROXY_WINDOWS_PATH:      {0}" -f [Environment]::GetEnvironmentVariable("PROXY_WINDOWS_PATH", "User")
	echo ""
	echo ".Ok"

	echo ""
	PAUSE

 $PWD  # output the current location 
}
finally {
  # Restore the previous location.
  $prevPwd | Set-Location
}
