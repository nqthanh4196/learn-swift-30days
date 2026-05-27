#!/bin/bash
# generate-and-push.sh - Generate next Swift lesson using Kiro CLI and push to GitHub
set -e

cd "$(dirname "$0")/.."

# Determine next day
if [ -n "$1" ]; then
  DAY=$1
else
  CURRENT=$(ls -d Day-* 2>/dev/null | wc -l | tr -d ' ')
  DAY=$((CURRENT + 1))
fi

if [ "$DAY" -gt 30 ]; then
  echo "🎉 All 30 days completed!"
  exit 0
fi

DAY_PADDED=$(printf "%02d" "$DAY")

# Lesson plan
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

LINE=$(echo "$LESSONS" | sed -n "${DAY}p")
TOPIC=$(echo "$LINE" | cut -d'|' -f1)
PROJECT_NAME=$(echo "$LINE" | cut -d'|' -f2)
FOLDER_NAME="Day-${DAY_PADDED}-${PROJECT_NAME}"

echo "📚 Generating Day $DAY: $TOPIC ($PROJECT_NAME)"
echo ""

# Create folder structure
mkdir -p "$FOLDER_NAME/Sources"
mkdir -p "$FOLDER_NAME/Examples"

# Use Kiro CLI to generate content
kiro chat --prompt "You are a Swift programming instructor. Generate a complete lesson for Day $DAY of a 30-day Swift course.

Topic: $TOPIC
Project Name: $PROJECT_NAME

Please create these 3 files:

1. Create file '$FOLDER_NAME/README.md' with:
   - Title: Day $DAY - $TOPIC
   - Brief intro (2-3 sentences)
   - Key concepts explained with code snippets
   - Summary of what was learned
   - Challenge for the reader
   Use Vietnamese for explanations, English for code.

2. Create file '$FOLDER_NAME/Sources/main.swift' with:
   - A complete, runnable Swift file demonstrating the topic
   - Mini project called $PROJECT_NAME
   - Comments explaining each section
   - Must compile with Swift 5.9+

3. Create file '$FOLDER_NAME/Examples/example.swift' with:
   - 2-3 extra examples/variations of the concept

Create all 3 files now."

echo ""
echo "✅ Generated: $FOLDER_NAME"

# Update progress in README
./scripts/update-progress.sh

# Git commit and push
git add .
git commit -m "📚 Day ${DAY_PADDED}: $TOPIC"
git push

echo "🎉 Day $DAY pushed to GitHub!"
