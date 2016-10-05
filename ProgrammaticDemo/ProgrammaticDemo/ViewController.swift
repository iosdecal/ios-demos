//
//  ViewController.swift
//  ProgrammaticDemo
//
//  Created by Zach Zeleznick on 10/4/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class ViewController: BaseController {
    
    let timeContainer = UIView()
    let timeLabel = UILabel()
    let timeTitle = UILabel()
    let hiddenLabel = UILabel()
    let funButton = CustomButton()
    let hiddenButton = CustomButton()
    var bottomButtonConstraint: NSLayoutConstraint!
    var bottomPanelConstraint: NSLayoutConstraint!
    
    var start: Date!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Magical Layouts"
        view.backgroundColor = UIColor(rgb: 0xFF8B40)
        
        setupAnimateButton()
        setupMainView()

        start = Date()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    
    // MARK: Adjust Panel and Hidden Button Constraints
    func toggleHiddenButton(_ sender: AnyObject) {
        let prior = self.hiddenButton.alpha
        print("Toggled from alpha: \(Int(prior))")
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.hiddenButton.alpha = 1 - prior
            if prior == 0 {
                self.bottomButtonConstraint.constant = -10
                self.bottomPanelConstraint.constant = -20
            }
            else {
                self.bottomButtonConstraint.constant = 100
                self.bottomPanelConstraint.constant = -60
            }
            self.view.layoutIfNeeded()
        })
    }
    
    func setupMainView() {
        view.addUIElement(funButton, text: "Click Me", frame: CGRect(x: 30, y: 90, width: w-60, height: 80)) { element in
            guard let button = element as? UIButton else { return }
            button.addTarget(self, action: #selector(toggleHiddenButton(_:)), for: .touchUpInside)
        }
        view.addUIElement(timeContainer, frame: CGRect(x: 30, y: h-160, width: w-60, height: 126)) { element in
            guard let container = element as? UIView else { return }
            container.backgroundColor = UIColor(rgb: 0xCC4214)
            container.layer.cornerRadius = 4
            container.translatesAutoresizingMaskIntoConstraints = false
        }
        // Auto Layout Rules
        let leftEdge = NSLayoutConstraint(item: timeContainer, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 30)
        let rightEdge = NSLayoutConstraint(item: timeContainer, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -30)
        let tHeight = NSLayoutConstraint(item: timeContainer, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        bottomPanelConstraint = NSLayoutConstraint(item: timeContainer, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: hiddenButton, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: -60)
        
        view.addConstraints([leftEdge, rightEdge, tHeight, bottomPanelConstraint])
        
        timeContainer.addUIElement(timeLabel, text: "0:00.00", frame: CGRect(x: 8, y: 31, width: w-76, height: 95)) { element in
            guard let label = element as? UILabel else { return }
            label.font = UIFont(name: "HelveticaNeue-Thin", size: 80)
            label.textColor = UIColor.white
        }
        timeContainer.addUIElement(timeTitle, text: "TIME ELAPSED", frame: CGRect(x: 8, y: 11, width: w-76, height: 20.5)) { element in
            guard let label = element as? UILabel else { return }
            label.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
            label.textColor = UIColor.white
        }
    }
    
    func setupAnimateButton() {
        view.addUIElement(hiddenButton, text: "Secret Button", frame: CGRect(x: 0, y: 0, width: w-60, height: 80)) { element in
            guard let button = element as? UIButton else { return }
            button.addTarget(self, action: #selector(secretRevealer), for: .touchUpInside)
            button.alpha = 0
            // Disable Autoresizing constraints
            button.translatesAutoresizingMaskIntoConstraints = false
        }
        // Auto Layout Rules
        let leftEdge = NSLayoutConstraint(item: hiddenButton, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 30)
        let rightEdge = NSLayoutConstraint(item: hiddenButton, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -30)
        let bHeight = NSLayoutConstraint(item: hiddenButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80)
        bottomButtonConstraint = NSLayoutConstraint(item: hiddenButton, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 100)
        
        view.addConstraints([leftEdge, rightEdge,
                             bHeight, bottomButtonConstraint])
        
        view.addUIElement(hiddenLabel, text: "Mmmmmmmm", frame: CGRect(x: 30, y: 300, width: w-60, height: 40)) { element in
            guard let label = element as? UILabel else { return }
            label.font = UIFont(name: "HelveticaNeue-Light", size: 42)
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.alpha = 0
        }
        
    }
    // MARK: Secret Message Revealer
    func secretRevealer(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
             self.hiddenLabel.alpha = 1 - self.hiddenLabel.alpha
        })
    }
    
    // MARK: Timer Logic
    func updateTimer(_ timer: Timer) {
        let seconds = -start.timeIntervalSinceNow
        let dateComponentFormatter = DateComponentsFormatter()
        dateComponentFormatter.unitsStyle = DateComponentsFormatter.UnitsStyle.positional
        dateComponentFormatter.allowedUnits = [NSCalendar.Unit.minute, NSCalendar.Unit.second, NSCalendar.Unit.hour]
        dateComponentFormatter.zeroFormattingBehavior = DateComponentsFormatter.ZeroFormattingBehavior.pad
        
        let timeString = dateComponentFormatter.string(from: seconds)
        timeLabel.text = timeString
    }


}

/*  
 Original Credits to Paul Solt
 Adapted from http://iphonedev.tv/AutoLayoutUIButton
 */

