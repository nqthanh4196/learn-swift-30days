#!/bin/bash
# update-progress.sh - Update README.md progress table
set -e

TOPICS="Variables, Constants & Data Types
Operators & String Interpolation
Control Flow (if/else, switch)
Loops (for, while, repeat-while)
Functions & Parameters
Closures
Optionals & Optional Chaining
Arrays & Sets
Dictionaries & Tuples
Enumerations
Structs vs Classes
Properties & Methods
Inheritance & Polymorphism
Protocols & Protocol Extensions
Extensions
Generics
Error Handling (do-try-catch)
Access Control & Modules
Memory Management (ARC)
Concurrency (async/await)
Property Wrappers & Result Builders
SwiftUI Basics (Text, Image, Button)
State Management (@State, @Binding)
Lists & Navigation
Networking with URLSession
JSON Parsing & Codable
Core Data Basics
Combine Framework
Animations & Gestures
Final Project - Full App"

# Build progress table
TABLE="| Day | Topic | Status |\n|-----|-------|--------|\n"
i=1
while IFS= read -r topic; do
  DAY_PADDED=$(printf "%02d" "$i")
  if ls -d Day-${DAY_PADDED}-* &>/dev/null; then
    STATUS="✅"
  else
    STATUS="⬜"
  fi
  TABLE+="| $DAY_PADDED | $topic | $STATUS |\n"
  i=$((i + 1))
done <<< "$TOPICS"

# Replace between markers in README using perl (more portable)
perl -i -0pe "s/(<!-- PROGRESS_START -->).*?(<!-- PROGRESS_END -->)/\$1\n$(echo -e "$TABLE")\$2/s" README.md

echo "✅ README progress updated"
