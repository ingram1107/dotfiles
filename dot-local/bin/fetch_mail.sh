#!/bin/sh

if [ -f "${XDG_CONFIG_HOME}/gnupg/gpg-agent-info" ]; then
  . "${XDG_CONFIG_HOME}/gnupg/gpg-agent-info"
  export GPG_AGENT_INFO
fi

mbsync -Va -c ${XDG_CONFIG_HOME}/isync/mbsyncrc
