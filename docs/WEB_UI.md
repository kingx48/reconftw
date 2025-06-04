# WebSn1per Web Interface

This minimal interface allows you to run WebSn1per from a browser.

## Launching the UI

```bash
./run-web-ui.sh
```

The server listens on port **8000** by default. Visit `http://localhost:8000` to access the UI.

## Usage

1. Enter the target domain.
2. Optionally set a rate limit in requests per second.
3. Select a **Preset** to quickly run common scan types (recon, passive, web, all, OSWE, eWPTx).
4. (Optional) Specify a custom mode in the **Mode** field if you need something not covered by presets.
5. Click **Run** to execute the scan. Output will appear below the form when finished.

This interface is experimental and runs `websn1per.sh` under the hood.
