//
//  Globals.swift
//  AAA-Passenger
//
//  Created by Amit Prajapati on 12/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//


import Foundation
import UIKit


//MARK: - IMAGE
func ImageNamed(name:String) -> UIImage?{
    return UIImage(named: name)
}



struct Constant {
    
	struct App {
		static let name = "AAA-Passenger"
	}
    
   
    struct Colors {
        
        static let textFieldPlaceHolder = UIColor(red: 130, green: 130, blue: 159)
        
        static let blue                = UIColor(red: 61, green: 140, blue: 255)
        static let blueLight        = UIColor(red: 0, green: 177, blue: 240)
        static let blueLightest     = UIColor(red: 226, green: 246, blue: 253)
        static let cyan             = UIColor(red: 0, green: 214, blue: 251)
        
        static let purple           = UIColor(red: 50, green: 44, blue: 98)
        
        static let sky              = UIColor(red: 0, green: 113, blue: 162)
        
        static let pink             = UIColor(red: 239, green: 0, blue: 101)
        static let green            = UIColor(red: 97, green: 189, blue: 62)
        static let yellow           = UIColor(red: 255, green: 198, blue: 0)
        static let saffron          = UIColor(red: 255, green: 141, blue: 0)
        
        //        static let gray              = UIColor(red: 151, green: 150, blue: 174)
        static let gray              = UIColor(red: 132, green: 128, blue: 161)
        static let separatorLogin   = UIColor(red: 236, green: 236, blue: 238)
        
        
        static let faqAnswer        = UIColor(red: 166, green: 166, blue: 195)
        
        
        // FOR INTERNET SNACK ALERT
        static let red = UIColor(red: 219, green: 50, blue: 55)
    }
}
