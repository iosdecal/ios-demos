//
//  TaskViewController.swift
//  SegueDemo3
//
//  Created by Lucy Xiao on 10/17/16.
//  Copyright © 2016 Lucy Xiao. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    var task : String?

    @IBOutlet var taskLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if task != nil {
            taskLabel.text = task
        } else {
            taskLabel.text = "No task"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
