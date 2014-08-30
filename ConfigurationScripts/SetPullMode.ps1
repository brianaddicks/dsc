Configuration SetPullMode {
    param(
        [string[]]$ComputerName = 'localhost',
        [string]$guid
    )

    Node $ComputerName {
        LocalConfigurationManager {
            ConfigurationMode         = 'ApplyOnly'
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