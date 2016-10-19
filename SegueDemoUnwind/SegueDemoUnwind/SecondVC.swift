//
//  SecondVC.swift
//  SegueDemoUnwind
//
//  Created by Zach Zeleznick on 10/19/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var resultText = "Yo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultText
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare called")
    }
    
}

