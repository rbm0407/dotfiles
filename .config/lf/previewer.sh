#!/bin/sh
case "$(file -Lb --mime-type -- "$1")" in
text/* | application/json | application/xml)
  bat --color=always --style=numbers "$1" 2>/dev/null || cat "$1"
  ;;
image/*)
  chafa -f sixel "$1" -s "${2}x${3}" 2>/dev/null || echo "Image preview failed"
  ;;
application/pdf)
  pdftotext "$1" - 2>/dev/null || echo "PDF text extraction failed"
  ;;
application/zip | application/x-tar | application/gzip)
  (unzip -l "$1" 2>/dev/null || tar -tvf "$1") | head -n 50
  ;;
*)
  if file "$1" | grep -q "text"; then
    bat --color=always --style=plain "$1" 2>/dev/null || cat "$1"
  else
    echo "Binary file: $(file "$1")"
    hexdump -C "$1" | head -n 20
  fi
  ;;
esac
