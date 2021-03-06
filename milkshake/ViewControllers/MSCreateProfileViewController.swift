//
//  MSCreateProfileViewController.swift
//  milkshake
//
//  Created by Brian Correa on 5/18/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class MSCreateProfileViewController: MSViewController, UITextFieldDelegate {

    //MARK: - Properties
    
    static let fields = ["E-mail", "Image", "Password"]
    var field: UITextField!
    var nxtBtn: UIButton!
    var pageControl: UIPageControl!
    var step = 0
    
    var textFields = Array<UITextField>()
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = "Register Profile"
    }
    
    override func loadView() {
        
        var placeholder = ""
        var bgColor = UIColor.whiteColor()
        var btnText = "Hello there"
        
        switch self.step {
            case 0:
                placeholder = "E-mail"
                bgColor = UIColor(red: 0.25, green: 0.25, blue: 1, alpha: 1)
                btnText = "Next"
            
            case 1:
                placeholder = "Profile Picture (Optional)"
                bgColor = UIColor(red: 0.25, green: 0.75, blue: 0.25, alpha: 1)
                btnText = "Next"
            
            case 2:
                placeholder = "Password"
                bgColor = UIColor(red: 0.8, green: 0.25, blue: 0.25, alpha: 1)
                btnText = "Finish"
            
            default:
                break
        }
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.redColor()
        self.edgesForExtendedLayout = .None
        
        let padding = CGFloat(20)
        
        let xMark = UIImage(named: "x-mark.png")
        let btnCancel = UIButton(frame: CGRect(x: padding, y: 4*padding, width: xMark!.size.width, height: xMark!.size.height))
        btnCancel.setImage(xMark, forState: .Normal)
        btnCancel.autoresizingMask = .FlexibleTopMargin
        btnCancel.addTarget(self, action: #selector(MSCreateProfileViewController.cancel(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(btnCancel)
        
        var y = 0.30*frame.size.height
        let h = CGFloat(32)
        let width = frame.size.width-2*padding
        
        self.field = UITextField(frame: CGRect(x: padding, y: y, width: width, height: h))
        self.field.delegate = self
        self.field.autoresizingMask = .FlexibleTopMargin
        self.field.font = UIFont(name: "Heiti SC", size: 16)
        self.field.textColor = .whiteColor()
        self.field.autocorrectionType = .No
        self.field.borderStyle = .None
        self.field.backgroundColor = UIColor.greenColor()
        
        let transparent = UIColor(red: 1, green: 1, blue: 1, alpha: 0.65)
        self.field.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSForegroundColorAttributeName: transparent])
        
        view.addSubview(self.field)
        
        y += self.field.frame.size.height
        
        self.nxtBtn = UIButton(frame: CGRect(x: padding, y: y, width: width, height: 44))
        self.nxtBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.nxtBtn.setTitle(btnText, forState: .Normal)
        self.nxtBtn.titleLabel?.font = self.field.font
        self.nxtBtn.layer.borderColor = UIColor.whiteColor().CGColor
        self.nxtBtn.layer.borderWidth = 2.0
        self.nxtBtn.layer.cornerRadius = 0.5*self.nxtBtn.frame.size.height
        self.nxtBtn.alpha = 1
        view.addSubview(self.nxtBtn)
        y += self.nxtBtn.frame.size.height+padding
        
        self.pageControl = UIPageControl(frame: CGRect(x: padding, y: y, width: width, height: 20))
        self.pageControl.numberOfPages = MSCreateProfileViewController.fields.count
        self.pageControl.currentPage = self.step
        self.pageControl.alpha = 1
        view.addSubview(self.pageControl)
        
//        let fields = ["name", "username", "password"]
//        let padding  = CGFloat(20)
//        let width = frame.size.width
//        let height = CGFloat(32)
//        
//        var y = CGFloat(150)
//        
//        for field in fields{
//            let textfield = UITextField(frame: CGRect(x: padding, y: y, width: width-2*padding, height: height))
//            
//            textfield.delegate = self
//            textfield.placeholder = field
//            textfield.borderStyle = .RoundedRect
//            view.addSubview(textfield)
//            textFields.append(textfield)
//            y += height + padding
//        }
        
        self.view = view
    }
    
    func cancel (btn: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
