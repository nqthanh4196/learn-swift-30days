# Kiro Agent Instructions

## Project: Learn Swift in 30 Days

**Repo:** https://github.com/nqthanh4196/learn-swift-30days
**Path:** /Users/thanh-it-17426/ThanhAI/learn-swift-30days

## Task: Generate next daily lesson

When user asks to generate the next lesson:

1. Check existing `Day-XX-*` folders to determine next day number
2. Read `PLAN.md` for the topic and project name
3. Create folder: `Day-{DD}-{ProjectName}/`
4. Create 3 files:
   - `README.md` — Theory in Vietnamese, code in English
   - `Sources/main.swift` — Complete runnable demo
   - `Examples/example.swift` — Extra examples
5. Run `./scripts/update-progress.sh`
6. Git commit with message: `📚 Day {DD}: {Topic}`
7. Git push

## Trigger phrase
User says anything like: "tạo bài tiếp theo", "next day", "generate day X"
