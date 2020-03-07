import UIKit

// Structure
// 관계가 있는 값을 한번 에 표현하는 것
// = object = data + method 의 일종 -> class가 존재

// structure vs class
// structure : value type 복사되어 할당 : 따로따로 할당 (stack에 생성)
// class : reference type 공유되어 할당 : 인스턴스가 하나의 클래스를 할당 (heap에 생성)

// basic 구조
//let store1 = (x: 3, y: 5, name: "gs")
//let store2 = (x: 4, y: 6, name: "seven")
//let store3 = (x: 1, y: 7, name: "cu")
//
//func distance(current: (x: Int, y: Int), target: (x: Int, y: Int)) -> Double {
//    let distanceX: Double = Double(target.x - current.x)
//    let distanceY: Double = Double(target.y - current.y)
//
//    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
//
//    return distance
//}
//
//func printClosesStore(currentLocation: (x: Int, y: Int), stores:[(x: Int, y: Int, name: String)]) {
//    var closestStoreName = ""
//    var closestStoreDistance = Double.infinity
//
//    for store in stores {
//        let distanceToStore = distance(current: currentLocation, target: (x: store.x, y: store.y))
//        closestStoreDistance = min(distanceToStore, closestStoreDistance)
//        if closestStoreDistance == distanceToStore {
//            closestStoreName = store.name
//        }
//    }
//
//    print("Closest store: \(closestStoreName)")
//}
//
//let myLocation = (x: 2, y: 2)
//let stores = [store1, store2, store3]
//
//printClosesStore(currentLocation: myLocation, stores: stores)

// Structure로 변형
struct Location {
    let x: Int
    let y: Int
}

func distance(current: Location, target: Location) -> Double {
    let distanceX: Double = Double(target.x - current.x)
    let distanceY: Double = Double(target.y - current.y)
    
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    
    return distance
}

struct Store {
    let loc: Location
    let name: String
    let deliveryRange = 2.0
    
    func isDeliverable(userLoc: Location) -> Bool {
        let distanceToStore = distance(current: userLoc, target: loc)
        return distanceToStore < deliveryRange
    }
    
}

let store1 = Store(loc: Location(x: 3, y: 5), name: "gs")
let store2 = Store(loc: Location(x: 4, y: 6), name: "seven")
let store3 = Store(loc: Location(x: 1, y: 7), name: "cu")

func printClosesStore(currentLocation: Location, stores:[Store]) {
    var closestStoreName = ""
    var closestStoreDistance = Double.infinity
    var isDeliverable = false
    
    for store in stores {
        let distanceToStore = distance(current: currentLocation, target: store.loc)
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore {
            closestStoreName = store.name
            isDeliverable = store.isDeliverable(userLoc: currentLocation)
        }
    }
    
    print("Closest store: \(closestStoreName), isDeliverable: \(isDeliverable)")
}

let myLocation = Location(x:2, y:5)
let stores = [store1, store2, store3]

printClosesStore(currentLocation: myLocation, stores: stores)

// 정보 단위로 묶으면서 쉽게 표현이 가능
// 정보들간에 관계 표현이 가능하다.

