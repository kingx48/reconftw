# WebSn1per

WebSn1per is a web-application oriented fork of [ReconFTW](https://github.com/six2dez/reconftw). It removes network scanning capabilities and focuses entirely on advanced web reconnaissance and testing.

## Features

- **Single installer** – `install-advanced-tools.sh` installs all required packages and Go based tools.
- **Verification script** – `check_tools_updates.sh` detects missing or outdated tools and offers to fix them.
- **Isolated Python environment** – `setup-python-venv.sh` creates `.venv` and installs Python dependencies.
- **Rate limiting** – `-r` or `--rate-limit` flag throttles requests per second for ffuf, httpx and nuclei.
- **Optional web interface** – run scans from a browser with `run-web-ui.sh`.

## Quick Start

```bash
./install-advanced-tools.sh
./setup-python-venv.sh
source .venv/bin/activate
./check_tools_updates.sh
```

Run a basic scan:

```bash
./websn1per.sh -d example.com -r 10
```

### OSWE mode

```bash
./websn1per.sh -d example.com -m oswe
```

### eWPTx mode

```bash
./websn1per.sh -d example.com -m ewptx
```

## Web Interface

Launch the browser interface and follow the on‑screen form:

```bash
./run-web-ui.sh
```

Visit `http://localhost:8000` to access the UI.

## Updating Tools

```bash
./check_tools_updates.sh
```

Run the verification script at any time to install missing tools or upgrade outdated ones.

## Deactivation

```bash
deactivate
```

## Disclaimer

Usage of this program for attacking targets without consent is illegal. It is the user\'s responsibility to comply with all applicable laws. The developer assumes no liability for misuse or damage.
