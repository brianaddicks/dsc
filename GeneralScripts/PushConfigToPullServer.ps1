$guid   = [guid]::NewGuid()
$source = ".\WindowsBackup\athena2.addicks.us.mof"
$dest   = "\\triton.addicks.us\c`$\program files\windowspowershell\dscservice\configuration\$guid.mof"
copy $source $dest
New-DSCCheckSum $dest