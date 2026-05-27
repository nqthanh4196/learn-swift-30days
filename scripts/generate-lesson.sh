#!/bin/bash
# generate-lesson.sh - Generate a Swift lesson using Claude API
set -e

DAY_NUMBER=$1
DAY_PADDED=$(printf "%02d" "$DAY_NUMBER")

# Lesson plan: "topic|project_name" indexed by line number
LESSONS="Variables, Constants & Data Types|PlaygroundBasics
Operators & String Interpolation|StringCalculator
Control Flow (if/else, switch)|GradeChecker
Loops (for, while, repeat-while)|MultiplicationTable
Functions & Parameters|TemperatureConverter
Closures|SortingApp
Optionals & Optional Chaining|UserProfileParser
Arrays & Sets|ShoppingList
Dictionaries & Tuples|ContactBook
Enumerations|WeatherApp
Structs vs Classes|BankAccount
Properties & Methods|FitnessTracker
Inheritance & Polymorphism|VehicleHierarchy
Protocols & Protocol Extensions|ShapeCalculator
Extensions|StringExtensions
Generics|GenericStack
Error Handling (do-try-catch)|FileManager
Access Control & Modules|LibraryModule
Memory Management (ARC)|MemoryLeakDemo
Concurrency (async/await)|AsyncImageLoader
Property Wrappers & Result Builders|SettingsManager
SwiftUI Basics (Text, Image, Button)|HelloSwiftUI
State Management (@State, @Binding)|CounterApp
Lists & Navigation|TodoListApp
Networking with URLSession|NewsReader
JSON Parsing & Codable|MovieBrowser
Core Data Basics|NotesApp
Combine Framework|SearchFilter
Animations & Gestures|AnimatedCards
Final Project - Full App|WeatherDashboard"

LINE=$(echo "$LESSONS" | sed -n "${DAY_NUMBER}p")
TOPIC=$(echo "$LINE" | cut -d'|' -f1)
PROJECT_NAME=$(echo "$LINE" | cut -d'|' -f2)
FOLDER_NAME="Day-${DAY_PADDED}-${PROJECT_NAME}"

echo "📚 Generating Day $DAY_NUMBER: $TOPIC ($PROJECT_NAME)"

# Create folder structure
mkdir -p "$FOLDER_NAME/Sources"
mkdir -p "$FOLDER_NAME/Examples"

# Generate lesson content via Claude API
PROMPT="You are a Swift programming instructor. Generate a complete lesson for Day $DAY_NUMBER of a 30-day Swift course.

Topic: $TOPIC
Project Name: $PROJECT_NAME

Generate the following in your response, separated by the exact markers shown:

===README===
Write a README.md with:
- Title: Day $DAY_NUMBER - $TOPIC
- Brief intro (2-3 sentences)
- Key concepts explained with code snippets
- Summary of what was learned
- Challenge for the reader
Use Vietnamese for explanations, English for code.

===MAIN_SWIFT===
Write a complete, runnable main.swift file that demonstrates the topic with a mini project called $PROJECT_NAME. Include comments explaining each section. The code should compile and run in Swift 5.9+.

===EXAMPLE_SWIFT===
Write an additional example.swift with 2-3 extra examples/variations of the concept."

RESPONSE=$(curl -s https://api.anthropic.com/v1/messages \
  -H "content-type: application/json" \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -d "$(jq -n \
    --arg prompt "$PROMPT" \
    '{
      model: "claude-sonnet-4-20250514",
      max_tokens: 4096,
      messages: [{role: "user", content: $prompt}]
    }')")

# Extract content from response
CONTENT=$(echo "$RESPONSE" | jq -r '.content[0].text')

if [ -z "$CONTENT" ] || [ "$CONTENT" = "null" ]; then
  echo "❌ Error: Failed to generate content"
  echo "$RESPONSE" | jq .
  exit 1
fi

# Split content by markers
echo "$CONTENT" | awk '/===README===/,/===MAIN_SWIFT===/' | sed '1d;$d' > "$FOLDER_NAME/README.md"
echo "$CONTENT" | awk '/===MAIN_SWIFT===/,/===EXAMPLE_SWIFT===/' | sed '1d;$d' > "$FOLDER_NAME/Sources/main.swift"
echo "$CONTENT" | awk '/===EXAMPLE_SWIFT===/,0' | sed '1d' > "$FOLDER_NAME/Examples/example.swift"

echo "✅ Generated: $FOLDER_NAME"
