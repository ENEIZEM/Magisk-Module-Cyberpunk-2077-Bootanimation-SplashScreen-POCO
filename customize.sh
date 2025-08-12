#!/system/bin/sh

[ -z "$MODDIR" ] && MODDIR="$MODPATH"

# ===== ЯЗЫК УСТРОЙСТВА =====
LANG_CODE=$(getprop persist.sys.locale | cut -d '-' -f 1)

# ===== ФУНКЦИИ =====

print_title() {
  case $LANG_CODE in
    ru) TITLE="Установка кастомной анимации загрузки" ;;
    es) TITLE="Instalación de animación de arranque personalizada" ;;
    zh) TITLE="安装自定义启动动画" ;;
    fr) TITLE="Installation de l’animation de démarrage personnalisée" ;;
    pt) TITLE="Instalação da animação de inicialização personalizada" ;;
    *)  TITLE="Installing custom boot animation" ;;
  esac

  echo ""
  echo "==================================================="
  echo "  $TITLE"
  echo "==================================================="
  echo ""
}

print_msg() {
  case $LANG_CODE in
    ru) echo "$1" ;;
    es) echo "$2" ;;
    zh) echo "$3" ;;
    fr) echo "$4" ;;
    pt) echo "$5" ;;
    *)  echo "$6" ;;
  esac
}

# ===== ПЕРЕВОДЫ =====

msg_check_ru="-- Проверка:"
msg_check_es="-- Comprobando:"
msg_check_zh="-- 正在检查："
msg_check_fr="-- Vérification :"
msg_check_pt="-- Verificando:"
msg_check_en="-- Checking:"

msg_found_ru="✓ Найден существующий bootanimation.zip"
msg_found_es="✓ Bootanimation.zip existente encontrado"
msg_found_zh="✓ 找到现有的 bootanimation.zip"
msg_found_fr="✓ Bootanimation.zip existant trouvé"
msg_found_pt="✓ Bootanimation.zip existente encontrado"
msg_found="✓ Found existing system bootanimation.zip"

msg_not_found_ru="✗ Не найдено"
msg_not_found_es="✗ No encontrado"
msg_not_found_zh="✗ 未找到"
msg_not_found_fr="✗ Non trouvé"
msg_not_found_pt="✗ Não encontrado"
msg_not_found="✗ Not found"

msg_replace_success_ru="✓ Успешно заменен bootanimation.zip"
msg_replace_success_es="✓ Bootanimation.zip reemplazado correctamente"
msg_replace_success_zh="✓ 成功替换 bootanimation.zip"
msg_replace_success_fr="✓ Bootanimation.zip remplacé avec succès"
msg_replace_success_pt="✓ Bootanimation.zip substituído com sucesso"
msg_replace_success="✓ Successfully overlaid bootanimation.zip"

msg_replace_error_ru="!! ОШИБКА: Несоответствие размеров после замены"
msg_replace_error_es="!! ERROR: No hay coincidencia de tamaño después de la copia"
msg_replace_error_zh="!! 错误: 替换后文件大小不匹配"
msg_replace_error_fr="!! ERREUR: Incompatibilité de taille après la copie"
msg_replace_error_pt="!! ERRO: Desajuste de tamanho após a cópia"
msg_replace_error="!! ERROR: Size mismatch after copy to"

msg_no_changes_ru="!! Не найдено существующего bootanimation.zip в системных папках"
msg_no_changes_es="!! No se encontró bootanimation.zip en las ubicaciones del sistema"
msg_no_changes_zh="!! 在系统位置未找到现有的 bootanimation.zip"
msg_no_changes_fr="!! Aucune bootanimation.zip existante trouvée dans les emplacements du système"
msg_no_changes_pt="!! Nenhum bootanimation.zip existente encontrado nas localizações do sistema"
msg_no_changes="!! No existing bootanimation.zip found in system locations"

msg_done_ru=">> Замена bootanimation.zip завершена"
msg_done_es=">> Reemplazo de bootanimation.zip completado"
msg_done_zh=">> bootanimation.zip 替换完成"
msg_done_fr=">> Remplacement de bootanimation.zip terminé"
msg_done_pt=">> Substituição de bootanimation.zip concluída"
msg_done=">> Bootanimation Replacer completed"

# ===== НАЧАЛО =====

print_title

