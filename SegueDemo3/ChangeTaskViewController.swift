//
//  ChangeTaskViewController.swift
//  SegueDemo3
//
//  Created by Lucy Xiao on 10/17/16.
//  Copyright © 2016 Lucy Xiao. All rights reserved.
//

import UIKit

class ChangeTaskViewController: UIViewController {

    @IBOutlet var doneButton: UIButton!
    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Everytime you segue, you will call the prepare function
    //In this prepare function, you can pass your data

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as! UINavigationController
        let tvc = nav.topViewController as! TaskViewController

        tvc.task = textField.text
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
