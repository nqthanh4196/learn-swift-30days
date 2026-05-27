#!/bin/bash
# update-progress.sh - Update README.md progress table
set -e

TOPICS=(
"Variables, Constants & Data Types"
"Operators & String Interpolation"
"Control Flow (if/else, switch)"
"Loops (for, while, repeat-while)"
"Functions & Parameters"
"Closures"
"Optionals & Optional Chaining"
"Arrays & Sets"
"Dictionaries & Tuples"
"Enumerations"
"Structs vs Classes"
"Properties & Methods"
"Inheritance & Polymorphism"
"Protocols & Protocol Extensions"
"Extensions"
"Generics"
"Error Handling (do-try-catch)"
"Access Control & Modules"
"Memory Management (ARC)"
"Concurrency (async/await)"
"Property Wrappers & Result Builders"
"SwiftUI Basics (Text, Image, Button)"
"State Management (@State, @Binding)"
"Lists & Navigation"
"Networking with URLSession"
"JSON Parsing & Codable"
"Core Data Basics"
"Combine Framework"
"Animations & Gestures"
"Final Project - Full App"
)

# Build progress table into temp file
TMPFILE=$(mktemp)
echo "| Day | Topic | Status |" > "$TMPFILE"
echo "|-----|-------|--------|" >> "$TMPFILE"

for i in $(seq 1 30); do
  DAY_PADDED=$(printf "%02d" "$i")
  if ls -d Day-${DAY_PADDED}-* &>/dev/null; then
    STATUS="✅"
  else
    STATUS="⬜"
  fi
  echo "| $DAY_PADDED | ${TOPICS[$((i-1))]} | $STATUS |" >> "$TMPFILE"
done

# Replace content between markers
python3 -c "
import re
with open('README.md', 'r') as f:
    content = f.read()
with open('$TMPFILE', 'r') as f:
    table = f.read()
result = re.sub(
    r'(<!-- PROGRESS_START -->).*?(<!-- PROGRESS_END -->)',
    r'\1\n' + table + r'\2',
    content,
    flags=re.DOTALL
)
with open('README.md', 'w') as f:
    f.write(result)
"

rm "$TMPFILE"
echo "✅ README progress updated"