MOD_BOOTANIM="$MODPATH/bootanimation.zip"
[ ! -f "$MOD_BOOTANIM" ] && print_msg "$msg_no_changes_ru" "$msg_no_changes_es" "$msg_no_changes_zh" "$msg_no_changes_fr" "$msg_no_changes_pt" "$msg_no_changes" && abort

MOD_BOOTANIM_SIZE=$(stat -c %s "$MOD_BOOTANIM")

BOOTANIM_PATHS="
/system/media/bootanimation.zip
/system/product/media/bootanimation.zip
/system/system_ext/media/bootanimation.zip
/product/media/bootanimation.zip
/vendor/media/bootanimation.zip
"

FOUND=0
for TARGET in $BOOTANIM_PATHS; do
  DIR=$(dirname "$TARGET")
  print_msg "$msg_check_ru $TARGET" "$msg_check_es $TARGET" "$msg_check_zh $TARGET" "$msg_check_fr $TARGET" "$msg_check_pt $TARGET" "$msg_check_en $TARGET"

  if [ -f "$TARGET" ]; then
    print_msg "$msg_found_ru" "$msg_found_es" "$msg_found_zh" "$msg_found_fr" "$msg_found_pt" "$msg_found"
    mkdir -p "$MODPATH$DIR"
    cp -af "$MOD_BOOTANIM" "$MODPATH$TARGET"

    RESULT_SIZE=$(stat -c %s "$MODPATH$TARGET")
    if [ "$RESULT_SIZE" = "$MOD_BOOTANIM_SIZE" ]; then
      print_msg "$msg_replace_success_ru" "$msg_replace_success_es" "$msg_replace_success_zh" "$msg_replace_success_fr" "$msg_replace_success_pt" "$msg_replace_success"
    else
      print_msg "$msg_replace_error_ru" "$msg_replace_error_es" "$msg_replace_error_zh" "$msg_replace_error_fr" "$msg_replace_error_pt" "$msg_replace_error"
    fi

    FOUND=1
  else
    print_msg "$msg_not_found_ru" "$msg_not_found_es" "$msg_not_found_zh" "$msg_not_found_fr" "$msg_not_found_pt" "$msg_not_found"
  fi

  echo ""
done

if [ "$FOUND" -eq 0 ]; then
  print_msg "$msg_no_changes_ru" "$msg_no_changes_es" "$msg_no_changes_zh" "$msg_no_changes_fr" "$msg_no_changes_pt" "$msg_no_changes"
else
  print_msg "$msg_done_ru" "$msg_done_es" "$msg_done_zh" "$msg_done_fr" "$msg_done_pt" "$msg_done"
  echo ""
fi

# Удаляем исходный bootanimation.zip после копирования
rm -f "$MOD_BOOTANIM"

# ===== logo.zip =====

LOGO_SRC="$MODPATH/logo.zip"

msg_logo_copy_ru="✓ Файл logo.zip сохранён в корне модуля"
msg_logo_copy_es="✓ Archivo logo.zip guardado en la raíz del módulo"
msg_logo_copy_zh="✓ logo.zip 已保存到模块根目录"
msg_logo_copy_fr="✓ Fichier logo.zip enregistré à la racine du module"
msg_logo_copy_pt="✓ Arquivo logo.zip salvo na raiz do módulo"
msg_logo_copy_en="✓ logo.zip saved in module root"

msg_logo_instr_ru="                       ВАЖНО:
Если вы хотите также установить экран загрузки в
стиле Cyberpunk на свой POCO, перезагрузитесь в
TWRP или другое кастомное рекавери, выберите
      пункт \"Установка\", перейдите по пути:
      /data/adb/modules/Cyberpunk_2077_BA_SS/
      и выберите файл logo.zip для прошивки.

⚠️ ПРЕДУПРЕЖДЕНИЕ: Данное предупреждение
касается исключительно замены splash screen
(logo.zip). Замена bootanimation.zip не оказывает
негативного воздействия на устройство.

Автор модуля снимает с себя всю ответственность
за любые возможные неисправности, повреждения
программного или аппаратного обеспечения,
включая полную неработоспособность системы.

Установка лого на устройство, не входящее в
список совместимых, может привести к критическим
аппаратным сбоям, вплоть до необратимого выхода
из строя центрального процессора и материнской
платы смартфона.

