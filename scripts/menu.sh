#!/bin/bash

PS3="Select action: "
options=(
    "Docker compose up"
    "SDK bash"
    "Quit"
)
select opt in "${options[@]}"
do
    case $REPLY in
        1)
            cd ../docker
            docker compose up -d
            ;;
        2)
            tmux send-keys -t 'app' 'cd ../docker && docker compose exec sdk bash' C-m
            ;;
        3)
            cd ../docker
            docker compose down
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done