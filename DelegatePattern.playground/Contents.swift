import UIKit

/* Delegate Pattern
 - 한 클래스와 다른 클래스의 상호작용을 간단하게 할 수 있다.
 - 프로토콜을 이용해서 클래스 간 요구사항의 전달이 수월해진다.
 - 클래스 또는 구조체를 상속할 필요가 없어서 가볍게 사용할 수 있다.

 내가 풀기 어려운 수학문제를
 수학천재에게 풀어달라 한다
 숙제를 풀어달라하면 풀어준다는 약속을 한다.
 */
protocol HomeDelegate{
    func solveMathoProblems()
}


//프로토콜 채탹
class Me : HomeDelegate{
    var harry = MathMaster()
    
    func askForHelp(){
        // 해리 일리게이트에 셀프를 넣어줌으로써 Me 가 넘기는 것임을 의미 (시키는 주체를 넣음)
        self.harry.delegate = self
        self.harry.didHomeWork()
        
    }
    func solveMathoProblems() {
        print("숙제가 완료 되었습니다.")
    }
}

class MathMaster{
    
    // 프로토콜을 프로퍼티로 선언
    var delegate: HomeDelegate?
    
    func didHomeWork(){
        self.delegate?.solveMathoProblems()
    }
}

var jay = Me()
jay.askForHelp()

