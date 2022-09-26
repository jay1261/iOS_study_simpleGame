//
//  ViewController.swift
//  DelegatePatternDemo
//
//  Created by 문호상 on 2022/09/14.
//

import UIKit

class ViewController: UIViewController, UserInfoDelegate {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var useAgeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "InputViewController") as InputViewController
        // delegate 셀프로
        viewController.delegate = self
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func getUserInfo(name: String, age: String) {
        print("userName \(name), userAge \(age)")
        self.userNameLabel.text = name
        self.useAgeLabel.text = age
    }
}

