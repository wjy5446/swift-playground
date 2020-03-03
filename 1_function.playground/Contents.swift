import UIKit

// 1. Function
// Function : 독립적으로 존재 functionName()
// Method : 오브젝트에 종속 object.functionName()
//
//func functionName(externalName param: ParaType) -> ReturnType {
//    ........
//    return returnValue
//}

func printName() {
    print("Name : Jason")
}

printName()

// param 1
// 숫자를 받아 10을 곱한다.
func printMultipleOfTen(value: Int){
    print("\(value) * 10 = \(value * 10)")
}

printMultipleOfTen(value: 5)

// param 2
// 물건 값과 갯수를 받아 전체 금액 출력하는 함수
//func printTotalPrice(price: Int, count: Int){
//    print("Total Price: \(price * count)")
//}
//printTotalPrice(price: 1500, count: 5)

//// param의 이름이 없는 경우
//func printTotalPrice(_ price: Int, _ count: Int){ // 외부 이름, 내부 이름 설정 가능
//    print("Total Price: \(price * count)")
//}
//
//
//printTotalPrice(1500, 5)

// default 지정
func printTotalPriceWithDefaultValue(price: Int = 1500, count: Int){
       print("Total Price: \(price * count)")
}

printTotalPriceWithDefaultValue(count: 5)
printTotalPriceWithDefaultValue(price: 2000, count: 5)

// return
func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice = totalPrice(price: 10000, count: 77)
calculatedPrice

// overload
func printTotalPrice(price: Int, count: Int){
    print("Total Price: \(price * count)")
}

func printTotalPrice(price: Double, count: Double){
    print("Total Price: \(price * count)")
}

func printTotalPrice(가격: Double, 갯수: Double){
    print("Total Price: \(가격 * 갯수)")
}

// in-out parameter
var value = 3
func incrementAndPrint(_ value: inout Int){ // 기본적으로 parameter로 들어오는 변수는 카피되어 상수로 지정, inout 사용시 주소값을 전달 하는 듯
    value += 1
    print(value)
}
incrementAndPrint(&value)
print(value)

// Function as a param
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func substract(_ a: Int, _ b: Int) -> Int{
    return a - b
}

var function = add // 변수 할당 가능
function(4, 2)
function = substract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int){
    let result = function(a, b)
    print(result)
}

printResult(add, 10, 5)
printResult(substract, 10, 5)

////////////////////////////////////////////////////////
// Testing
////////////////////////////////////////////////////////
// 1. 성, 이름을 받아서 fullname을 출력하는 함수
func makeFullName(firstName: String, lastName: String){
    print("full name : \(firstName + lastName)")
}

makeFullName(firstName: "윤", lastName: "재영")

// 2. 1번과 같고, 파라미터 이름 제거 + fullname 출력
func makeFullName2(_ firstName: String, _ lastName: String){
    print("full name : \(firstName + lastName)")
}

makeFullName2("윤", "재영")

// 3. 성, 이름을 받아서 fullname return 하는 함수
func makeFullName3(firstName: String, lastName: String) -> String{
    return firstName + lastName
}

let fullName = makeFullName3(firstName: "윤", lastName: "재영")
print(fullName)



