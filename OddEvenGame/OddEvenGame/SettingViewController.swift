//
//  SettingViewController.swift
//  OddEvenGame
//
//  Created by 문호상 on 2022/09/14.
//

import UIKit

protocol SettingDelegate{
    func getBallsCount(ballsCount: Int)
}

class SettingViewController: UIViewController {
    
    var settingDelegate : SettingDelegate?
    @IBOutlet weak var ballsCountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func completeBtnPressed(_ sender: Any) {
        guard let ballsStr = self.ballsCountTextField.text, let balls = Int(ballsStr) else {
            self.settingDelegate?.getBallsCount(ballsCount: 10)
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        self.settingDelegate?.getBallsCount(ballsCount: balls)
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
