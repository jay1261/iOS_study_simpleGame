import UIKit
import Foundation


/*
 변수 : 변할 수 있는 값을
 var 변수명 : 타입 = 값
 */

var name: String = "Jay"
var age: Int = 20

name
name = "예이"

age
age = 30

/*
 상수 : 변하지 않는 일정한 값
 let 상수명: 타입 = 값
 */

let one: Int = 1
let two: Int = 2

// two = 3 // 오류 발생

/*
 함수: 어떤 작업을 수행하는 코드의 집합
 func 함수명(파라미터 이름: 타입) -> 반환타입{
    수행코드 작성
    return 반환값
 }
 */
func sayHello(name: String) -> String{
    return "Nice to meet you \(name)"
}
sayHello(name: "jay")

func introduce(name: String, age: Int) -> String{
    return "Hi, My name is \(name), I'm \(age)"
}

introduce(name: "jay", age: 20)

func add(a:Int, b:Int) -> Int{
    return a+b
}

add(a:10, b:20)

