#!/bin/sh
# Test sederhana: halaman harus ada, punya judul, dan menyebut versi vX.Y.Z.
set -eu

gagal() { echo "GAGAL: $1" >&2; exit 1; }

[ -f site/index.html ] || gagal "site/index.html tidak ada"
grep -q '<title>' site/index.html || gagal "site/index.html tidak punya <title>"

versi=$(grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' site/index.html | head -n 1 || true)
[ -n "$versi" ] || gagal "site/index.html harus menyebut versi, contoh: v1.0.0"

echo "OK: semua cek lolos, versi $versi"