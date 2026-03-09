#!/usr/bin/env bash
# Generates i18n YAML translation files for shadcn_ui using Claude Haiku.
# Usage: bash scripts/generate_translations.sh

set -euo pipefail

I18N_DIR="lib/src/i18n"

# 81 base language codes (MaterialLocalizations, excluding 'en' which is the base)
LANGUAGES=(
  af am ar as az be bg bn bo bs
  ca cs cy da de el es et eu fa
  fi fil fr ga gl gsw gu he hi hr
  hu hy id is it ja ka kk km kn
  ko ky lo lt lv mk ml mn mr ms
  my nb ne nl no or pa pl ps pt
  ro ru si sk sl sq sr sv sw ta
  te th tl tr ug uk ur uz vi zh zu
)

STRINGS=$(cat <<'YAML'
timePicker:
  hours: "Hours"
  minutes: "Minutes"
  seconds: "Seconds"
  period: "Period"
  periodPlaceholder: "AM"
datePicker:
  selectDate: "Select date"
input:
  cut: "Cut"
  copy: "Copy"
  paste: "Paste"
  selectAll: "Select All"
keyboardToolbar:
  done: "Done"
YAML
)

# Process in batches of 15 to keep responses manageable
batch_translate() {
  local langs=("$@")
  local lang_list
  lang_list=$(printf '"%s", ' "${langs[@]}")
  lang_list="${lang_list%, }"

  local prompt
  prompt=$(cat <<PROMPT
Translate the following UI strings into these languages: ${lang_list}.

Source strings (English):
${STRINGS}

Rules:
- Output ONLY a JSON object. No markdown, no explanation.
- Top-level keys are the language codes exactly as given.
- Each language object has the same nested structure as the source.
- For "periodPlaceholder" (AM/PM indicator): use the locale-appropriate abbreviation (e.g. "AM" stays "AM" in most locales; use local equivalent where applicable).
- For RTL languages, the strings themselves should still be in the target language.
- Keep keys identical to source (timePicker, hours, minutes, etc.).

Example output format:
{
  "de": {
    "timePicker": { "hours": "Stunden", "minutes": "Minuten", "seconds": "Sekunden", "period": "Periode", "periodPlaceholder": "AM" },
    "datePicker": { "selectDate": "Datum auswählen" },
    "input": { "cut": "Ausschneiden", "copy": "Kopieren", "paste": "Einfügen", "selectAll": "Alles auswählen" },
    "keyboardToolbar": { "done": "Fertig" }
  }
}
PROMPT
)

  # Use claude with haiku model
  echo "$prompt" | claude --model claude-haiku-4-5-20251001 -p --output-format text 2>/dev/null
}

write_yaml() {
  local code="$1"
  local json="$2"
  local file="${I18N_DIR}/${code}.i18n.yaml"

  local hours minutes seconds period periodPH selectDate cut copy paste selectAll done

  hours=$(echo "$json"      | jq -r ".${code}.timePicker.hours // empty")
  minutes=$(echo "$json"    | jq -r ".${code}.timePicker.minutes // empty")
  seconds=$(echo "$json"    | jq -r ".${code}.timePicker.seconds // empty")
  period=$(echo "$json"     | jq -r ".${code}.timePicker.period // empty")
  periodPH=$(echo "$json"   | jq -r ".${code}.timePicker.periodPlaceholder // empty")
  selectDate=$(echo "$json" | jq -r ".${code}.datePicker.selectDate // empty")
  cut=$(echo "$json"        | jq -r ".${code}.input.cut // empty")
  copy=$(echo "$json"       | jq -r ".${code}.input.copy // empty")
  paste=$(echo "$json"      | jq -r ".${code}.input.paste // empty")
  selectAll=$(echo "$json"  | jq -r ".${code}.input.selectAll // empty")
  done=$(echo "$json"       | jq -r ".${code}.keyboardToolbar.done // empty")

  # Skip if any field is empty (means translation failed)
  if [[ -z "$hours" || -z "$selectDate" || -z "$done" ]]; then
    echo "  WARNING: incomplete translation for $code, skipping"
    return
  fi

  cat > "$file" <<YAML
timePicker:
  hours: "${hours}"
  minutes: "${minutes}"
  seconds: "${seconds}"
  period: "${period}"
  periodPlaceholder: "${periodPH}"

datePicker:
  selectDate: "${selectDate}"

input:
  cut: "${cut}"
  copy: "${copy}"
  paste: "${paste}"
  selectAll: "${selectAll}"

keyboardToolbar:
  done: "${done}"
YAML
  echo "  ✓ $code"
}

echo "Generating translations for ${#LANGUAGES[@]} languages..."

BATCH_SIZE=15
total=${#LANGUAGES[@]}
i=0

while (( i < total )); do
  batch=("${LANGUAGES[@]:$i:$BATCH_SIZE}")
  echo ""
  echo "Batch $((i/BATCH_SIZE + 1)): ${batch[*]}"

  raw=$(batch_translate "${batch[@]}")

  # Strip any markdown code fences if present
  json=$(echo "$raw" | sed '/^```/d')

  for code in "${batch[@]}"; do
    write_yaml "$code" "$json"
  done

  (( i += BATCH_SIZE ))
done

echo ""
echo "Done. Running dart run slang to regenerate strings.g.dart..."
dart run slang
echo "Complete."
