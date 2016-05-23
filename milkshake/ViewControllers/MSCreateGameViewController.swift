//
//  MSCreateGameViewController.swift
//  milkshake
//
//  Created by Brian Correa on 5/22/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class MSCreateGameViewController: MSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.blueColor()
        
        self.view = view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