Поддерживаемые устройства:
- MIUI 12.5–14 версии
- Android 11–13 версии

Даже при соответствии указанным требованиям,
перепрошивку (замену) лого не поддерживают:
1. Redmi Note 9, Redmi Note 9C и старше
2. Redmi 9T и старше
3. Mi 12, Mi 12 Pro и старше
4. Xiaomi Mi 8 и старше
5. Poco F4 GT и старше
6. Redmi K50, Redmi K50G и старше

Перед установкой нового лого уточните
совместимость у автора по созданию
кастомных лого:
Telegram: @theskyfather

Автор Magisk-модуля: @mbczqetuo"

msg_logo_instr_es="                       IMPORTANTE:
Si también desea instalar la pantalla de inicio
estilo Cyberpunk en su POCO, reinicie en
TWRP u otra recuperación personalizada, seleccione
      'Instalar', navegue a:
      /data/adb/modules/Cyberpunk_2077_BA_SS/
      y elija el archivo logo.zip para flashear.

⚠️ ADVERTENCIA: Esta advertencia se refiere
únicamente a la sustitución de la pantalla de arranque
(logo.zip). La sustitución de bootanimation.zip no
afecta negativamente al dispositivo.

El autor del módulo no se responsabiliza por
ningún fallo, daño de software o hardware,
incluyendo la completa inutilización del sistema.

Instalar el logo en un dispositivo no compatible
puede causar fallos críticos de hardware,
incluyendo daños irreversibles en la CPU y placa madre.

Dispositivos compatibles:
- MIUI versión 12.5–14
- Android versión 11–13

Incluso cumpliendo los requisitos anteriores,
la sustitución del logo no se soporta en:
1. Redmi Note 9, Redmi Note 9C y anteriores
2. Redmi 9T y anteriores
3. Mi 12, Mi 12 Pro y anteriores
4. Xiaomi Mi 8 y anteriores
5. Poco F4 GT y anteriores
6. Redmi K50, Redmi K50G y anteriores

Consulte la compatibilidad con el autor
de los logos personalizados antes de instalar:
Telegram: @theskyfather

Autor del módulo Magisk: @mbczqetuo"

msg_logo_instr_zh="                       重要提示：
如果您还想在您的 POCO 上安装赛博朋克风格的
启动画面，请重启进入 TWRP 或其他自定义
恢复，选择“安装”，导航到：
      /data/adb/modules/Cyberpunk_2077_BA_SS/
      并选择 logo.zip 文件进行刷入。

⚠️ 警告：此警告仅针对替换启动画面
（logo.zip）。替换 bootanimation.zip 不会对
设备产生负面影响。

模块作者对任何可能出现的软件或硬件
故障概不负责，包括系统完全无法使用。

在不兼容设备上安装启动画面可能导致
严重硬件故障，甚至导致 CPU 和主板
不可逆损坏。

支持设备：
- MIUI 12.5–14 版本
- Android 11–13 版本

即使满足上述条件，以下设备不支持替换启动画面：
1. Redmi Note 9, Redmi Note 9C 及更早型号
2. Redmi 9T 及更早型号
3. Mi 12, Mi 12 Pro 及更早型号
4. Xiaomi Mi 8 及更早型号
5. Poco F4 GT 及更早型号
6. Redmi K50, Redmi K50G 及更早型号

安装前请向自定义启动画面作者
确认兼容性：
Telegram: @theskyfather

Magisk 模块作者: @mbczqetuo"

msg_logo_instr_fr="                       IMPORTANT :
Si vous souhaitez également installer l'écran de
démarrage style Cyberpunk sur votre POCO,
redémarrez en TWRP ou autre recovery personnalisé,
sélectionnez 'Installation', naviguez vers :
      /data/adb/modules/Cyberpunk_2077_BA_SS/
      et choisissez le fichier logo.zip à flasher.

⚠️ AVERTISSEMENT : Cet avertissement concerne
exclusivement le remplacement de l'écran de démarrage
(logo.zip). Le remplacement de bootanimation.zip
n'a aucun impact négatif sur l'appareil.

L'auteur du module décline toute responsabilité
en cas de dysfonctionnements, dommages logiciels ou
matériels, y compris une panne complète du système.

L'installation du logo sur un appareil non compatible
peut entraîner des pannes matérielles critiques,
jusqu'à la défaillance irréversible du processeur
et de la carte mère.

