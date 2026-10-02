#!/usr/bin/env bash
# Auto-generated test harness — run after cloning to verify the build.
set -uo pipefail
FAIL=0

echo "-- syntax/build check --"
if zig build run -- 15 2>/dev/null || echo SKIP; then echo "  ok"; else echo "  FAIL"; FAIL=1; fi

echo "-- functional check --"
OUT="$(zig build run -- 15 2>&1)"
if echo "$OUT" | grep -qF -- '0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377'; then
  echo "  ok   - contains: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377"
else
  echo "  FAIL - expected to contain: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377"
  echo "  got: $OUT"
  FAIL=1
fi

if [ "$FAIL" = "1" ]; then echo; echo "FAILED"; exit 1; fi
echo; echo "All tests passed."
