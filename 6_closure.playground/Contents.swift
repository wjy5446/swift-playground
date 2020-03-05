import UIKit

// closer : 이름 없는 Method
var multiplyClosure: (Int, Int) -> Int = {(a:Int, b:Int) -> Int in
    return a * b
}

var multiplyClosure2: (Int, Int) -> Int = { return $0 * $1 }


multiplyClosure(4, 2)
multiplyClosure2(2, 4)

// Example

func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}

operateTwoNum(a: 4, b: 2, operation: multiplyClosure)

var addCloser: (Int, Int) -> Int = { a, b in
    return a + b
}

operateTwoNum(a: 4, b: 2, operation: addCloser)

operateTwoNum(a: 4, b: 2, operation: {a, b in
    return a / b
})

// Capturing value

let voidClosure: () -> Void = {
    print("iOS 개발자 하트 하트")
}

voidClosure()

var count = 0

let incrementer = {
    count += 1
}

incrementer()
incrementer()
incrementer()

count
