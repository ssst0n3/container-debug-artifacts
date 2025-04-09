#!/bin/bash

trap 'echo "force kill all process"; kill -- -$$ 2>/dev/null; exit 1' SIGINT

check() {
    local tag="$1"
    local output
    output=$(timeout 10s docker manifest inspect "$tag" 2>&1)
    local exit_code=$?

    if [[ $exit_code -eq 124 ]]; then
        echo "$tag ⌛ TIMEOUT"
        return
    fi

    if [[ $exit_code -eq 0 ]]; then
        echo "$tag ✔️"
    else
        case $output in
            *"no such manifest"* | *"manifest unknown"*)
                echo "$tag ❌ NOT EXISTS" ;;
            *)
                echo "$tag ⚠️ UNKNOWN ERROR: ${output:0:200}" ;;
        esac
    fi
}

while IFS= read -r -d '' patch_file; do
    VERSION=$(basename "$(dirname "$patch_file")")
    COMPONENT=$(basename "$(dirname "$(dirname "$patch_file")")")
    check "ssst0n3/${COMPONENT}_dev:${VERSION}" &
done < <(find . -type f -name "apply-patch.sh" -print0)

wait
