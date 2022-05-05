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
        self.view.addSubview(self.onButton)
        self.view.addSubview(self.offButton)
        self.view.addSubview(self.testBtn)
        
        setOnButtonLayout()
        setOffButtonLayout()
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
    
    lazy var onButton:UIButton = {
        let button :UIButton = UIButton()
        button.setTitle("view on", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(onButton(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func onButton(sender:UIButton) {
        self.label.text = "On"
        self.label.backgroundColor = UIColor.orange
    }
    
    
    lazy var offButton:UIButton = {
        let button :UIButton = UIButton()
        button.setTitle("view off", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.tag = 0
        button.addTarget(self, action: #selector(offButton(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func offButton(sender:UIButton) {
        self.label.text = "Off"
        self.label.backgroundColor = UIColor.gray
    }
    
    // test button
    lazy var testBtn:UIButton = {
        let button :UIButton = UIButton()
        button.setTitle("test button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(onClickTestButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func onClickTestButton(sender:UIButton) {
        let tabBarSB = UIStoryboard(name: "TabBar", bundle: nil)
        let tabBarController = tabBarSB.instantiateViewController(withIdentifier: "HomeTabBarController") as! HomeTabBarController
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    
    
  
    func setOnButtonLayout() {
        onButton.translatesAutoresizingMaskIntoConstraints = false
        onButton.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 30).isActive = true
        onButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        onButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    func setOffButtonLayout() {
        offButton.translatesAutoresizingMaskIntoConstraints = false
        offButton.topAnchor.constraint(equalTo: onButton.bottomAnchor,constant: 5).isActive = true
        offButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        offButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    func setTestBtnLayout() {
        testBtn.translatesAutoresizingMaskIntoConstraints = false
        testBtn.topAnchor.constraint(equalTo: offButton.bottomAnchor,constant: 30).isActive = true
        testBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        testBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
   
    
   
  

    
}
