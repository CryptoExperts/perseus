#!/usr/bin/env bash

# output file (log)
OUTFILE="results_tab1.log"

: >"$OUTFILE"

echo "=== Command 1 ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-12' --samples='2**16' --backend=maskverif --prej-lim=3 --mul isw --mr --rounds 1 --fks \
    2>&1 | tee -a "$OUTFILE"

echo "=== Command 2 ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-12' --samples='2**16' --backend=verifmsi --prej-lim=3 --mul isw --mr --rounds 1 --fks \
    2>&1 | tee -a "$OUTFILE"

echo "=== Command 3 ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-12' --samples='2**16' --backend=favom --prej-lim=3 --mul isw --mr --rounds 1 --fks \
    2>&1 | tee -a "$OUTFILE"

echo "=== Command 4 ===" | tee -a "$OUTFILE"
NUM_THREADS=192 uv run aes.py -d 6 -p '2**-12' --samples='2**16' --backend=maskverif --prej-lim=3 --mul isw --mr --rounds 4 --fks \
    2>&1 | tee -a "$OUTFILE"

echo "=== Command 5 ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-12' --samples='2**16' --backend=favom --prej-lim=3 --mul isw --mr --rounds 4 --fks \
    2>&1 | tee -a "$OUTFILE"

echo "=== Command 6 ===" | tee -a "$OUTFILE"
NUM_THREADS=192 uv run aes.py -d 6 -p '2**-12' --samples='2**16' --backend=maskverif --prej-lim=3 --mul isw --mr --fks \
    2>&1 | tee -a "$OUTFILE"

echo "=== Command 7 ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-12' --samples='2**16' --backend=favom --prej-lim=3 --mul isw --mr --fks \
    2>&1 | tee -a "$OUTFILE"

echo "=== Command 8 ===" | tee -a "$OUTFILE"
NUM_THREADS=192 uv run aes.py -d 6 -p '2**-12' --samples='2**16' --backend=maskverif --prej-lim=3 --mul isw --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== Command 9 ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-12' --samples='2**16' --backend=favom --prej-lim=3 --mul isw --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== Done. Results stored in $OUTFILE ==="
