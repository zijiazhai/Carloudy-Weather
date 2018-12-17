//
//  Extension.swift
//  Carloudy-Weather
//
//  Created by Zijia Zhai on 12/13/18.
//  Copyright © 2018 cognitiveAI. All rights reserved.
//

import UIKit


func ZJPrint<T>(_ message : T, file : String = #file, lineNumber : Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("ZJPrint: \(NSDate())----\(fileName) line:\(lineNumber)- \(message)")
    #endif
}

extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}


extension UIColor {
    class var background: UIColor {
        //        return UIColor(r: 242, g: 242, b: 242)
        return UIColor(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    class var theme: UIColor {
        return UIColor(displayP3Red: 29/255, green: 221/255, blue: 43/255, alpha: 1.0)
    }
}


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}

extension Date{
    static func dateSince1970(timeStamp: Double) -> String{
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT-06:00") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        //dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
        dateFormatter.dateFormat = "HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}
