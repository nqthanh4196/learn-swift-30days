# Day 2 - GPIO Output: Blink LED

## 📖 Introduction

Today we will learn how to control GPIO Output to turn an LED on/off — the most classic lesson in embedded programming. This is the "Hello World" of the microcontroller world.

---

## 🎯 Key Concepts

### 1. What is GPIO?

**GPIO** (General Purpose Input/Output) are multi-purpose pins on the microcontroller that can be configured as:
- **Output**: Output HIGH (3.3V) or LOW (0V) signal
- **Input**: Read signal from external source

### 2. Circuit Diagram

```
Pico GP15 ──── [220Ω] ──── LED(+) ──── LED(-) ──── GND
```

> ⚠️ **Important**: Always use a current-limiting resistor (220Ω) to protect the LED!

### 3. Steps to Control GPIO Output

```swift
// Step 1: Initialize pin
gpio_init(15)

// Step 2: Set direction = OUTPUT
gpio_set_dir(15, GPIO_OUT)

// Step 3: Output signal
gpio_put(15, true)   // HIGH - LED on
gpio_put(15, false)  // LOW - LED off
```

### 4. Sleep Function

```swift
sleep_ms(1000)  // Delay 1000ms = 1 second
sleep_us(500)   // Delay 500 microseconds
```

### 5. Onboard LED

Raspberry Pi Pico has an onboard LED at **GP25** (Pico) or through WiFi chip (Pico W):

```swift
// Pico: GP25
let LED_BUILTIN: UInt32 = 25

// Pico W: Use cyw43_arch
// cyw43_arch_gpio_put(CYW43_WL_GPIO_LED_PIN, true)
```

---

## 📝 Summary

- GPIO Output outputs HIGH (3.3V) or LOW (0V) signal
- Use `gpio_init()`, `gpio_set_dir()`, `gpio_put()`
- Always use a current-limiting resistor with LED
- `sleep_ms()` to create delay

---

## 🏋️ Challenge

1. Change the blink speed (200ms, 500ms, 2000ms)
2. Create an SOS pattern using Morse code (··· ─── ···)
3. Use an external LED (GP15) instead of the onboard LED

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 2 - GPIO Output: Blink LED

## 📖 Giới thiệu

Hôm nay chúng ta sẽ học cách điều khiển GPIO Output để bật/tắt LED — bài học kinh điển nhất trong embedded programming. Đây là "Hello World" của thế giới vi điều khiển.

---

## 🎯 Kiến thức chính

### 1. GPIO là gì?

**GPIO** (General Purpose Input/Output) là các chân đa năng trên vi điều khiển có thể được cấu hình làm:
- **Output**: Xuất tín hiệu HIGH (3.3V) hoặc LOW (0V)
- **Input**: Đọc tín hiệu từ bên ngoài

### 2. Sơ đồ nối mạch

```
Pico GP15 ──── [220Ω] ──── LED(+) ──── LED(-) ──── GND
```

> ⚠️ **Quan trọng**: Luôn dùng điện trở hạn dòng (220Ω) để bảo vệ LED!

### 3. Các bước điều khiển GPIO Output

```swift
// Bước 1: Khởi tạo pin
gpio_init(15)

// Bước 2: Set direction = OUTPUT
gpio_set_dir(15, GPIO_OUT)

// Bước 3: Xuất tín hiệu
gpio_put(15, true)   // HIGH - LED sáng
gpio_put(15, false)  // LOW - LED tắt
```

### 4. Hàm sleep

```swift
sleep_ms(1000)  // Delay 1000ms = 1 giây
sleep_us(500)   // Delay 500 microseconds
```

### 5. Onboard LED

Raspberry Pi Pico có LED onboard ở **GP25** (Pico) hoặc qua WiFi chip (Pico W):

```swift
// Pico: GP25
let LED_BUILTIN: UInt32 = 25

// Pico W: Dùng cyw43_arch
// cyw43_arch_gpio_put(CYW43_WL_GPIO_LED_PIN, true)
```

---

## 📝 Tóm tắt

- GPIO Output xuất tín hiệu HIGH (3.3V) hoặc LOW (0V)
- Dùng `gpio_init()`, `gpio_set_dir()`, `gpio_put()`
- Luôn dùng điện trở hạn dòng với LED
- `sleep_ms()` để tạo delay

---

## 🏋️ Challenge

1. Thay đổi tốc độ nhấp nháy (200ms, 500ms, 2000ms)
2. Tạo pattern SOS bằng mã Morse (··· ─── ···)
3. Sử dụng LED ngoài (GP15) thay vì onboard LED
