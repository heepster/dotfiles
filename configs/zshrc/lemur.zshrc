alias e-mon-off="xrandr --output eDP-1 --off"
alias powersave="echo \"powersave\" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"
alias performance="echo \"performance\" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"
