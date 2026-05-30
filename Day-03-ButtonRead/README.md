# Day 3 - GPIO Input: Reading a Button

## 📖 Introduction

Today we learn how to read input signals from a push button — a fundamental skill for user interaction in embedded systems.

---

## 🎯 Key Concepts

### 1. GPIO Input

When GPIO is configured as Input, that pin reads the voltage state:
- **HIGH (1)**: 3.3V
- **LOW (0)**: 0V (GND)

### 2. Pull-up & Pull-down Resistor

When the button is not pressed, the pin is in a "floating" state (undefined). A pull resistor is needed:

```
Pull-up (default HIGH, pressed = LOW):
3.3V ─── [10kΩ] ─┬── GP14 (Input)
                   │
                   └── [Button] ── GND

Pull-down (default LOW, pressed = HIGH):
GND ──── [10kΩ] ─┬── GP14 (Input)
                   │
                   └── [Button] ── 3.3V
```

### 3. Internal Pull-up/Pull-down

RP2040 has internal pull resistors, no external ones needed:

```swift
gpio_init(14)
gpio_set_dir(14, GPIO_IN)
gpio_pull_up(14)    // Internal pull-up → pressed = LOW
// or
gpio_pull_down(14)  // Internal pull-down → pressed = HIGH
```

### 4. Reading Button State

```swift
let BUTTON_PIN: UInt32 = 14

gpio_init(BUTTON_PIN)
gpio_set_dir(BUTTON_PIN, GPIO_IN)
gpio_pull_up(BUTTON_PIN)

while true {
    let pressed = !gpio_get(BUTTON_PIN)  // Pull-up: LOW when pressed
    if pressed {
        gpio_put(LED_PIN, true)
    } else {
        gpio_put(LED_PIN, false)
    }
    sleep_ms(10)
}
```

### 5. Circuit Diagram

```
         Button
GP14 ────┤    ├──── GND
         └────┘
(Internal pull-up enabled)

GP15 ──── [220Ω] ──── LED(+) ──── LED(-) ──── GND
```

---

## 📝 Summary

- GPIO Input reads HIGH/LOW state
- Pull-up resistor: default HIGH, pressed = LOW
- Pull-down resistor: default LOW, pressed = HIGH
- RP2040 has internal pull resistors
- `gpio_get(pin)` returns `true`/`false`

---

## 🏋️ Challenge

1. Press button to turn on LED, release to turn off LED
2. Toggle LED: each press changes the state
3. Count the number of presses and print to serial

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 3 - GPIO Input: Đọc nút nhấn

## 📖 Giới thiệu

Hôm nay chúng ta học cách đọc tín hiệu đầu vào từ nút nhấn (push button) — kỹ năng cơ bản để tương tác với người dùng trong embedded systems.

---

## 🎯 Kiến thức chính

### 1. GPIO Input

Khi cấu hình GPIO làm Input, chân đó sẽ đọc trạng thái điện áp:
- **HIGH (1)**: 3.3V
- **LOW (0)**: 0V (GND)

### 2. Pull-up & Pull-down Resistor

Khi nút chưa nhấn, pin ở trạng thái "floating" (không xác định). Cần pull resistor:

```
Pull-up (mặc định HIGH, nhấn = LOW):
3.3V ─── [10kΩ] ─┬── GP14 (Input)
                   │
                   └── [Button] ── GND

Pull-down (mặc định LOW, nhấn = HIGH):
GND ──── [10kΩ] ─┬── GP14 (Input)
                   │
                   └── [Button] ── 3.3V
```

### 3. Internal Pull-up/Pull-down

RP2040 có internal pull resistors, không cần thêm bên ngoài:

```swift
gpio_init(14)
gpio_set_dir(14, GPIO_IN)
gpio_pull_up(14)    // Internal pull-up → nhấn = LOW
// hoặc
gpio_pull_down(14)  // Internal pull-down → nhấn = HIGH
```

### 4. Đọc trạng thái button

```swift
let BUTTON_PIN: UInt32 = 14

gpio_init(BUTTON_PIN)
gpio_set_dir(BUTTON_PIN, GPIO_IN)
gpio_pull_up(BUTTON_PIN)

while true {
    let pressed = !gpio_get(BUTTON_PIN)  // Pull-up: LOW khi nhấn
    if pressed {
        gpio_put(LED_PIN, true)
    } else {
        gpio_put(LED_PIN, false)
    }
    sleep_ms(10)
}
```

### 5. Sơ đồ nối mạch

```
         Button
GP14 ────┤    ├──── GND
         └────┘
(Internal pull-up enabled)

GP15 ──── [220Ω] ──── LED(+) ──── LED(-) ──── GND
```

---

## 📝 Tóm tắt

- GPIO Input đọc trạng thái HIGH/LOW
- Pull-up resistor: mặc định HIGH, nhấn = LOW
- Pull-down resistor: mặc định LOW, nhấn = HIGH
- RP2040 có internal pull resistors
- `gpio_get(pin)` trả về `true`/`false`

---

## 🏋️ Challenge

1. Nhấn button bật LED, nhả button tắt LED
2. Toggle LED: mỗi lần nhấn đổi trạng thái
3. Đếm số lần nhấn và in ra serial
