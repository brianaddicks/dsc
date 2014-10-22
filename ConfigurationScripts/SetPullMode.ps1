Configuration SetPullMode {
    param(
        [Parameter(mandatory=$True)]
        [string]$ComputerName = 'localhost',

        [Parameter(mandatory=$True)]
        [string]$guid
    )

    Node $ComputerName {
        LocalConfigurationManager {
            ConfigurationMode         = 'ApplyAndAutoCorrect'
            ConfigurationID           = $guid
            RefreshMode               = 'Pull'
            DownloadManagerName       = 'WebDownloadManager'
            DownloadManagerCustomData = @{
                ServerUrl               = 'http://triton.addicks.us:8080/PSDSCPullServer.svc';
                AllowUnsecureConnection = 'true'
            }
        }
    }
}