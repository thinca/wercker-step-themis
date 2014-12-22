#!/bin/bash

set -eu

version="${WERCKER_THEMIS_VERSION:-master}"
test_dir="${WERCKER_THEMIS_TEST_DIR:-}"
reporter="${WERCKER_THEMIS_REPORTER:-dot}"
runtimepath="${WERCKER_THEMIS_RUNTIMEPATH:-}"
themis_dir="${WERCKER_CACHE_DIR}/${WERCKER_STEP_NAME}/themis-${version}"

cmd_args=("${themis_dir}/bin/themis" --reporter "${reporter}")
add_rtp() {
	local IFS=","
	local path
	for path in $1; do
		cmd_args+=(--runtimepath "${path}")
	done
}
add_rtp "${runtimepath}"
[[ -n "${test_dir}" ]] && cmd_args+=("${test_dir}")

if [[ ! -d "${themis_dir}" ]]; then
	mkdir -p "${themis_dir}"
	git clone "https://github.com/thinca/vim-themis" --quiet --branch "${version}" --depth 1 "${themis_dir}"
elif [[ "${version}" = "master" ]]; then
	(
		cd "${themis_dir}"
		git pull
	)
fi

cd "${WERCKER_ROOT}"
"${cmd_args[@]}"
