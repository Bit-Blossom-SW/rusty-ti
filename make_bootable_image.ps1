$command = "C:\ti\MMWAVE_L_SDK_05_05_00_02\tools\boot\out2rprc\out2rprc.exe"
$multicore_command = "C:\ti\MMWAVE_L_SDK_05_05_00_02\tools\boot\multicoreImageGen\multicoreImageGen.exe"
$bss_rprc = "C:\ti\MMWAVE_L_SDK_05_05_00_02\firmware\mmwave_dfp\rfsfirmware\xWRL6432\mmwave_rfs_patch_rprc.bin"
$crc_multi_core_image_gen = "C:\ti\MMWAVE_L_SDK_05_05_00_02\tools\boot\crcMulticoreImageGen\crcMulticoreimage.exe"
$location = ".\target\thumbv7em-none-eabihf\debug"
$filename = "app"
$boot_image_rprc_name_temp = "app.appimage.tmp"
$bootimage_bin_name = "app.appimage"
$bootimage_bin_name_temp = "app_temp.appimage"


& $command "$location\$filename" "$location\$boot_image_rprc_name_temp"

& $multicore_command  LE 0 0x400000 0 "$location\$bootimage_bin_name" 0x35510000  "$location\$boot_image_rprc_name_temp" 0xb5510000 $bss_rprc
& $crc_multi_core_image_gen "$location\$bootimage_bin_name"  "$location\$bootimage_bin_name_temp"
Remove-Item -Path "$location\$bootimage_bin_name_temp"
Remove-Item -Path "$location\$boot_image_rprc_name_temp"

