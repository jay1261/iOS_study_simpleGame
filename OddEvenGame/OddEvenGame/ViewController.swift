//
//  ViewController.swift
//  OddEvenGame
//
//  Created by 문호상 on 2022/09/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var computerBallCountLabel: UILabel!
    
    @IBOutlet weak var userBallCountLabel: UILabel!
    var comBallCount: Int = 20
    var userBallCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        computerBallCountLabel.text = String(comBallCount)
        userBallCountLabel.text = String(userBallCount)
    }


}

