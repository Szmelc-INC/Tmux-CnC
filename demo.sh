#!/bin/bash

# This is demo script to show you some cool things tmux-cnc can do
# Thix example uses xdotool to stroke keys for you

if ! command -v xdotool &> /dev/null; then
    echo "xdotool could not be found, please install it."
    exit 1
fi

input_text=$(cat <<'EOF'
send 1 'htop'
send 2 'cmatrix'
send 0 'ls -aAR | figlet | lolcat -S 5 '
send 3 'cowsay moo | lolcat'
EOF
)

while IFS= read -r line; do
    xdotool type "$line"
    xdotool key Return
    sleep 0.5
done <<< "$input_text" &
wait

sleep 1

input2=$(cat <<'EOF'
stop ALL
send ALL 'clear'
focus 0
res right 10
focus 1
res down 15
focus 3
res left 10
focus 2
res up 15
focus 4
EOF
)

while IFS= read -r line; do
    xdotool type "$line"
    xdotool key Return
    sleep 0.5
done <<< "$input2" &
wait

sleep 1

input3=$(cat <<'EOF'
send 0 'htop'
send 1 'cmatrix'
send 2 'sl --help'
send 3 'top'
EOF
)

while IFS= read -r line; do
    xdotool type "$line"
    xdotool key Return
    sleep 0.5
done <<< "$input3" &
wait

sleep 1

input3=$(cat <<'EOF'
close 3
close 2
close 1
split 0 h 25
cmatrix
EOF
)

while IFS= read -r line; do
    xdotool type "$line"
    xdotool key Return
    sleep 0.5
done <<< "$input3" &
wait
