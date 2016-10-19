//
//  ViewController.swift
//  SegueDemoUnwind
//
//  Created by Zach Zeleznick on 10/19/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var resultText = "Yo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultText
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? SecondVC {
            var currentInput = resultText
            if !(myTextField.text!.isEmpty) {
                currentInput = myTextField.text!
            }
            dest.resultText = currentInput
        }
    }
    @IBAction func childToParent(segue:UIStoryboardSegue) {
        print(segue.source, segue.destination)
        let source = segue.source as! SecondVC
        print(source.myTextField.text)
        var currentInput = resultText
        if !(source.myTextField.text!.isEmpty) {
            currentInput = source.myTextField.text!
        }
        print(currentInput)
        resultLabel.text = currentInput
    }
    
}