Appareils compatibles :
- Versions MIUI 12.5–14
- Versions Android 11–13

Même si les exigences sont remplies,
le flash du logo n'est pas supporté sur :
1. Redmi Note 9, Redmi Note 9C et antérieurs
2. Redmi 9T et antérieurs
3. Mi 12, Mi 12 Pro et antérieurs
4. Xiaomi Mi 8 et antérieurs
5. Poco F4 GT et antérieurs
6. Redmi K50, Redmi K50G et antérieurs

Veuillez vérifier la compatibilité avec
l'auteur des logos personnalisés avant l'installation :
Telegram : @theskyfather

Auteur du module Magisk : @mbczqetuo"

msg_logo_instr_pt="                       IMPORTANTE:
Se também desejar instalar a tela de boot
estilo Cyberpunk no seu POCO, reinicie em
TWRP ou outro recovery personalizado, selecione
      'Instalar', navegue até:
      /data/adb/modules/Cyberpunk_2077_BA_SS/
      e escolha o arquivo logo.zip para flashar.

⚠️ AVISO: Este aviso refere-se apenas à substituição
da tela de splash (logo.zip). A substituição do
bootanimation.zip não afeta negativamente o dispositivo.

O autor do módulo isenta-se de qualquer responsabilidade
por falhas, danos de software ou hardware,
incluindo a completa inutilização do sistema.

Instalar o logo em dispositivo não compatível pode
causar falhas críticas de hardware,
incluindo danos irreversíveis à CPU e placa-mãe.

Dispositivos suportados:
- Versões MIUI 12.5–14
- Versões Android 11–13

Mesmo cumprindo os requisitos, o flash do logo
não é suportado em:
1. Redmi Note 9, Redmi Note 9C e anteriores
2. Redmi 9T e anteriores
3. Mi 12, Mi 12 Pro e anteriores
4. Xiaomi Mi 8 e anteriores
5. Poco F4 GT e anteriores
6. Redmi K50, Redmi K50G e anteriores

Consulte a compatibilidade com o autor
dos logos personalizados antes da instalação:
Telegram: @theskyfather

Autor do módulo Magisk: @mbczqetuo"

msg_logo_instr_en="                       IMPORTANT:
If you also want to install the Cyberpunk style
boot screen on your POCO, reboot into TWRP or
another custom recovery, select
      'Install', navigate to:
      /data/adb/modules/Cyberpunk_2077_BA_SS/
      and select the logo.zip file to flash.

⚠️ WARNING: This warning applies only to the splash
screen replacement (logo.zip). Replacing
bootanimation.zip does not negatively affect the device.

The module author disclaims all responsibility for
any malfunctions, software or hardware damage,
including complete system failure.

Installing the logo on unsupported devices may cause
critical hardware failures, up to irreversible damage
to the CPU and motherboard.

Supported devices:
- MIUI versions 12.5–14
- Android versions 11–13

Even if requirements are met,
logo flashing is not supported on:
1. Redmi Note 9, Redmi Note 9C and older
2. Redmi 9T and older
3. Mi 12, Mi 12 Pro and older
4. Xiaomi Mi 8 and older
5. Poco F4 GT and older
6. Redmi K50, Redmi K50G and older

Please check compatibility with the author
of custom logos before installing:
Telegram: @theskyfather

Magisk module author: @mbczqetuo"

print_multiline_msg() {
  case $LANG_CODE in
    ru) echo "$msg_logo_instr_ru" ;;
    es) echo "$msg_logo_instr_es" ;;
    zh) echo "$msg_logo_instr_zh" ;;
    fr) echo "$msg_logo_instr_fr" ;;
    pt) echo "$msg_logo_instr_pt" ;;
    *)  echo "$msg_logo_instr_en" ;;
  esac
}

if [ -f "$LOGO_SRC" ]; then
  print_msg "$msg_logo_copy_ru" "$msg_logo_copy_es" "$msg_logo_copy_zh" "$msg_logo_copy_fr" "$msg_logo_copy_pt" "$msg_logo_copy_en"
  echo ""
  echo "==================================================="
  print_multiline_msg
  echo "==================================================="
  echo ""
  echo ""
fi

set_perm_recursive $MODPATH 0 0 0755 0644