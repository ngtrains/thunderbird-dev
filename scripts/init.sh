#!/bin/bash
session='thunderbird-dev'
PROJECT_ROOT='~/Sources/thunderbird-dev'


export SDK_ASP=$(cat <<END
    cd /source/chat/asp
    dotnet publish -c Release -o /chat/asp 
END
)

export RUNTIME_ASP=$(cat <<END
    cd /app/chat/asp && dotnet chat-asp.dll
END
)

export SDK_CHAT=$(cat <<END
    cd /source/chat
    dotnet publish -c Release
END
)

export SDK_WCF=$(cat <<END
    cd /source/chat/wcf
    dotnet publish -c Release -o /chat/wcf
END
)

export RUNTIME_WCF=$(cat <<END
    cd /app/chat/wcf && dotnet chat-wcf.dll
END
)



tmux new-session -d -s $session
#tmux setenv PROJECT_ROOT $PROJECT_ROOT

tmux rename-window -t 0 'git'
tmux send-keys -t 'git' "cd $PROJECT_ROOT" C-m

tmux new-window -t $session:1 -n 'scripts'
tmux send-keys -t 'scripts' "cd $PROJECT_ROOT/scripts && ./menu.sh" C-m

tmux new-window -t $session:2 -n 'app'
tmux send-keys -t 'app' "cd $PROJECT_ROOT/docker" C-m

tmux attach -t $session:1