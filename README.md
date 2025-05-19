# Cyberpunk 2077 Bootanimation & Splashscreen for POCO

This Magisk module replaces the default boot animation with a Cyberpunk-style animation inspired by the **OnePlus 8T Cyberpunk 2077 Edition**, adapted specifically for **POCO**. An optional **custom splash screen** is also included.

---

### Original animation:
![Original 1](images/original1.jpg) ![Original 2](images/original2.jpg)

### Redrawn animation for POCO:
![Custom 1](images/custom1.jpg) ![Custom 2](images/custom2.jpg)

---

### Compatibility
This module works on any device running Magisk 20.4+ where the boot animation is located in one of the following paths:

```
/system/media/bootanimation.zip  
/system/product/media/bootanimation.zip  
/system/system_ext/media/bootanimation.zip  
/product/media/bootanimation.zip  
/vendor/media/bootanimation.zip  
```

If the animation isn't changed on your device, [contact me on Telegram](https://t.me/mbczqetuo) so I can add support for your path.

---

### Multilingual Installer Log
The installer shows logs in **English, Russian, Spanish, French, Chinese, or Portuguese**, based on your system language.

---

### Optional: Splash Screen
The module includes a `logo.zip` archive (generated with [this tool](https://4pda.to/forum/index.php?showtopic=1023354&st=1580#entry114714184)) containing:

 -**Splash (POCO logo)**
 -**FASTBOOT**
 -**Destroyed system warning**

All screens are redrawn in Cyberpunk 2077 style.

### Original Screens:
![Original Splash 1](images/splash_orig1.jpg) ![Original Splash 2](images/splash_orig2.jpg) ![Original Splash 3](images/splash_orig3.jpg)

### Cyberpunk Screens:
![Cyberpunk Splash 1](images/splash_custom1.jpg) ![Cyberpunk Splash 2](images/splash_custom2.jpg) ![Cyberpunk Splash 3](images/splash_custom3.jpg)

---

### Installation

 1. [Download the module from Releases](https://github.com/ENEIZEM/Magisk-Module-Cyberpunk-2077-Bootanimation-SplashScreen-POCO/releases)
 2. Open the Magisk app
 3. Go to the **Modules** tab and select the downloaded `.zip` file

---

### IMPORTANT: Installing the Splash Screen

⚠️ Installing custom splash screens is only recommended for **Xiaomi phones**, as the tool used to create them is specifically designed for Xiaomi devices (and even then, not all models are supported).
Tested on **POCO F4 GT** and **Redmi Note 12 Turbo (POCO F5)**.

To flash the custom Cyberpunk splash images:

 1. Reboot into **TWRP** or another custom recovery
 2. Tap **Install**
 3. Navigate to ```/data/adb/modules/Cyberpunk_2077_BA_SS/```
 4. Select `logo.zip` and flash it

