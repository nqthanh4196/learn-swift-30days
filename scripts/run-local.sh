#!/bin/bash
# run-local.sh - Generate a lesson locally and push to GitHub
# Usage: ./scripts/run-local.sh [day_number]
set -e

cd "$(dirname "$0")/.."

# Check API key
if [ -z "$GEMINI_API_KEY" ]; then
  echo "❌ Set GEMINI_API_KEY first: export GEMINI_API_KEY=your-key"
  exit 1
fi

# Determine day number
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

echo "🚀 Generating Day $DAY..."

# Generate lesson
./scripts/generate-lesson.sh "$DAY"

# Update progress
./scripts/update-progress.sh

# Git commit and push
DAY_PADDED=$(printf "%02d" "$DAY")
git add .
git commit -m "📚 Day ${DAY_PADDED}: Add new Swift lesson"
git push

echo "🎉 Day $DAY pushed to GitHub!"
