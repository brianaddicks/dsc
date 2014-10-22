Configuration PowerAlto2 {
    param (
        [string[]]$ComputerName = 'localhost'
    )

    Import-DscResource -Name MSFT_xRemoteFile -ModuleName xPSDesiredStateConfiguration

    Node $ComputerName {
        xRemoteFile DownloadZip {
            DestinationPath = "$env:temp\PowerAlto2.psd1"
            Uri             = 'https://github.com/brianaddicks/poweralto2/raw/master/PowerAlto2.psd1'
        }
        Log InterestingInfo {
            Message = "Whatever you'd like to say"
            #DependsOn = "[File]MassiveFileCopy"
        }
    }
}