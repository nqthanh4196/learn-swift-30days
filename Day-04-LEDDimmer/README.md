# Day 4 - PWM: Controlling LED Brightness

## 📖 Introduction

PWM (Pulse Width Modulation) allows controlling the "intensity" of an output signal by changing the ON/OFF time ratio. Applications: controlling LED brightness, motor speed, servos...

---

## 🎯 Key Concepts

### 1. What is PWM?

PWM generates a square wave with fixed frequency, changing the **duty cycle** (ON ratio):

```
Duty Cycle 25%:   ██░░░░░░ ██░░░░░░    → LED dim
Duty Cycle 50%:   ████░░░░ ████░░░░    → LED medium
Duty Cycle 75%:   ██████░░ ██████░░    → LED bright
Duty Cycle 100%:  ████████ ████████    → LED maximum
```

### 2. PWM on RP2040

- 8 PWM slices, each slice has 2 channels (A & B)
- 16 total PWM outputs
- Each GPIO pin maps to a specific PWM slice/channel

```
GP0 → PWM0A    GP1 → PWM0B
GP2 → PWM1A    GP3 → PWM1B
GP4 → PWM2A    GP5 → PWM2B
...
GP14 → PWM7A   GP15 → PWM7B
```

### 3. Configuring PWM in Code

```swift
let LED_PIN: UInt32 = 15

// Get PWM slice for pin
let slice = pwm_gpio_to_slice_num(LED_PIN)

// Set function = PWM
gpio_set_function(LED_PIN, GPIO_FUNC_PWM)

// Configure: wrap = 65535, divider = 1.0
pwm_set_wrap(slice, 65535)
pwm_set_clkdiv(slice, 1.0)

// Set duty cycle (0 - 65535)
pwm_set_chan_level(slice, PWM_CHAN_B, 32768)  // 50%

// Enable PWM
pwm_set_enabled(slice, true)
```

### 4. Calculating PWM Frequency

```
f_pwm = f_sys / (divider * (wrap + 1))

Example: 125MHz / (1.0 * 65536) ≈ 1907 Hz
```

### 5. Circuit Diagram

```
Pico GP15 ──── [220Ω] ──── LED(+) ──── LED(-) ──── GND
                (PWM output)
```

---

## 📝 Summary

- PWM controls "intensity" by changing duty cycle
- RP2040 has 8 PWM slices × 2 channels = 16 PWM outputs
- Duty cycle 0% = off, 100% = maximum brightness
- Use `pwm_set_chan_level()` to change duty cycle

---

## 🏋️ Challenge

1. Fade in/out LED (breathing effect)
2. Use a potentiometer (ADC) to control brightness
3. Create multiple brightness levels (off, 25%, 50%, 75%, 100%) using a button

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 4 - PWM: Điều khiển độ sáng LED

## 📖 Giới thiệu

PWM (Pulse Width Modulation) cho phép điều khiển "cường độ" tín hiệu output bằng cách thay đổi tỷ lệ thời gian ON/OFF. Ứng dụng: điều khiển độ sáng LED, tốc độ motor, servo...

---

## 🎯 Kiến thức chính

### 1. PWM là gì?

PWM tạo ra sóng vuông với tần số cố định, thay đổi **duty cycle** (tỷ lệ ON):

```
Duty Cycle 25%:   ██░░░░░░ ██░░░░░░    → LED mờ
Duty Cycle 50%:   ████░░░░ ████░░░░    → LED trung bình
Duty Cycle 75%:   ██████░░ ██████░░    → LED sáng
Duty Cycle 100%:  ████████ ████████    → LED sáng max
```

### 2. PWM trên RP2040

- 8 PWM slices, mỗi slice có 2 channels (A & B)
- 16 PWM outputs tổng cộng
- Mỗi GPIO pin map với 1 PWM slice/channel cụ thể

```
GP0 → PWM0A    GP1 → PWM0B
GP2 → PWM1A    GP3 → PWM1B
GP4 → PWM2A    GP5 → PWM2B
...
GP14 → PWM7A   GP15 → PWM7B
```

### 3. Cấu hình PWM trong code

```swift
let LED_PIN: UInt32 = 15

// Lấy PWM slice cho pin
let slice = pwm_gpio_to_slice_num(LED_PIN)

// Set function = PWM
gpio_set_function(LED_PIN, GPIO_FUNC_PWM)

// Cấu hình: wrap = 65535, divider = 1.0
pwm_set_wrap(slice, 65535)
pwm_set_clkdiv(slice, 1.0)

// Set duty cycle (0 - 65535)
pwm_set_chan_level(slice, PWM_CHAN_B, 32768)  // 50%

// Enable PWM
pwm_set_enabled(slice, true)
```

### 4. Tính toán tần số PWM

```
f_pwm = f_sys / (divider * (wrap + 1))

Ví dụ: 125MHz / (1.0 * 65536) ≈ 1907 Hz
```

### 5. Sơ đồ nối mạch

```
Pico GP15 ──── [220Ω] ──── LED(+) ──── LED(-) ──── GND
                (PWM output)
```

---

## 📝 Tóm tắt

- PWM điều khiển "cường độ" bằng cách thay đổi duty cycle
- RP2040 có 8 PWM slices × 2 channels = 16 PWM outputs
- Duty cycle 0% = tắt, 100% = sáng max
- Dùng `pwm_set_chan_level()` để thay đổi duty cycle

---

## 🏋️ Challenge

1. Fade in/out LED (breathing effect)
2. Dùng potentiometer (ADC) để điều khiển độ sáng
3. Tạo nhiều mức sáng (off, 25%, 50%, 75%, 100%) bằng button
