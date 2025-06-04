#!/usr/bin/env bash
set -e

RATE=0
MODE=""
TARGET=""
EXTRA=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    -d|--domain)
      TARGET="$2"; shift 2;;
    -r|--rate-limit)
      RATE="$2"; shift 2;;
    -m)
      MODE="$2"; shift 2;;
    *)
      EXTRA+=("$1"); shift;;
  esac
done

export WEBSN1PER_RATE_LIMIT="$RATE"
export WEBSN1PER_MODE="$MODE"

if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
fi

./reconftw.sh -w -d "$TARGET" "${EXTRA[@]}"
