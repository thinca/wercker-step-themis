#!/bin/bash

set -eu

run_test() {
	export WERCKER_THEMIS_VERSION="$1"
	export WERCKER_THEMIS_TEST_DIR="$2"
	export WERCKER_THEMIS_REPORTER="$3"
	export WERCKER_THEMIS_RUNTIMEPATH="$4"

	./run.sh
}

# For local test
export WERCKER_STEP_NAME="themis"
export WERCKER_ROOT
export WERCKER_CACHE_DIR
wercker_local_dir="/tmp/wercker-$$"
: "${WERCKER_STEP_NAME:="themis"}"
: "${WERCKER_ROOT:="${wercker_local_dir}/root"}"
: "${WERCKER_CACHE_DIR:="${wercker_local_dir}/cache"}"

mkdir -p "${WERCKER_ROOT}"
mkdir -p "${WERCKER_CACHE_DIR}"

WERCKER_ROOT="${WERCKER_ROOT}/themis"
git clone "https://github.com/thinca/vim-themis" --quiet --depth 1 "${WERCKER_ROOT}"

run_test ""     ""     ""     ""
run_test "v1.4" "test" ""     ""
run_test "v1.4" ""     "spec" ""
run_test ""     ""     ""     "rtp1,rtp2"

[[ -d "${wercker_local_dir}" ]] && rm -fr "${wercker_local_dir}"

true
