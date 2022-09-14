//
//  InputViewController.swift
//  DelegatePatternDemo
//
//  Created by 문호상 on 2022/09/14.
//

import UIKit

protocol UserInfoDelegate{
    func getUserInfo(name: String, age: String)
}

class InputViewController: UIViewController {

    var delegate: UserInfoDelegate?
    @IBOutlet weak var userNameTextInput: UITextField!
    @IBOutlet weak var userAgeTextInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func setUserInfo(_ sender: UIButton) {
        
        guard let userName = self.userNameTextInput.text, let userAge = self.userAgeTextInput.text else{
            print("사용자 정보가 없습니다.")
            return
        }
        
        self.delegate?.getUserInfo(name: userName, age: userAge)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
