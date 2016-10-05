//
//  ViewExtension.swift
//  ProgrammaticDemo
//
//  Created by Zach Zeleznick on 10/4/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

extension UIView {
    
    func placeUIElement<T: UIView>(_ element: T, frame: CGRect) {
        element.frame = frame
        self.addSubview(element)
    }
    
    func addBorder<T: UIView>(_ myInput: T, height: CGFloat? = 1) {
        let border = CALayer()
        border.backgroundColor = UIColor(rgb: 0xCDCDCD).cgColor
        border.frame = CGRect(x:0, y:myInput.frame.size.height-(1.0 + height!),
                              width: myInput.frame.size.width, height: height!)
        myInput.layer.addSublayer(border)
    }
    
    func addUIElement<T: UIView>(_ element: T, text: String? = nil, frame: CGRect, onSuccess: (AnyObject)->() = {_ in } ){
        switch element {
        case let label as UILabel:
            label.text = text
            label.numberOfLines = 0
        case let field as UITextField:
            field.placeholder = text
        case let field as UITextView:
            field.text = text
        case let button as UIButton:
            button.setTitle(text, for: UIControlState())
        case let image as UIImageView:
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
        case _ as UICollectionView:
        break // pass
        case let container as UIVisualEffectView:
            container.effect =  UIBlurEffect(style: UIBlurEffectStyle.light)
        default:
            break // print("I don't know my type")
        }
        placeUIElement(element, frame: frame)
        onSuccess(element)
    }
}

extension UIColor{
    convenience init(rgb: UInt, alphaVal: CGFloat? = 1.0) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alphaVal!)
        )
    }
}

class BaseController: UIViewController {
    
    var w: CGFloat!
    var h: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        w = view.bounds.size.width
        h = view.bounds.size.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



