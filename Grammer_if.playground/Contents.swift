import UIKit

var isChecked = false

// if문
if(isChecked){
    print("체크되어 있습니다")
}
else{
    print("체크되어있지 않습니다")
}

// if, else if, else
var time = 9
if (time == 9) {
    print("아침식사 시간입니다.")
}
else if (time == 12){
    print("점심식사 시간입니다.")
}
else if(time == 19){
    print("저녁식사 시간입니다.")
}
else{
    print("자유시간입니다.")
}

// switch case 문
let color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

switch color{
case #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1):
    print("흰색입니다.")
case #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1):
    print("녹색입니다.")
case #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1):
    print("검정색입니다.")
default:
    print("비교할 수 있는 색상이 없습니다.")
}


// guard 문

func getName(name: String?) -> String{
    guard let uName = name
    else{
        return "이름 값이 존재하지 않습니다"
    }
    return uName
}

getName(name: "jay")
getName(name: nil)
