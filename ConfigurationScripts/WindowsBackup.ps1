Configuration WindowsBackup {
    param (
        [string[]]$ComputerName = 'localhost'
    )

    Node $ComputerName {
            WindowsFeature Backup {
            Ensure = 'Present'
            Name = 'Windows-Server-Backup'
        }
    }
}