#!/sbin/sh

# Grant the NH app permissions just in case something went wrong in the flashing stage / or after updating app to latest version
# Credit: https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-project/-/blob/master/nethunter-installer/update/tools/nh_perm.sh
pm grant -g com.offsec.nethunter android.permission.INTERNET
pm grant -g com.offsec.nethunter android.permission.ACCESS_WIFI_STATE
pm grant -g com.offsec.nethunter android.permission.CHANGE_WIFI_STATE
pm grant -g com.offsec.nethunter android.permission.READ_EXTERNAL_STORAGE
pm grant -g com.offsec.nethunter android.permission.WRITE_EXTERNAL_STORAGE
pm grant -g com.offsec.nethunter com.offsec.nhterm.permission.RUN_SCRIPT
pm grant -g com.offsec.nethunter com.offsec.nhterm.permission.RUN_SCRIPT_SU
pm grant -g com.offsec.nethunter com.offsec.nhterm.permission.RUN_SCRIPT_NH
pm grant -g com.offsec.nethunter com.offsec.nhterm.permission.RUN_SCRIPT_NH_LOGIN
pm grant -g com.offsec.nethunter android.permission.RECEIVE_BOOT_COMPLETED
pm grant -g com.offsec.nethunter android.permission.WAKE_LOCK
pm grant -g com.offsec.nethunter android.permission.VIBRATE
pm grant -g com.offsec.nethunter android.permission.FOREGROUND_SERVICE

# Install applications I usually use
echo "Do you want to automatically install all of the apps you normally use: y/n"
read -r arg

# TODO: Add a way to get the latest release of each app
if [ "$arg" = "y" ]; then
  wget -O DriveDroid.apk https://store.nethunter.com/repo/com.softwarebakery.drivedroid_105000.apk
  pm install DriveDroid.apk
  rm DriveDroid.apk

  wget -O HIDKeyboard.apk https://store.nethunter.com/repo/remote.hid.keyboard.client_116.apk
  pm install HIDKeyboard.apk
  rm HIDKeyboard.apk

  wget -O WigleWifi.apk https://store.nethunter.com/repo/net.wigle.wigleandroid_253.apk
  pm install WigleWifi.apk
  rm WigleWifi.apk

  wget -O Rucky.apk https://store.nethunter.com/repo/com.mayank.rucky_21.apk
  pm install Rucky.apk
  rm Rucky.apk

  wget -O OpenVPN.apk https://store.nethunter.com/repo/de.blinkt.openvpn_168.apk
  pm install OpenVPN.apk]
  rm OpenVPN.apk

  wget -O SDR-Driver.apk https://store.nethunter.com/repo/marto.rtl_tcp_andro_24.apk
  pm install SDR-Driver.apk
  rm SDR-Driver.apk

  wget -O SDR-Analyzer.apk https://store.nethunter.com/repo/com.mantz_it.rfanalyzer_1303.apk
  pm install SDR-Analyzer.apk
  rm SDR-Analyzer.apk

  wget -O NFCTagMaker.apk https://seal.ics.uci.edu/projects/droid_arch_jss/FDroid/pl.net.szafraniec.NFCTagmaker_15.apk
  pm install NFCTagMaker.apk
  rm NFCTagMaker.apk

  wget -O NFCKey.apk https://seal.ics.uci.edu/projects/droid_arch_jss/FDroid/pl.net.szafraniec.NFCKey_21.apk
  pm install NFCKey.apk
  rm NFCKey.apk
fi

