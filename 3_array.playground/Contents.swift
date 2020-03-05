import UIKit

// collection : 많은 변수들을 한번에 관리하기 위한 것
// Array, Dictionary, Set

// 1. Array : 순서에 따라 element를 저장
// 같은 type만 가능, 순서가 존재
// 순서가 있는 요소를 저장할 때 좋다.

var evenNumbers: [Int] = [2, 4, 6, 8] // let일 때 추가 삭제 불가능
let evenNumbers2: Array<Int> = [2, 4, 6, 8]

evenNumbers.append(10) // 1개만
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18, 20]) // 여러개

let isEmpty = evenNumbers.isEmpty

let countNumber = evenNumbers.count

let firstItem = evenNumbers.first // Optional로 변환 값이 빈칸일 경우, nil일 수 잇기 때문에 optional 로 존재
let lastItem = evenNumbers.last

if let firstElement = evenNumbers.first {
    print(firstElement)
} else {
    print("없다")
}

evenNumbers.min() // 약시 optional로 반환
evenNumbers.max()

let secondItem = evenNumbers[2]
let lastItem2 = evenNumbers[9]

let firstThree = evenNumbers[0...2]

evenNumbers.contains(4)

evenNumbers.insert(0, at: 0)

//evenNumbers.removeAll()
evenNumbers.remove(at: 4)

evenNumbers = [1, 2, 3, 4, 5, 6]

evenNumbers[0] = -2
evenNumbers[0...1] = [-2, 0, 2]

evenNumbers.swapAt(0, 1)

for num in evenNumbers{
    print(num)
}

for (idx, num) in evenNumbers.enumerated() {
    print("idx: \(idx), num: \(num)")
}

evenNumbers.dropFirst(3)
evenNumbers.dropLast(2)

// 영향을 주지 않고 반한
let firstThree2 = evenNumbers.prefix(3)
firstThree2

let lastThree = evenNumbers.suffix(3)
lastThree

// 제일 많이 쓰이는 것
// isEmpty
// count
// indexing
// enumerated

