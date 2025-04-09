#!/bin/bash

trap 'echo "force kill all process"; kill -- -$$ 2>/dev/null; exit 1' SIGINT

check() {
    local tag="$1"
    timeout 5s docker manifest inspect "$tag" 2>&1 | grep -q 'no such manifest'
    case $? in
        0)  echo "$tag ❌" ;;
        1)  echo "$tag ✔️" ;;
        124) echo "$tag ⌛ TIMEOUT" ;;
        *)  echo "$tag ⚠️  UNKNOWN ERROR" ;;
    esac
}

while IFS= read -r -d '' patch_file; do
    VERSION=$(basename "$(dirname "$patch_file")")
    COMPONENT=$(basename "$(dirname "$(dirname "$patch_file")")")
    check "ssst0n3/${COMPONENT}_dev:${VERSION}" &
done < <(find . -type f -name "apply-patch.sh" -print0)

wait