// Sturture vs class
class PersonClass {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct PersonStruct {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let pClass1 = PersonClass(name: "Json", age: 5)
let pClass2 = pClass1
pClass2.name = "Hey"

pClass1.name
pClass2.name
// 이름이 모두 변경

var pStruct1 = PersonStruct(name: "Json", age: 5)
var pStruct2 = pStruct1
pStruct2.name = "Hey"

pStruct1.name
pStruct2.name
// 이름이 부분만 변경

// 도전 과제
// 1. 강의 이름, 강사 이름, 확생수 가지는 Struct (Lecture)
// 2. 강의 어레이와 강사이름을 받아서, 해당 강사와 강사 이름이 출력하는 함수
// 3. 강의 3개 만들고, 가사이르믕로 강의 찾기

struct Lecture {
    let className: String
    let teacherName: String
    let numStudent: Int
}

let lecture1 = Lecture(className: "ios", teacherName: "윤재영", numStudent: 5)
let lecture2 = Lecture(className: "딥러닝", teacherName: "나미코", numStudent: 3)
let lecture3 = Lecture(className: "트위치강의", teacherName: "우왁굳", numStudent: 1)

let lectures = [lecture1, lecture2, lecture3]

func findclassNameByTeacherName(allLectures: [Lecture], queryTeacherName: String) -> String {
//    var result: String = ""
//    for lecture in allLectures{
//        if lecture.teacherName == queryTeacherName {
//            result = lecture.className
//            print("className: \(lecture.className), teacherName: \(lecture.teacherName), numStudent: \(lecture.numStudent)")
//        }
//    }
//
    let result = allLectures.first { $0.teacherName == queryTeacherName }?.className ?? ""
    
    return result
}
let name = findclassNameByTeacherName(allLectures: lectures, queryTeacherName: "윤재영")
print(name)

// Protocol
// Int도 Struct로 구성. 이때 Protocal이 사용
// 꼭 구현해야 될 것, 꼭 해야할 목록

struct Lecture1: CustomStringConvertible { // 설명형으로 출력
    var description: String {
        return "Title \(name), Instructor: \(teacherName)"
    }
    let className: String
    let teacherName: String
    let numStudent: Int
}

// Property
// Object = data + method
// 프로퍼티가 data 부분에 해당
// stored property : 변수로 저장된 프로퍼티
// computed property : 저장된 변수를 이용해서 계산되 프로퍼트 (변경 가능)
// instance property

// type property : 생성된 인스턴스와 상관없이 사용될 수 있는 프로퍼티 static

// Stored property할 때, 바뀔 때 알수 있다.
struct Person {
    var firstName: String {
        willSet { // setting 하기 전에 출력
            print("willset: \(newValue) --> \(firstName)")
        }
        
        didSet { // setting 한 후에 출력
            print("didSet: \(oldValue) --> \(firstName)")
        }
    }
    var lastName: String
    
    lazy var isPopular: Bool = { // 인스턴스에 접근할 때 실행되는 프로퍼티 최적화하기 위해서 사용된다.
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }
    }()
    
    // let의 경우에는 변경불가능
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        
        set {
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    
    static let isAlien: Bool = false
}

var person = Person(firstName: "Json", lastName: "Lee")

person.firstName = "Jim"
person.lastName = "Kim"

person.fullName
// computed preperty는 read만 가능 하지만, 관계만 잘 설정하면 setting도 가능
// getter setter을 이용해서 read, write가 가능
person.fullName = "Jay Park"
person.firstName
person.lastName

Person.isAlien

// computed property와 함수의 차이
// property : 저장된 값을 하나 바환
// Method : 어떤 작업을 한다. 그럼 반환만하는 경우에는 property와 같음

// 사용 기준
// 1. setter가 필요 하면 computed property
// 2. 계산이 많이 필요한다. Method
// 3. DB case, File IO 가 필요한다. Computed property 사용

// Method : 기능을 수행하는 코드 블럭, obejct내에서 수행되는 function
struct Lecture3 {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered: Int = 0
    
    func remainSeats() -> Int {
        let remainSeats = maxStudents - numOfRegistered
        return remainSeats
    }
    
    mutating func register() { // 프로퍼티를 변경할 경우 muatating 명시
        // 등록된 학생수 증가
        numOfRegistered += 1
    }
    
    static let target: String = "Anybody want to learn something"
    static func companyName() -> String {
        return "패캠"
    }
}

var lec = Lecture3(title: "iOS Basic")

lec.remainSeats()

lec.register()
lec.register()

lec.remainSeats()

Lecture3.companyName()

// Method
// 메소드 확장 extension

struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -20)

// 새로운 메소드가 넣지 않고 외부에서 새롭게 추가 가능
extension Math {
    static func square(value: Int) -> Int {
        return value * value
    }
    
    static func half(value: Int) -> Int {
        return value / 2
    }
}

Math.half(value: 10)

extension Int {
    func square() -> Int {
        return self * self
    }
    
    func half() -> Int {
        return self / 2
    }
}

var value: Int = 3
value.half()
value.square()
