// Day 21 - Extra: Projected value ($)
@propertyWrapper
struct Validated {
    private var value: String = ""
    private(set) var isValid: Bool = false
    
    var wrappedValue: String {
        get { value }
        set { value = newValue; isValid = !newValue.isEmpty && newValue.count >= 3 }
    }
    var projectedValue: Bool { isValid }
    init(wrappedValue: String) { self.wrappedValue = wrappedValue }
}

struct Form {
    @Validated var email: String = ""
    @Validated var password: String = ""
}

var form = Form()
form.email = "hi"
print("Email valid: \(form.$email)")  // false (too short)
form.email = "thanh@mail.com"
print("Email valid: \(form.$email)")  // true
