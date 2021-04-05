Param (
    [Parameter(Mandatory = $true,
        Position = 0,
        ParameterSetName = "FileName",
        ValueFromPipeline = $true,
        ValueFromPipelineByPropertyName = $true,
        HelpMessage = "Path to one or more locations.")]
    [Alias("Path")]
    [ValidateNotNullOrEmpty()]
    [ValidateScript( { [System.IO.Path]::IsPathRooted($_) })]
    [System.IO.FileInfo]
    $archiveFileName
)

Add-Type -AssemblyName "system.io.compression.filesystem"

[io.compression.zipfile]::OpenRead($archiveFileName.FullName).Entries | Group-Object -Property { [System.IO.Path]::GetExtension($_) } -NoElement | Sort-Object -Property Count -Descending | Format-Table -AutoSize