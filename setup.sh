#!/bin/sh
# No-op setup: main.ts uses Node stdlib only. Nothing to install.
# Requires Node 22+.
set -e
node --version
echo "setup ok: no dependencies"
