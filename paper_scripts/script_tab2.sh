#!/usr/bin/env bash

# output file (log)
OUTFILE="results_tab2.log"

: >"$OUTFILE"

# n=4, p=2^-10
echo "=== n=4, p=2^-10, ISW ===" | tee -a "$OUTFILE"
uv run aes.py -d 4 -p '2**-10' --samples='2**16' --backend=favom --prej-lim=3 --mul isw --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=4, p=2^-10, RPMult - all ===" | tee -a "$OUTFILE"
uv run aes.py -d 4 -p '2**-10' --samples='2**16' --backend=favom --prej-lim=3 --mul fullcirc --mr \
    2>&1 | tee -a "$OUTFILE"

# n=4, p=2^-14
echo "=== n=4, p=2^-14, ISW ===" | tee -a "$OUTFILE"
uv run aes.py -d 4 -p '2**-14' --samples='2**16' --backend=favom --prej-lim=3 --mul isw --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=4, p=2^-14, RPMult - all ===" | tee -a "$OUTFILE"
uv run aes.py -d 4 -p '2**-14' --samples='2**16' --backend=favom --prej-lim=3 --mul fullcirc --mr \
    2>&1 | tee -a "$OUTFILE"

# n=6, p=2^-10
echo "=== n=6, p=2^-10, ISW ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-10' --samples='2**16' --backend=favom --prej-lim=3 --mul isw --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=6, p=2^-10, RPMult - half ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-10' --samples='2**24' --backend=favom --prej-lim=3 --mul fullhalf --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=6, p=2^-10, RPMult - log/simple ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-10' --samples='2**25' --backend=favom --prej-lim=3 --mul fullsimple --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=6, p=2^-10, RPMult - circ ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-10' --samples='2**25' --backend=favom --prej-lim=3 --mul fullcirc --mr \
    2>&1 | tee -a "$OUTFILE"

# n=6, p=2^-12
echo "=== n=6, p=2^-12, ISW ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-12' --samples='2**16' --backend=favom --prej-lim=3 --mul isw --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=6, p=2^-12, RPMult - half ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-12' --samples='2**24' --backend=favom --prej-lim=3 --mul fullhalf --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=6, p=2^-12, RPMult - log/simple ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-12' --samples='2**25' --backend=favom --prej-lim=3 --mul fullsimple --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=6, p=2^-12, RPMult - circ ===" | tee -a "$OUTFILE"
uv run aes.py -d 6 -p '2**-12' --samples='2**25' --backend=favom --prej-lim=3 --mul fullcirc --mr \
    2>&1 | tee -a "$OUTFILE"

# n=8, p=2^-12
echo "=== n=8, p=2^-10, ISW ===" | tee -a "$OUTFILE"
uv run aes.py -d 8 -p '2**-10' --samples='2**19' --backend=favom --prej-lim=3 --mul isw --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=8, p=2^-10, RPMult - half ===" | tee -a "$OUTFILE"
uv run aes.py -d 8 -p '2**-10' --samples='2**23' --backend=favom --prej-lim=3 --mul fullhalf --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=8, p=2^-10, RPMult - simple ===" | tee -a "$OUTFILE"
uv run aes.py -d 8 -p '2**-10' --samples='2**23' --backend=favom --prej-lim=3 --mul fullsimple --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=8, p=2^-10, RPMult - log ===" | tee -a "$OUTFILE"
uv run aes.py -d 8 -p '2**-10' --samples='2**23' --backend=favom --prej-lim=3 --mul fullnlogn --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== n=8, p=2^-10, RPMult - circular ===" | tee -a "$OUTFILE"
uv run aes.py -d 8 -p '2**-10' --samples='2**23' --backend=favom --prej-lim=3 --mul fullcirc --mr \
    2>&1 | tee -a "$OUTFILE"

echo "=== Done. Results stored in $OUTFILE ==="
