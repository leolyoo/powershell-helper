Param(
    [Parameter(Mandatory = $true,
        Position = 0,
        ParameterSetName = "Path",
        ValueFromPipeline = $true,
        ValueFromPipelineByPropertyName = $true,
        HelpMessage = "Path to one or more locations.")]
    [Alias("PSPath")]
    [ValidateNotNullOrEmpty()]
    [string[]]
    $path
)

Get-ChildItem -Path $path -Recurse | Group-Object -Property extension -NoElement | Sort-Object -Property Count -Descending | Format-Table -AutoSize