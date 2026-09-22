#!/usr/bin/env bash
set -ex

./configure --prefix="${PREFIX}"
make all -j ${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
  make check
fi
make install
