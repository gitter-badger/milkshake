//
//  MSCreateProfileViewController.swift
//  milkshake
//
//  Created by Brian Correa on 5/18/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class MSCreateProfileViewController: MSViewController, UITextFieldDelegate {

    var textFields = Array<UITextField>()
    
    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(red: 255/255, green: 44/255, blue: 0/255, alpha: 1)
        
        let fields = ["name", "username", "password"]
        let padding  = CGFloat(20)
        let width = frame.size.width
        let height = CGFloat(32)
        
        var y = CGFloat(150)
        
        for field in fields{
            let textfield = UITextField(frame: CGRect(x: padding, y: y, width: width-2*padding, height: height))
            
            textfield.delegate = self
            textfield.placeholder = field
            textfield.borderStyle = .RoundedRect
            view.addSubview(textfield)
            textFields.append(textfield)
            y += height + padding
        }
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
