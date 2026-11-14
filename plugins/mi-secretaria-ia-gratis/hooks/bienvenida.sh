#!/bin/sh
# Aviso de Mi Secretaria IA al abrir Claude. La primera vez abre la pantalla de bienvenida.
DIR="$HOME/Documents/Mi Secretaria IA"
MARCA="$DIR/.modo-dios-activado"
RAIZ="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
if [ ! -f "$MARCA" ]; then
  mkdir -p "$DIR" 2>/dev/null
  date "+%Y-%m-%d" > "$MARCA" 2>/dev/null
  if [ "0" = "1" ]; then
    PAG="$RAIZ/skills/secretaria/bienvenida.html"
    if command -v open >/dev/null 2>&1; then open "$PAG" >/dev/null 2>&1
    elif command -v cmd.exe >/dev/null 2>&1; then
      W="$PAG"; command -v cygpath >/dev/null 2>&1 && W="$(cygpath -w "$PAG")"
      cmd.exe /c start "" "$W" >/dev/null 2>&1
    fi
  fi
  printf '%s\n' '{"systemMessage": "✅ Mi Secretaria IA (Gratis) conectada. Escribe «Secretaria, hola» para empezar. Instrucciones: https://mi-secretaria-ia.github.io/instrucciones.html"}'
else
  printf '%s\n' '{"systemMessage": "✅ Mi Secretaria IA (Gratis) lista. Empieza con «Secretaria, …»"}'
fi
exit 0
