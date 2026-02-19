#!/usr/bin/env bash

# output file (log)
OUTFILE="results_tab3.log"

: >"$OUTFILE"

# 2^-10
echo "=== perseus wire p=2^-10 ===" | tee -a "$OUTFILE"
uv run aes.py -d 7 -p '2**-10' --samples='2**25' --backend=favom --prej-lim=3 --mul fullhalf --wire-model --mr --fks \
    2>&1 | tee -a "$OUTFILE"

echo "=== perseus gate p=2^-10 ===" | tee -a "$OUTFILE"
uv run aes.py -d 7 -p '2**-10' --samples='2**25' --backend=favom --prej-lim=3 --mul fullhalf --mr --fks \
    2>&1 | tee -a "$OUTFILE"

# 2^-15
echo "=== perseus wire p=2^-15 ===" | tee -a "$OUTFILE"
uv run aes.py -d 4 -p '2**-10' --samples='2**19' --backend=favom --prej-lim=3 --mul fullhalf --wire-model --mr --fks \
    2>&1 | tee -a "$OUTFILE"

echo "=== perseus gate p=2^-15 ===" | tee -a "$OUTFILE"
uv run aes.py -d 4 -p '2**-10' --samples='2**16' --backend=favom --prej-lim=3 --mul fullhalf --mr --fks \
    2>&1 | tee -a "$OUTFILE"

echo "=== Done. Results stored in $OUTFILE ==="
