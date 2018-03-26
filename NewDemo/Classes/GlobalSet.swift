//
//  NewConstant.swift
//  FrameworkLearning
//
//  Created by Amit Prajapati on 16/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//

import UIKit

open class GlobalSet: NSObject {
    
    public static let sharedInstance : GlobalSet = GlobalSet()
    
    open var myObject : Int = 0
    
    //    SanFranciscoText-Regular
    //    SanFranciscoText-Medium
    //    SanFranciscoText-Semibold
    //    SanFranciscoText-Bold
    //    SanFranciscoText-Heavy
     open var APP_NAME = "AAA-Passenger"
   // open var fontLight = "SanFranciscoText-Light"
    public var fontExpFont = "abc"

    open var fontLight = "SanFranciscoText-Light"
    open var fontRegular = "SanFranciscoText-Regular"
    open var fontMedium = "SanFranciscoText-Medium"
    open var fontSemiBold = "SanFranciscoText-Semibold"
    open var fontBold = "SanFranciscoText-Bold"
    open var fontHeavy = "SanFranciscoText-Heavy"
    
    public func checkingAllContstant()
    {
        print(fontLight)
        print(fontRegular)
        print(fontMedium)
        print(fontSemiBold)
        print(fontBold)
        print(fontHeavy)
               print(fontExpFont)
    }
}
