#!/usr/bin/env bash
set -e

# Install required tools and dependencies
./install-advanced-tools.sh

# Setup Python virtual environment if needed
if [ ! -d ".venv" ]; then
    ./setup-python-venv.sh
else
    source .venv/bin/activate
    pip install -r requirements.txt
fi

# Verify tool installations and offer fixes
./check_tools_updates.sh

# Launch the web interface
source .venv/bin/activate
python3 web_interface/app.py
