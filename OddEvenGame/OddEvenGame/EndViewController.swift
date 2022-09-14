//
//  EndViewController.swift
//  OddEvenGame
//
//  Created by 문호상 on 2022/09/15.
//

import UIKit

protocol RestartDelegate{
    func resetGame(ballsCount: Int, resultScreen: String)
}

class EndViewController: UIViewController{
    
    var restartDelegate: RestartDelegate?
    @IBOutlet weak var resultLabel: UILabel!
    var resultText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultLabel.text = resultText
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func restartBtnPressed(_ sender: Any) {
        let ballsCount = 20
        let resultScreen = "결과화면"
        
        restartDelegate?.resetGame(ballsCount: ballsCount, resultScreen: resultScreen)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
