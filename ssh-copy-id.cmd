@echo off
type %1 | ssh %2 "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> .ssh/authorized_keys"