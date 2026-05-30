# Day 8 - Analog Input (ADC): Reading Sensors

## 📖 Introduction

ADC (Analog-to-Digital Converter) converts analog signals (continuous voltage) into digital values. RP2040 has 4 channels of 12-bit ADC for reading analog sensors.

---

## 🎯 Key Concepts

### 1. ADC on RP2040

| Specification | Value |
|---------------|-------|
| ADC Channels | 4 (ADC0-ADC3) + 1 internal temp |
| Resolution | 12-bit (0-4095) |
| Speed | 500 kSPS |
| Voltage range | 0V - 3.3V |
| GP26 | ADC0 |
| GP27 | ADC1 |
| GP28 | ADC2 |
| ADC4 | Internal temperature sensor |

### 2. Potentiometer Circuit Diagram

```
3.3V ──── [Pot Leg 1]
           [Pot Wiper] ──── GP26 (ADC0)
GND  ──── [Pot Leg 3]
```

### 3. ADC Read Code

```swift
// Initialize ADC
adc_init()
adc_gpio_init(26)     // GP26 = ADC input
adc_select_input(0)   // Select ADC0

// Read value (0-4095)
let rawValue = adc_read()

// Convert to voltage
let voltage = Float(rawValue) * 3.3 / 4095.0
```

### 4. Conversion Formula

```
Voltage = ADC_Value × Vref / ADC_Max
Voltage = raw × 3.3 / 4095

Percentage = ADC_Value × 100 / ADC_Max
```

### 5. Internal Temperature Sensor

```swift
adc_select_input(4)  // Channel 4 = temp sensor
let raw = adc_read()
let voltage = Float(raw) * 3.3 / 4095.0
let tempC = 27.0 - (voltage - 0.706) / 0.001721
```

---

## 📝 Summary

- ADC converts analog → digital (12-bit: 0-4095)
- RP2040 has 4 ADC channels + 1 internal temp
- GP26=ADC0, GP27=ADC1, GP28=ADC2
- Use `adc_read()` to read values
- Averaging multiple samples reduces noise

---

## 🏋️ Challenge

1. Read potentiometer, print voltage to serial
2. Control LED brightness with pot (ADC → PWM)
3. Read internal temperature sensor

---

# 🇻🇳 Phiên bản Tiếng Việt

# Day 8 - Analog Input (ADC): Đọc cảm biến

## 📖 Giới thiệu

ADC (Analog-to-Digital Converter) chuyển đổi tín hiệu analog (voltage liên tục) thành giá trị số. RP2040 có 4 kênh ADC 12-bit cho phép đọc cảm biến analog.

---

## 🎯 Kiến thức chính

### 1. ADC trên RP2040

| Thông số | Giá trị |
|----------|---------|
| Kênh ADC | 4 (ADC0-ADC3) + 1 internal temp |
| Resolution | 12-bit (0-4095) |
| Tốc độ | 500 kSPS |
| Voltage range | 0V - 3.3V |
| GP26 | ADC0 |
| GP27 | ADC1 |
| GP28 | ADC2 |
| ADC4 | Internal temperature sensor |

### 2. Sơ đồ nối Potentiometer

```
3.3V ──── [Pot Leg 1]
           [Pot Wiper] ──── GP26 (ADC0)
GND  ──── [Pot Leg 3]
```

### 3. Code đọc ADC

```swift
// Khởi tạo ADC
adc_init()
adc_gpio_init(26)     // GP26 = ADC input
adc_select_input(0)   // Chọn ADC0

// Đọc giá trị (0-4095)
let rawValue = adc_read()

// Chuyển sang voltage
let voltage = Float(rawValue) * 3.3 / 4095.0
```

### 4. Công thức chuyển đổi

```
Voltage = ADC_Value × Vref / ADC_Max
Voltage = raw × 3.3 / 4095

Phần trăm = ADC_Value × 100 / ADC_Max
```

### 5. Internal Temperature Sensor

```swift
adc_select_input(4)  // Channel 4 = temp sensor
let raw = adc_read()
let voltage = Float(raw) * 3.3 / 4095.0
let tempC = 27.0 - (voltage - 0.706) / 0.001721
```

---

## 📝 Tóm tắt

- ADC chuyển analog → digital (12-bit: 0-4095)
- RP2040 có 4 kênh ADC + 1 internal temp
- GP26=ADC0, GP27=ADC1, GP28=ADC2
- Dùng `adc_read()` để đọc giá trị
- Averaging nhiều samples giảm noise

---

## 🏋️ Challenge

1. Đọc potentiometer, in voltage ra serial
2. Điều khiển độ sáng LED bằng pot (ADC → PWM)
3. Đọc nhiệt độ internal sensor
