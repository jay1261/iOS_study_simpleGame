//
//  ViewController.swift
//  OddEvenGame
//
//  Created by 문호상 on 2022/09/08.
//

/*
 1. 게임 시작버튼을 누르면 컴퓨터가 1~10까지 랜덤으로 숫자 선택
 2. 사용자는 가진 구슬 개수를 걸고 홀짝 중 하나를 선택
 3. 결과값이 화면에 보여짐
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var computerBallCountLabel: UILabel!
    @IBOutlet weak var userBallCountLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var firstImage: UIImageView!
    
    
    var comBallCount: Int = 20
    var userBallCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        computerBallCountLabel.text = String(comBallCount)
        userBallCountLabel.text = String(userBallCount)
        self.imageContainer.isHidden = true
    }

    @IBAction func gameStartPressed(_ sender: Any) {
        self.imageContainer.isHidden = false
        
        UIView.animate(withDuration: 3.0) {
            self.firstImage.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.firstImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { _ in
            self.imageContainer.isHidden = true
            self.showAlert()
        }
    }
    
    
    
    func showAlert(){
        
        let alert = UIAlertController.init(title: "Game Start", message: "홀 짝을 선택해주세요.", preferredStyle: .alert)
        
        let oddBtn = UIAlertAction(title: "홀", style: .default){ _ in
            print("홀 버튼을 클릭했습니다.")
            
            guard let input = alert.textFields?.first?.text else{
                return
            }
            print("입력한 값은 \(input)입니다.")
            
            guard let value = Int(input) else{
                return
            }
            
            self.getWinner(count: value, select: "홀")
        }
        let evenBtn = UIAlertAction(title: "짝", style: .default) { _ in
            print("짝 버튼을 클릭했습니다.")
            
            guard let input = alert.textFields?.first?.text, let value = Int(input) else{
                return
            }
            print("입력한 값은 \(input)입니다.")
            self.getWinner(count: value, select: "짝")
        }
        
        alert.addTextField {textField in
            textField.placeholder = "베팅할 구슬의 개수를 입력해주세요."
        }
        
        
        alert.addAction(oddBtn)
        alert.addAction(evenBtn)
        
        self.present(alert, animated: true){
            print("화면이 띄워졌습니다.")
        }

    }
    
    
    func getRandom() -> Int{
        return Int(arc4random_uniform(10) + 1)
    }
    
    func getWinner(count: Int, select: String){
        let com = self.getRandom()
//        print(com)
        let comType = com % 2 == 0 ? "짝" : "홀"
        
        var result = comType
        if(select == comType){
            print("User win")
            result = result + ("(User win)")
            self.resultLabel.text = result
            self.calculateBalls(winner: "user", count: count)
        }
        else{
            print("Computer win")
            result = result + "(Com win)"
            self.resultLabel.text = result
            self.calculateBalls(winner: "com", count: count)
        }
    }
    
    func checkAccountEmpty(balls: Int) -> Bool{
        return balls == 0
    }
    
    func calculateBalls(winner: String, count: Int){
        if winner == "com" {
            self.userBallCount -= count
            self.comBallCount += count
            
            if self.checkAccountEmpty(balls: self.userBallCount){
                self.resultLabel.text = "컴퓨터 최종승리"
            }
        }
        else{
            self.comBallCount -= count
            self.userBallCount += count
            if self.checkAccountEmpty(balls: self.comBallCount){
                self.resultLabel.text = "사용자 최종 승리"
            }
        }
        
        self.userBallCountLabel.text = "\(self.userBallCount)"
        self.computerBallCountLabel.text = "\(self.comBallCount)"
    }
}

