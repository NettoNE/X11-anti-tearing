#!/bin/bash

# Script to automate the application of anti-tearing settings on X11 (intel)

# Thanks to Dedoimedo website!
# https://www.dedoimedo.com/computers/linux-intel-graphics-video-tearing.html

clear

show_help() {
    echo "Usage: $0 -h/[-alt] [-h | --help]"  
    echo "  -alt: Apply alternative configuration for tearing issues."  
    echo "  -h, --help: Display this help message."  
    echo
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

show_cat(){
echo
echo -e "\033[38;5;57m                \`*-.                   \033[0m"
echo -e "\033[38;5;93m                 )  _\`-.                \033[0m"
echo -e "\033[38;5;57m                .  : \`. .               \033[0m"
echo -e "\033[38;5;93m                : _   '  \              \033[0m"
echo -e "\033[38;5;57m                ; *\` _.   \`*-._         \033[0m"
echo -e "\033[38;5;93m                \`-.-'          \`-.      \033[0m"
echo -e "\033[38;5;57m                  ;       \`       \`.    \033[0m"
echo -e "\033[38;5;93m                  :.       .        \   \033[0m"
echo -e "\033[38;5;57m                  . \\  .   :   .-'   .  \033[0m"
echo -e "\033[38;5;93m                  '  \`+.;  ;  '      :  \033[0m"
echo -e "\033[38;5;57m                  :  '  |    ;       ;-.\033[0m"
echo -e "\033[38;5;93m                  ; '   : :'-:     _.\`* ;\033[0m"
echo -e "\033[38;5;57m [by NettoNE]    .*' /  .*' ; .*'- +'  \`*'\033[0m"
echo -e "\033[38;5;93m               \`*-*   \`*-*  \`*-*'       \033[0m"
echo
}

show_cat

# root check
if [ "$(id -u)" -ne 0 ]; then
    echo -e "\033[91m[ERROR]\033[0m Execute with sudo" >&2  
    echo
    exit 1
fi

# check and create the configuration directory
CONF_DIR="/etc/X11/xorg.conf.d"
if [ ! -d "$CONF_DIR" ]; then
    echo -e "\033[33m[INFO]\033[0m Creating working directory..." >&2 	
    mkdir -p "$CONF_DIR" || { echo -e "\033[34m[WARNING]\033[0m Failed to create directory" >&2; exit 1; }
fi

# configuration file path
CONF_FILE="$CONF_DIR/20-intel.conf"

# alternative flag config
apply_alternative_config() {
    cat > "$CONF_FILE" <<EOF
Section "Device"
    Identifier "Intel Graphics"
    Driver "$1"
    Option "TearFree" "true"
    Option "AccelMethod" "uxa"
    Option "DRI" "3"
EndSection
EOF
    clear
    show_cat
    echo -e "\033[32m[SUCCESS]\033[0m Alternative configuration applied successfully!" >&2 
    echo
}

# check and apply alternative configuration if -alt flag was specified
if [ "$1" == "-alt" ]; then
    echo
    read -p "Enter the driver or leave blank (default: 'intel'): " DRIVER
    DRIVER=${DRIVER:-intel}
    apply_alternative_config "$DRIVER"
    exit 0
fi

# check if the default settings have already been applied
if [ -f "$CONF_FILE" ] && grep -q "TearFree" "$CONF_FILE"; then
    echo -e "\033[91m[ERROR]\033[0m Settings already applied!" >&2 
    echo 
else
    echo 
    read -p "Enter the driver or leave blank (default: 'intel'): " DRIVER
    DRIVER=${DRIVER:-intel}
    echo 'Section "Device"' > "$CONF_FILE" || { echo "Failed to create file." >&2; exit 1; }
    echo '    Identifier "Intel Graphics"' >> "$CONF_FILE"
    echo "    Driver \"$DRIVER\"" >> "$CONF_FILE"
    echo '    Option "TearFree" "true"' >> "$CONF_FILE"
    echo 'EndSection' >> "$CONF_FILE"
    clear
    show_cat
    echo -e "\033[32m[SUCCESS]\033[0m Settings applied successfully!" >&2  
    echo
fi

echo -e "\033[34m[INFO]\033[0m If tearing persists, try the alternative configuration! Use \033[1;37m-h/--help\033[0m" >&2
echo 
