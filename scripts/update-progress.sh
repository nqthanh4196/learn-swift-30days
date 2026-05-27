#!/bin/bash
# update-progress.sh - Update README.md progress table
set -e

declare -A TOPICS
TOPICS[1]="Variables, Constants & Data Types"
TOPICS[2]="Operators & String Interpolation"
TOPICS[3]="Control Flow (if/else, switch)"
TOPICS[4]="Loops (for, while, repeat-while)"
TOPICS[5]="Functions & Parameters"
TOPICS[6]="Closures"
TOPICS[7]="Optionals & Optional Chaining"
TOPICS[8]="Arrays & Sets"
TOPICS[9]="Dictionaries & Tuples"
TOPICS[10]="Enumerations"
TOPICS[11]="Structs vs Classes"
TOPICS[12]="Properties & Methods"
TOPICS[13]="Inheritance & Polymorphism"
TOPICS[14]="Protocols & Protocol Extensions"
TOPICS[15]="Extensions"
TOPICS[16]="Generics"
TOPICS[17]="Error Handling (do-try-catch)"
TOPICS[18]="Access Control & Modules"
TOPICS[19]="Memory Management (ARC)"
TOPICS[20]="Concurrency (async/await)"
TOPICS[21]="Property Wrappers & Result Builders"
TOPICS[22]="SwiftUI Basics (Text, Image, Button)"
TOPICS[23]="State Management (@State, @Binding)"
TOPICS[24]="Lists & Navigation"
TOPICS[25]="Networking with URLSession"
TOPICS[26]="JSON Parsing & Codable"
TOPICS[27]="Core Data Basics"
TOPICS[28]="Combine Framework"
TOPICS[29]="Animations & Gestures"
TOPICS[30]="Final Project - Full App"

# Build progress table
TABLE="| Day | Topic | Status |\n|-----|-------|--------|\n"
for i in $(seq 1 30); do
  DAY_PADDED=$(printf "%02d" "$i")
  if ls -d Day-${DAY_PADDED}-* &>/dev/null; then
    STATUS="✅"
  else
    STATUS="⬜"
  fi
  TABLE+="| $DAY_PADDED | ${TOPICS[$i]} | $STATUS |\n"
done

# Replace between markers in README
sed -i '' '/<!-- PROGRESS_START -->/,/<!-- PROGRESS_END -->/{
  /<!-- PROGRESS_START -->/!{/<!-- PROGRESS_END -->/!d;}
}' README.md

sed -i '' "/<!-- PROGRESS_START -->/a\\
$(echo -e "$TABLE")
" README.md

echo "✅ README progress updated"
