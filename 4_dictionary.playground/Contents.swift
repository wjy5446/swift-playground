import UIKit

// 2. Dictionary
// 요소에 이름을 정해두는 통
// key : 이름, value : 값
// key는 구분자가 되어야 한다.
// 순서에 상관없음, 순서가 보장되지 않는다.

var scoreDict: [String: Int] = ["Json": 80, "Jay": 95]
var scoreDict2: Dictionary<String, Int> = ["Json": 80, "Jay": 95]

scoreDict["Json"]
scoreDict["Jerry"] // 없을 때는 nil 출력

if let score = scoreDict["Jerry"] {
    score
} else {
    print("아아아아")
}


scoreDict.isEmpty

// update
scoreDict["Json"] = 00

// add
scoreDict["Jsake"] = 100
scoreDict

// remove
scoreDict["Jaske"] = nil
scoreDict

for (name, score) in scoreDict{
    print("name: \(name), score: \(score)")
}

for key in scoreDict.keys {
    print("key \(key)")
}

// 도전과제
// 1. 본인 dict 제작
var me: [String: String] = ["name": "yoon", "job": "computer", "city": "seoul"]
me["city"] = "Busan"
me

func printMe(dic: [String: String]){
    if let name = dic["name"], let job = ["job"], let city = dic["city"]{
        print(name, job)
    } else {
        print("no")
    }
}
