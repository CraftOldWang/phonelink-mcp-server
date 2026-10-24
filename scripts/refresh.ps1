param()
. "$PSScriptRoot\uiautomation-core.ps1"
$win = Find-PhoneLinkWindow
if (-not $win) { throw "Phone Link window not found" }
$button = Find-ElementByAutomationId -Root $win -AutomationId "RefreshButton"
if (-not $button -or -not $button.Current.IsEnabled) { throw "Refresh button unavailable" }
$button.GetCurrentPattern($InvokePattern).Invoke()
ConvertTo-McpJson @{ refresh_requested = $true; message = "Sync requested; delivery is not confirmed." }
