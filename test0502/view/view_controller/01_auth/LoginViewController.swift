//
//  LoginViewController.swift
//  test0502
//
//  Created by spring on 2022/05/02.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.label)
//        self.view.addSubview(self.controlSwitch)
        self.view.addSubview(self.loginSignupSwitchBtn)
        self.view.addSubview(self.testBtn)
        
        setSwitchBtnLayout()
        setTestBtnLayout()
    }
    
    
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        label.backgroundColor = UIColor.gray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 75.0
        label.textColor = UIColor.white
        label.shadowColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.textAlignment = NSTextAlignment.center
        label.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        label.text = "On"
        
        return label
    }()
    
    lazy var loginSignupSwitchBtn:UIButton = {
        let button :UIButton = UIButton()
        button.setTitle("view change", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        
        return button
    }()
    
    
    lazy var testBtn:UIButton = {
        let button :UIButton = UIButton()
        button.setTitle("test button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(onClickTestButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var controlSwitch: UISwitch = {
        let swicth: UISwitch = UISwitch()
        swicth.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 200)
        swicth.tintColor = UIColor.orange
        swicth.isOn = true
        swicth.addTarget(self, action: #selector(onClickSwitch(sender:)), for:UIControl.Event.valueChanged)
        
        return swicth
    }()
    
    func setSwitchBtnLayout() {
        loginSignupSwitchBtn.translatesAutoresizingMaskIntoConstraints = false
        loginSignupSwitchBtn.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 30).isActive = true
        loginSignupSwitchBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        loginSignupSwitchBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    func setTestBtnLayout() {
        testBtn.translatesAutoresizingMaskIntoConstraints = false
        testBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor,constant: 30).isActive = true
        testBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        testBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
   
    @objc func onClickTestButton(sender:UIButton) {
        print("버튼 클릭")
        
        let tabBarSB = UIStoryboard(name: "TabBar", bundle: nil)
        let tabBarController = tabBarSB.instantiateViewController(withIdentifier: "HomeTabBarController") as! HomeTabBarController
        self.navigationController?.pushViewController(tabBarController, animated: true)

    }
    
    @objc func onClickSwitch(sender: UISwitch) {
        var text: String!
        var color: UIColor!
        if sender.isOn {
            text = "On"
            color = UIColor.gray
        } else {
            text = "Off"
            color = UIColor.orange
        }
        self.label.text = text
        self.label.backgroundColor = color
    }

    
}
