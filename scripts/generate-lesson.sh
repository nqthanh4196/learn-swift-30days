#!/bin/bash
# generate-lesson.sh - Generate a Swift lesson using Claude API
set -e

DAY_NUMBER=$1
DAY_PADDED=$(printf "%02d" "$DAY_NUMBER")

# Lesson plan mapping
declare -A TOPICS
TOPICS[1]="Variables, Constants & Data Types|PlaygroundBasics"
TOPICS[2]="Operators & String Interpolation|StringCalculator"
TOPICS[3]="Control Flow (if/else, switch)|GradeChecker"
TOPICS[4]="Loops (for, while, repeat-while)|MultiplicationTable"
TOPICS[5]="Functions & Parameters|TemperatureConverter"
TOPICS[6]="Closures|SortingApp"
TOPICS[7]="Optionals & Optional Chaining|UserProfileParser"
TOPICS[8]="Arrays & Sets|ShoppingList"
TOPICS[9]="Dictionaries & Tuples|ContactBook"
TOPICS[10]="Enumerations|WeatherApp"
TOPICS[11]="Structs vs Classes|BankAccount"
TOPICS[12]="Properties & Methods|FitnessTracker"
TOPICS[13]="Inheritance & Polymorphism|VehicleHierarchy"
TOPICS[14]="Protocols & Protocol Extensions|ShapeCalculator"
TOPICS[15]="Extensions|StringExtensions"
TOPICS[16]="Generics|GenericStack"
TOPICS[17]="Error Handling (do-try-catch)|FileManager"
TOPICS[18]="Access Control & Modules|LibraryModule"
TOPICS[19]="Memory Management (ARC)|MemoryLeakDemo"
TOPICS[20]="Concurrency (async/await)|AsyncImageLoader"
TOPICS[21]="Property Wrappers & Result Builders|SettingsManager"
TOPICS[22]="SwiftUI Basics (Text, Image, Button)|HelloSwiftUI"
TOPICS[23]="State Management (@State, @Binding)|CounterApp"
TOPICS[24]="Lists & Navigation|TodoListApp"
TOPICS[25]="Networking with URLSession|NewsReader"
TOPICS[26]="JSON Parsing & Codable|MovieBrowser"
TOPICS[27]="Core Data Basics|NotesApp"
TOPICS[28]="Combine Framework|SearchFilter"
TOPICS[29]="Animations & Gestures|AnimatedCards"
TOPICS[30]="Final Project - Full App|WeatherDashboard"

IFS='|' read -r TOPIC PROJECT_NAME <<< "${TOPICS[$DAY_NUMBER]}"
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
