**Idiomas**: [English](README.md) | [Русский](README.ru.md) | [Español](README.es.md) | [Français](README.fr.md) | [Português](README.pt.md) | [中文](README.zh.md)
# Animação de Inicialização e Tela Splash do Cyberpunk 2077 para POCO

Este módulo Magisk substitui a animação padrão por uma versão no estilo Cyberpunk 2077, inspirada no **OnePlus 8T Edição Cyberpunk 2077** e adaptada para dispositivos **POCO**. Inclui também uma tela splash personalizada opcional.

---

### Animação original:
<table>
  <tr>
    <td><img src="images/original1.png" width="100%"/></td>
    <td><img src="images/original2.png" width="100%"/></td>
    <td><img src="images/original3.png" width="100%"/></td>
  </tr>
</table>

### Versão redesenhada para POCO:
<table>
  <tr>
    <td><img src="images/custom1.png" width="100%"/></td>
    <td><img src="images/custom2.png" width="100%"/></td>
    <td><img src="images/custom3.png" width="100%"/></td>
  </tr>
</table>

---

### Compatibilidade

Compatível com qualquer dispositivo (não apenas POCO) com **Magisk 20.4+** e bootanimation em um dos seguintes caminhos:

```
/system/media/bootanimation.zip
/system/product/media/bootanimation.zip
/system/system_ext/media/bootanimation.zip
/product/media/bootanimation.zip
/vendor/media/bootanimation.zip
```

Se nada mudou, [fale comigo no Telegram](https://t.me/mbczqetuo) para que eu possa adicionar suporte ao diretório de animação do seu dispositivo.

---

### Como instalar

 1. [Baixe o módulo pela página de Releases](https://github.com/ENEIZEM/Magisk-Module-Cyberpunk-2077-Bootanimation-SplashScreen-POCO/releases)
 2. Abra o aplicativo Magisk
 3. Vá até a aba **“Módulos”** e selecione o arquivo `.zip` baixado

### Instalação com suporte multilíngue

Durante a instalação, as mensagens aparecerão em **português, inglês, espanhol, francês, russo ou chinês**, dependendo do idioma do sistema.

---

### Splash Screen (opcional)
O arquivo `logo.zip` incluído (gerado com [essa ferramenta](https://4pda.to/forum/index.php?showtopic=1023354&st=1580#entry114714184)) contém:

 * **Tela de boot (logo POCO)**
 * **FASTBOOT**
 * **Sistema destruído**

Todos redesenhados no estilo Cyberpunk 2077.

### Telas originais:
<table>
  <tr>
    <td><img src="images/splash_orig1.png" width="100%"/></td>
    <td><img src="images/splash_orig2.png" width="100%"/></td>
    <td><img src="images/splash_orig3.png" width="100%"/></td>
  </tr>
</table>

### Telas Cyberpunk:
<table>
  <tr>
    <td><img src="images/splash_custom1.png" width="100%"/></td>
    <td><img src="images/splash_custom2.png" width="100%"/></td>
    <td><img src="images/splash_custom3.png" width="100%"/></td>
  </tr>
</table>

---

### IMPORTANTE: Como instalar a Splash Screen

⚠️ A instalação de **telas splash** personalizadas é recomendada apenas para **telefones Xiaomi**, pois a ferramenta usada para criá-las é projetada especificamente para dispositivos Xiaomi (e mesmo assim, nem todos os modelos são suportados).
Testado no **POCO F4 GT** e **Redmi Note 12 Turbo (POCO F5)**.

Para flashear as imagens personalizadas do Cyberpunk splash:

 1. Reinicie em **TWRP** ou outro recovery personalizado
 2. Vá em **«Instalar»**
 3. Acesse o caminho: `/data/adb/modules/Cyberpunk_2077_BA_SS/`
 4. Selecione `logo.zip` e instale.

---

### Feedback
Sinta-se à vontade para entrar em contato se tiver ideias para melhorias, encontrar algum bug ou apenas quiser compartilhar seus pensamentos!