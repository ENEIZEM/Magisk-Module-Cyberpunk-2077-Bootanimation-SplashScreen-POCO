**Langues**: [English](README.md) | [Русский](README.ru.md) | [Español](README.es.md) | [Français](README.fr.md) | [Português](README.pt.md) | [中文](README.zh.md)
# Cyberpunk 2077 Bootanimation et Écran d'Accueil pour POCO

Ce module Magisk remplace l'animation de démarrage par une version Cyberpunk 2077, inspirée du **OnePlus 8T Cyberpunk 2077 Edition** et redessinée pour les appareils **POCO**. Un **écran d'accueil personnalisé** est également inclus en option.

---

### Animation originale:
<table>
  <tr>
    <td><img src="images/original1.png" width="100%"/></td>
    <td><img src="images/original2.png" width="100%"/></td>
    <td><img src="images/original3.png" width="100%"/></td>
  </tr>
</table>

### Version modifiée pour POCO:
<table>
  <tr>
    <td><img src="images/custom1.png" width="100%"/></td>
    <td><img src="images/custom2.png" width="100%"/></td>
    <td><img src="images/custom3.png" width="100%"/></td>
  </tr>
</table>

---

### Compatibilité

Fonctionne avec tout appareil (pas seulement POCO) utilisant **Magisk 20.4+**, avec l'animation située dans l'un des chemins suivants :

```
/system/media/bootanimation.zip
/system/product/media/bootanimation.zip
/system/system_ext/media/bootanimation.zip
/product/media/bootanimation.zip
/vendor/media/bootanimation.zip
```

Si l'animation ne change pas sur votre appareil, [contactez-moi sur Telegram](https://t.me/ENEIZEMatic) pour que je puisse ajouter la prise en charge du répertoire d'animation de votre appareil.

---

### Installation

 1. [Téléchargez le module depuis la page des Releases](https://github.com/ENEIZEM/Magisk-Module-Cyberpunk-2077-Bootanimation-SplashScreen-POCO/releases)
 2. Ouvrez l'application Magisk
 3. Allez dans l'onglet **«Modules»** et sélectionnez le fichier `.zip` téléchargé


### Journal d'installation multilingue
Le processus d'installation affiche des messages en **français, anglais, espagnol, russe, chinois ou portugais** selon la langue de votre système.

---

### Optionnel: Écran d'accueil (Splash)
Le fichier `logo.zip` inclus (généré avec [cet outil](https://4pda.to/forum/index.php?showtopic=1023354&st=1580#entry114714184)) contient des écrans personnalisés :

 * **Écran de démarrage (logo POCO)**
 * **FASTBOOT**
 * **Avertissement de système détruit**

Tous sont adaptés au style Cyberpunk 2077.

### Originaux:
<table>
  <tr>
    <td><img src="images/splash_orig1.png" width="100%"/></td>
    <td><img src="images/splash_orig2.png" width="100%"/></td>
    <td><img src="images/splash_orig3.png" width="100%"/></td>
  </tr>
</table>

### Versions Cyberpunk:
<table>
  <tr>
    <td><img src="images/splash_custom1.png" width="100%"/></td>
    <td><img src="images/splash_custom2.png" width="100%"/></td>
    <td><img src="images/splash_custom3.png" width="100%"/></td>
  </tr>
</table>

---

> [!WARNING]
> Installing custom **Splash Screens** is recommended **only for Xiaomi phones**, since the tool to create them is specifically designed for Xiaomi devices (and even then, not all models are supported).
> Flashing a custom logo on unsupported devices can cause critical hardware failures, up to irreversible damage to the CPU and motherboard.
>
> **Supported devices:**
> - MIUI versions 12.5–14
> - Android versions 11–13
>
> **Not supported under any circumstances:**
> - Redmi Note 9, Redmi Note 9C and older
> - Redmi 9T and older
> - Mi 12, Mi 12 Pro and older
> - Xiaomi Mi 8 and older
> - Poco F4 GT and older
> - Redmi K50, Redmi K50G and older
>
> Before installing a new logo, check compatibility with the [author of the custom logo tool](https://t.me/theskyfather).

## To install custom logos (Splash, Fastboot, Destroyed system):

> 1. Reboot into **TWRP** or another custom recovery
> 2. Select **Install**
> 3. Navigate to `/data/adb/modules/Cyberpunk_2077_BA_SS/`
> 4. Choose `logo.zip` and flash it

---

### Commentaires

N'hésitez pas à me contacter si vous avez des idées d'améliorations, rencontrez des bugs ou si vous souhaitez simplement partager vos réflexions!

[Support the project financially](https://www.donationalerts.com/r/eneizematic)