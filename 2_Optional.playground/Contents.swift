import UIKit

// Optional : 변수안에 nil이 있거나 없을 수 있는 변수

var carName: String? = "Tesla"
carName = nil
carName = "Tank"

let num = Int("10하이") // 캐스팅할 경우 실패할 경우가 존재함으로 optional로 존재

// Optional 고급 기능
// 1. Forced unwrapping : 변수안에 있는 값을 강제로 확인하는 것
// 2. Optional binding (if let) : 부드럽게 박스를 확인하는 것 1
// 3. Optional binding (gaurd) : 부드럽게 박스를 확인하는 것 2
// 4. Nil Coalescing : 박스을 확인해서 값이 없으면 디폴트 값을 조치

// 1. forced unwrapping 강제를 확인 할 수 있으나 없을 시 에러를 출력
print(carName!)

// 2. Optional binding (if let) : 부드럽게 박스를 확인하는 것 1
if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("Car Name 없다.")
}

func printParsedImt(from: String) {
    if let parsedInt = Int(from) {
        print(parsedInt)
    } else {
        print("Int로 converting 않된다 샹")
    }
}
// -> Cyclomatic complexity가 높으면 이를 줄여준다.
printParsedImt(from: "100")

// 3. Optional binding (gaurd) : 부드럽게 박스를 확인하는 것 2, 1에 비해 cyclomatic complexity를 줄일 수 있다.
func printParsedInt(from: String) {
    guard let parsedInt = Int(from) else { // gaurd를 이용해 없을 경우, 앞단에서 바로 return
        print("Int로 전환이 되지 않음")
        return
    }
    
    print(parsedInt)
}


// 4. Nil Coalescing : 박스을 확인해서 값이 없으면 디폴트 값을 조치
let myCarName: String = carName ?? "모델 S" // nil일 경우의 기본 값을 넣어준다.


/////////////////////
// Test
////////////////////
// 1. 최애 음식을 담는 변수 작성
var favoritedFood: String? = "스시"

// 2-1. Optional Binding (Forced unwrapping)
print(favoritedFood!)

// 2-2. Optional Binding (if let)
if let unWrappedValue = favoritedFood {
    print(unWrappedValue)
} else {
    print("없음")
}

// 2-3. Optional Binding (gaurd)
func unWrap(value: String?) {
    guard let unWrappedValue1 = value else {
        print("없음")
        return
    }
    print(unWrappedValue1)
}

unWrap(value: favoritedFood)

// 2-4. nil coalescing
let food: String = favoritedFood ?? "불고기"

// 3. 닉네임을 받아서 출력하는 함수, 조건 입력 String?
func printNickname(nickname: String?) {
    guard let unWrappedValue2 = nickname else {
        print("없음")
        return
    }
    
    print(unWrappedValue2)
}
printNickname(nickname: "whale")
