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
 
 4. 음악 파일을 추가한다
 5. AVFoundation 프레임워크 추가
 6. AVAudioPlayer 객체를 만들어 음악을 재생
 */

import UIKit
import AVFoundation


class ViewController: UIViewController, SettingDelegate, RestartDelegate{
    

    
    @IBOutlet weak var computerBallCountLabel: UILabel!
    @IBOutlet weak var userBallCountLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var firstImage: UIImageView!
    
    var player: AVAudioPlayer?
    var comBallCount: Int = 20
    var userBallCount: Int = 20
    var result: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        computerBallCountLabel.text = String(comBallCount)
        userBallCountLabel.text = String(userBallCount)
        self.imageContainer.isHidden = true
        
        play(fileName: "intro")
        
    }

    @IBAction func gameStartPressed(_ sender: Any) {
        self.imageContainer.isHidden = false
        
        self.play(fileName: "gamestart")
        
        UIView.animate(withDuration: 3.0) {
            self.firstImage.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.firstImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { _ in
            self.imageContainer.isHidden = true
            self.showAlert()
        }
    }
    
    
    
    @IBAction func settingBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingVC = storyboard.instantiateViewController(identifier: "SettingViewController") as SettingViewController
        
        settingVC.settingDelegate = self
        
        settingVC.modalPresentationStyle = .fullScreen
        self.present(settingVC, animated: true, completion: nil)
        
    }
        
    func showAlert(){
        
        let alert = UIAlertController.init(title: "Game Start", message: "홀 짝을 선택해주세요.", preferredStyle: .alert)
        
        let oddBtn = UIAlertAction(title: "홀", style: .default){ _ in
//            print("홀 버튼을 클릭했습니다.")
            self.play(fileName: "click")  // 효과음
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
//            print("짝 버튼을 클릭했습니다.")
            self.play(fileName: "click")  // 효과음
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
        return balls <= 0
    }
    
    func calculateBalls(winner: String, count: Int){
        if winner == "com" {
            self.userBallCount -= count
            self.comBallCount += count
            
            if self.checkAccountEmpty(balls: self.userBallCount){
                self.resultLabel.text = "컴퓨터 최종승리"
                self.result = "컴퓨터 최종승리"
                gameEnd()
            }
        }
        else{
            self.comBallCount -= count
            self.userBallCount += count
            if self.checkAccountEmpty(balls: self.comBallCount){
                self.resultLabel.text = "사용자 최종 승리"
                self.result = "사용자 최종승리"
                gameEnd()
            }
        }
        
        self.userBallCountLabel.text = "\(self.userBallCount)"
        self.computerBallCountLabel.text = "\(self.comBallCount)"
    }
    
    // 음악 재생 함수
    func play(fileName: String){
        let filePath = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        print("filePath : \(filePath)")
        guard let path = filePath else{
            return
        }
//        self.player = try? AVAudioPlayer(contentsOf: path)
        do{
            self.player = try AVAudioPlayer(contentsOf: path)
            
            guard let soundPlayer = self.player else{
                return
            }
            soundPlayer.prepareToPlay()
            soundPlayer.play()
            
        }catch let error{
            print("\(error.localizedDescription)")
        }
    }
    
    func gameEnd(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let endVC = storyboard.instantiateViewController(identifier: "EndViewController") as EndViewController
        
        endVC.resultText = result
        endVC.restartDelegate = self
        self.navigationController?.pushViewController(endVC, animated: true)
    }
    
    func getBallsCount(ballsCount: Int) {
        self.userBallCount = ballsCount
        self.comBallCount = ballsCount
        self.userBallCountLabel.text = "\(ballsCount)"
        self.computerBallCountLabel.text = "\(ballsCount)"
    }
    
    func resetGame(ballsCount: Int, resultScreen: String) {
        self.userBallCount = ballsCount
        self.comBallCount = ballsCount
        self.userBallCountLabel.text = "\(ballsCount)"
        self.computerBallCountLabel.text = "\(ballsCount)"
        self.resultLabel.text = resultScreen
    }
    
    
}

