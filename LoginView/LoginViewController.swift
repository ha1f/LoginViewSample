//
//  LoginViewController.swift
//  LoginView
//
//  Created by 山口 智生 on 2015/09/30.
//  Copyright © 2015年 NextVanguard. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // 設定項目
    let borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    let boxOffsetY: CGFloat = 200
    let boxOffsetY2: CGFloat = 330
    
    //logo
    let logoLabel = UILabel()
    
    // for pattern1
    let borderView: UIView = UIView()
    let idField = UITextField()
    let passField = UITextField()
    
    // for pattern2
    let idField2 = UITextField()
    let passField2 = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let boxWidth = self.view.frame.width - 50
        let boxHeight: CGFloat = 50
        

        pattern1(boxWidth, boxHeight: boxHeight)
        pattern2(boxWidth, boxHeight: boxHeight)

        
        // tapGesture
        let gestureTap = UITapGestureRecognizer(target: self, action: "resignFirstResponderAllIfNeed")
        self.view.addGestureRecognizer(gestureTap)
        
        // logo
        logoLabel.frame = CGRectMake(50, boxOffsetY-130, self.view.frame.width-100, 100)
        logoLabel.text = "LOGO"
        logoLabel.font = UIFont.systemFontOfSize(80)
        logoLabel.textAlignment = NSTextAlignment.Center
        logoLabel.textColor = UIColor.blackColor()
        self.view.addSubview(logoLabel)
    }
    
    func pattern1(boxWidth: CGFloat, boxHeight: CGFloat) {
        borderView.frame = CGRectMake((self.view.frame.width - boxWidth)/2, boxOffsetY, boxWidth, boxHeight * 2)
        borderView.layer.borderColor = borderColor.CGColor
        borderView.layer.borderWidth = 1.0
        borderView.layer.cornerRadius = 5.0
        borderView.layer.masksToBounds = true
        //中央線
        UIGraphicsBeginImageContextWithOptions(borderView.frame.size, false, 0)
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, boxHeight));
        path.addLineToPoint(CGPointMake(boxWidth, boxHeight))
        borderColor.setStroke()
        path.lineWidth = 1.0
        path.stroke()
        borderView.layer.contents = UIGraphicsGetImageFromCurrentImageContext().CGImage
        UIGraphicsEndImageContext()
        self.view.addSubview(borderView)
        
        idField.frame = CGRectMake(7, 0, boxWidth-10, boxHeight)
        idField.placeholder = "ユーザーID"
        idField.borderStyle = UITextBorderStyle.None
        idField.returnKeyType = UIReturnKeyType.Done
        idField.delegate = self
        borderView.addSubview(idField)
        
        passField.frame = CGRectMake(7, boxHeight, boxWidth-10, boxHeight)
        passField.placeholder = "パスワード"
        passField.borderStyle = UITextBorderStyle.None
        passField.returnKeyType = UIReturnKeyType.Done
        passField.secureTextEntry = true
        passField.delegate = self
        borderView.addSubview(passField)
    }
    
    func pattern2(boxWidth: CGFloat, boxHeight: CGFloat) {
        idField2.frame = CGRectMake((self.view.frame.width - boxWidth)/2, boxOffsetY2, boxWidth, boxHeight)
        idField2.placeholder = "ユーザーID"
        idField2.layer.borderColor = UIColor.lightGrayColor().CGColor
        idField2.borderStyle = UITextBorderStyle.RoundedRect
        idField2.returnKeyType = UIReturnKeyType.Done
        idField2.layer.shadowOpacity = 0.0
        idField2.delegate = self
        self.view.addSubview(idField2)
        
        passField2.frame = CGRectMake((self.view.frame.width - boxWidth)/2, boxOffsetY2 + boxHeight - 1, boxWidth, boxHeight)
        passField2.placeholder = "パスワード"
        passField2.layer.borderColor = UIColor.lightGrayColor().CGColor
        passField2.borderStyle = UITextBorderStyle.RoundedRect
        passField2.returnKeyType = UIReturnKeyType.Done
        passField2.secureTextEntry = true
        passField2.layer.shadowOpacity = 0.0
        passField2.delegate = self
        self.view.addSubview(passField2)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponderIfNeed()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ここで閉じるとかっこいい
    override func viewWillDisappear(animated: Bool) {
        resignFirstResponderAllIfNeed()
    }
    
    func resignFirstResponderAllIfNeed() {
        idField.resignFirstResponderIfNeed()
        passField.resignFirstResponderIfNeed()
        idField2.resignFirstResponderIfNeed()
        passField2.resignFirstResponderIfNeed()
    }

}

extension UITextField {
    func resignFirstResponderIfNeed() {
        if self.isFirstResponder() {
            self.resignFirstResponder()
        }
    }
}

