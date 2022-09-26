import UIKit

// 저장 프로퍼티
//struct Student{
//    var name : String
//    var age: Int
//}
//var jay = Student(name: "jay", age: 20)
//print(jay)

// 연산 프로퍼티
struct WeeklySalary{
    var hourlyWage: Double
    var workingHours: Double
    
    var wage: Double{
        get{
            return hourlyWage * workingHours
        }
        set{
            workingHours = newValue / hourlyWage
        }
    }
}

var myWeeklySalary = WeeklySalary(hourlyWage: 10000, workingHours: 4)
print(myWeeklySalary)
print(myWeeklySalary.wage)
myWeeklySalary.wage = 50000
print(myWeeklySalary.workingHours)
print(myWeeklySalary.wage)


// 프로퍼티 옵저버

struct Student{
    var name : String {
        willSet{
            print("\(name)에서 \(newValue)로 변경")
        }
        didSet{
            print("\(oldValue)에서 \(name)으로 변경")
        }
    }
    
    var age: Int
}
var jay = Student(name: "jay", age: 20)
jay.name = "제이"


// 타입 프로퍼티
struct SomeStruct{
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty : Int{
        return 1
    }
}

print(SomeStruct.storedTypeProperty)
print(SomeStruct.computedTypeProperty)
