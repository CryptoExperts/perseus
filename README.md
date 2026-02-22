# PERSEUS

Verification tool for random probing security, for circuits composed of SNI gadgets.

## Dependencies

The tool is partially written in Rust, the toolchain needs to be be [installed](https://rust-lang.org/tools/install) (tested version: 1.93.0).

The remaining part of the tool is implemented in Python, we provide
configuration for automatic management of the dependencies and compilation of
the Rust code with the [uv tool](https://docs.astral.sh/uv/getting-started/installation/)
(tested version: 0.9.4).

### Backend

PERSEUS provides three backends to evaluate the simulatability of tuples:
- **`favom` (built-in)**: a home-grown backend for fast verification of masking. No extra setup beyond PERSEUS.
- **`maskverif` (custom fork)**:  build the custom branch and make the binary available on your `PATH`:
  - Source: <https://github.com/cassiersg/maskverif/tree/verif_single_tuple> (** branch:** `verif_single_tuple`, commit `6b6c5fdb351bdc00d0fb1bcfffc7794b13d78bd1`)
  - Recommended build:
    ```bash
    git clone -b verif_single_tuple https://github.com/cassiersg/maskverif.git
    cd maskverif
    nix-shell        # optional but recommended: provides a consistent OCaml toolchain
    dune build
    # make the freshly built binary available (run this before running PERSEUS, not in the nix-shell)
    export PATH="$PWD:$PATH"
    ```
- **`verifMSI`**: extracted from the verifMSI tool and installed automatically via `uv` alongside PERSEUS; no manual steps required.

## Getting started

```sh
uv run aes.py --help
```

For example
```sh
uv run aes.py -d 8 -p '2**-10' --samples='2**12' --backend=favom --e-samples='2**14' --prej-lim=3
```

- 10 AES rounds with a AES-128 key schedule
- computes for 8 shares
- uses the gate leakage model with gate leakage probability `2**-10`
- Uses `2**12` Monte Carlo samples with the FAVOM verification backend
- For SNI verification failure, uses the best of `2**14` Monte-Carlo samples and inclusion-exclusion up to size 3.

**Changing the number of cores used** Set the `RAYON_NUM_THREADS` variable to the number of desired threads.

## Reproducing results from the Eurocrypt 2026 paper

Bash scripts that generate the results reported in the 3 tables of the paper are provided in `paper_scripts/`. These assume that `uv` is installed, and (for `script_tab1.sh`) that maskverif is available in `PATH` (see above). The printed outputs (also written to `.log` files) are the results reported in the tables.
Given the fairly long execution time of the whole scripts, it is suggested that readers interested in only selected results copy the command lines from the scripts directly into their shell.

### Code structure

Main files:
- `pyproject.toml`, `uv.lock`: python package configuration
- `aes.py` top-level script for evaluating the security of a masked AES implementation with PERSEUS
- `backend*.py`, `sp_line_pool.py`: interaction with the verification backends (see above)
- `gadget_graph.py`, `graph_inequality.py`, `proba_sim_ie.py`: core PERSEUS algorithms
- `gadget.py`, `gates.py`, `circuit_aes.py`: description of the logic gates, gadgets and AES circuit.
- `sanity_check_gagets.py`, `chi.py`: test files, not used for the final results
- `rbackend`: Rust crate implementing the `favom` backend.

In archived versions of the paper artifact, a copy of the relevant `maskverif`
and `verifMSI` version are also provided (for archival) under `dependencies`.
Using them necessitates an update to `pyproject.toml`.

