# Day 6 - Debounce Button & State Machine

## 📖 Introduction

Physical buttons produce "bounce" — the signal oscillates multiple times before stabilizing. Today we learn how to debounce and build a State Machine to manage complex logic.

---

## 🎯 Key Concepts

### 1. The Bounce Problem

When pressing/releasing a button, the metal contacts produce multiple false pulses:
```
Ideal:       ────┐      ┌────
                  └──────┘

Reality:     ────┐┌┐┌┐  ┌┐┌┐┌────
                  └┘└┘└──┘└┘└┘
                  |← ~5-20ms →|
```

### 2. Software Debounce

```swift
let DEBOUNCE_MS: UInt32 = 50  // Wait time for stabilization

var lastDebounceTime: UInt32 = 0
var lastStableState = false
var currentReading = false

func debounceButton() -> Bool {
    let reading = !gpio_get(BUTTON_PIN)  // Read raw
    
    if reading != currentReading {
        lastDebounceTime = to_ms_since_boot(get_absolute_time())
        currentReading = reading
    }
    
    let now = to_ms_since_boot(get_absolute_time())
    if now - lastDebounceTime > DEBOUNCE_MS {
        if currentReading != lastStableState {
            lastStableState = currentReading
            return true  // State changed!
        }
    }
    return false  // No change
}
```

### 3. State Machine

A State Machine manages states and transitions between them:

```swift
enum AppState {
    case idle
    case blinkSlow
    case blinkFast
    case solid
}

var state: AppState = .idle

func handleButtonPress() {
    switch state {
    case .idle:      state = .blinkSlow
    case .blinkSlow: state = .blinkFast
    case .blinkFast: state = .solid
    case .solid:     state = .idle
    }
}
```

### 4. State Diagram

```
                 ┌─────────┐
     ┌──────────→│  IDLE   │──── Button ────┐
     │           └─────────┘                │
     │                                      ▼
     │           ┌─────────────┐      ┌───────────┐
     └── Button ─│   SOLID     │←─────│ BLINK_SLOW│
                 └─────────────┘      └───────────┘
                       ▲                    │
                       │              Button│
                       │                    ▼
                       │           ┌───────────┐
                       └── Button ─│ BLINK_FAST│
                                   └───────────┘
```

---

## 📝 Summary

- Button bounce creates multiple false pulses (5-20ms)
- Software debounce: wait for signal to stabilize before processing
- State Machine: manage complex logic using enum + switch
- Combine debounce + state machine for robust applications

---

## 🏋️ Challenge

1. Implement software debounce for a button
2. Create a state machine with 4 LED modes (off/slow/fast/solid)
3. Long press (>2s) returns to idle state

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 6 - Debounce Button & State Machine

## 📖 Giới thiệu

Nút nhấn vật lý tạo ra "bounce" — tín hiệu rung nhiều lần trước khi ổn định. Hôm nay ta học cách debounce và xây dựng State Machine để quản lý logic phức tạp.

---

## 🎯 Kiến thức chính

### 1. Vấn đề Bounce

Khi nhấn/nhả nút, contact kim loại tạo ra nhiều xung giả:
```
Lý tưởng:    ────┐      ┌────
                  └──────┘

Thực tế:     ────┐┌┐┌┐  ┌┐┌┐┌────
                  └┘└┘└──┘└┘└┘
                  |← ~5-20ms →|
```

### 2. Software Debounce

```swift
let DEBOUNCE_MS: UInt32 = 50  // Thời gian chờ ổn định

var lastDebounceTime: UInt32 = 0
var lastStableState = false
var currentReading = false

func debounceButton() -> Bool {
    let reading = !gpio_get(BUTTON_PIN)  // Đọc raw
    
    if reading != currentReading {
        lastDebounceTime = to_ms_since_boot(get_absolute_time())
        currentReading = reading
    }
    
    let now = to_ms_since_boot(get_absolute_time())
    if now - lastDebounceTime > DEBOUNCE_MS {
        if currentReading != lastStableState {
            lastStableState = currentReading
            return true  // State changed!
        }
    }
    return false  // No change
}
```

### 3. State Machine

State Machine quản lý các trạng thái và chuyển đổi giữa chúng:

```swift
enum AppState {
    case idle
    case blinkSlow
    case blinkFast
    case solid
}

var state: AppState = .idle

func handleButtonPress() {
    switch state {
    case .idle:      state = .blinkSlow
    case .blinkSlow: state = .blinkFast
    case .blinkFast: state = .solid
    case .solid:     state = .idle
    }
}
```

### 4. State Diagram

```
                 ┌─────────┐
     ┌──────────→│  IDLE   │──── Button ────┐
     │           └─────────┘                │
     │                                      ▼
     │           ┌─────────────┐      ┌───────────┐
     └── Button ─│   SOLID     │←─────│ BLINK_SLOW│
                 └─────────────┘      └───────────┘
                       ▲                    │
                       │              Button│
                       │                    ▼
                       │           ┌───────────┐
                       └── Button ─│ BLINK_FAST│
                                   └───────────┘
```

---

## 📝 Tóm tắt

- Button bounce tạo nhiều xung giả (5-20ms)
- Software debounce: chờ tín hiệu ổn định trước khi xử lý
- State Machine: quản lý logic phức tạp bằng enum + switch
- Kết hợp debounce + state machine cho ứng dụng robust

---

## 🏋️ Challenge

1. Implement software debounce cho button
2. Tạo state machine với 4 chế độ LED (off/slow/fast/solid)
3. Long press (>2s) quay về trạng thái idle
