
#$guid      = '0c067401-76a3-4d5f-b9a2-dad18e45feba'

#$PullServer   = "\\triton.addicks.us\c`$\program files\windowspowershell\dscservice\configuration\$guid.mof"
#copy $source $dest
#New-DSCCheckSum $dest -Force

$sourcedir = "c:\dev\dsc\Configurations\PowerAlto2\athena2.addicks.us.mof"
$PullServer = 'triton.addicks.us'
$guid      = [guid]::NewGuid()

function PushConfigToPullServer {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$True,Position=0)]
        [string]$NodeName,

        [Parameter(Mandatory=$True,Position=1)]
        [string]$Configuration,

        [Parameter(Mandatory=$True,Position=2)]
        [string]$PullServer,

        [Parameter(Mandatory=$False,Position=3)]
        [string]$Guid
    )

    if (!($Guid)) {
        Write-Verbose "No Guid provided, generating one."
        $Guid = [guid]::NewGuid()
    }

    $SourceMof = "C:\dev\dsc\Configurations\$Configuration\$NodeName.mof"
    $Destination = "\\$PullServer\c`$\Program Files\WindowsPowerShell\DscService\Configuration\$Guid.mof"
    cp $SourceMof $Destination
    New-DSCCheckSum $Destination -Force
}