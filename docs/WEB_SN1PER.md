# WebSn1per Usage Guide

## Installation

```bash
./install-advanced-tools.sh
./setup-python-venv.sh
source .venv/bin/activate
```

## Verification

```bash
./check_tools_updates.sh
```

## Running WebSn1per

```bash
./websn1per.sh -d example.com -r 10
```

The `-r` or `--rate-limit` flag controls requests per second. Omit it for the default speed or adjust the value as needed.

### OSWE mode

```bash
./websn1per.sh -d example.com -m oswe
```

### eWPTx mode

```bash
./websn1per.sh -d example.com -m ewptx
```

## Updating tools

```bash
./check_tools_updates.sh
```

Rerun this command anytime to install missing tools or upgrade outdated ones.

## Web Interface

You can also run scans from a browser using the simple web UI.
Launch it with:

```bash
./run-web-ui.sh
```

See [WEB_UI.md](WEB_UI.md) for usage details and available presets.

When you finish your session, deactivate the virtual environment:

```bash
deactivate
```
