# PowerShell script to call the Python script with specified parameters
$pythonScriptPath = ".\arprog_cmdline.py"
$port = "COM3"
$targetImage = "META_IMAGE1"
$sourceFile = "..\target\thumbv7em-none-eabihf\debug\app.appimage"

# Save the current directory
$originalDirectory = Get-Location

# Change to the tools directory
Set-Location -Path ".\tools"

# Call the Python script
py -3 $pythonScriptPath -p $port -t $targetImage -f $sourceFile -s SFLASH

# Change back to the original directory
Set-Location -Path $originalDirectory