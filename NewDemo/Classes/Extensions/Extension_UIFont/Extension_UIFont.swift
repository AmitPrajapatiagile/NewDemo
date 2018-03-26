//
//  Extension_UIFont.swift
//  AAA-Passenger
//
//  Created by Amit Prajapati on 12/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//


import Foundation
import UIKit

extension UIFont {
    
    // San Francisco Text - LIGHT
    class func appFont_Light(fontSize : CGFloat) -> UIFont {
        return UIFont(name: GlobalSet.sharedInstance.fontLight, size: fontSize)!
    }
    
    
    // San Francisco Text - REGULAR
    class func appFont_Regular(fontSize : CGFloat) -> UIFont {
        return UIFont(name: GlobalSet.sharedInstance.fontRegular, size: fontSize)!
    }
    
    
    // San Francisco Text - MEDIUM
    class func appFont_Medium(fontSize : CGFloat) -> UIFont {
        return UIFont(name: GlobalSet.sharedInstance.fontMedium, size: fontSize)!
    }
    
    
    // San Francisco Text - SEMIBOLD
    class func appFont_SemiBold(fontSize : CGFloat) -> UIFont {
        return UIFont(name: GlobalSet.sharedInstance.fontSemiBold, size: fontSize)!
    }
    
    
    // San Francisco Text - BOLD
    class func appFont_Bold(fontSize : CGFloat) -> UIFont {
        return UIFont(name: GlobalSet.sharedInstance.fontBold, size: fontSize)!
    }
    
    
    // San Francisco Text - HEAVY
    class func appFont_Heavy(fontSize : CGFloat) -> UIFont {
        return UIFont(name: GlobalSet.sharedInstance.fontHeavy, size: fontSize)!
    }
}

