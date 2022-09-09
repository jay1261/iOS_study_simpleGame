import UIKit

// 데이터 타입
// Bool : 참, 거짓

var isChecked:Bool = false
isChecked = true

// Int : 64bit Integer
var temperature: Int = -100
temperature = 100

// UInt : 64bit 양의 정수
var cakes: UInt = 100
//cakes = -100

// Float: 32bit 부동소수형
var pi: Float = 3.14
pi = 314
print(pi)
// Double: 64bit 부동소수형
var pi2 : Double = 3.14
pi2 = 314

// character: 한 문자를 표현
var sampleCharacter: Character = "A"
sampleCharacter = "가"
//sampleCharacter = "ab"

// String: 여러 문자 표현
var sampleString: String = "Hi"
sampleString = "안녕하세요"

// 타입 추론
var test = 100
type(of: test)

var testString = "타입추론"
type(of: testString)

// Any: 모든 타입을 지칭하는 키워드
var sampleAny: Any = "any"
sampleAny = 10
sampleAny = 3.14

// nil 은 다른 언어의 null
var sampleInt: Int? = nil
type(of: sampleInt)

var sampleString2: String? = nil
type(of: sampleString2)


