//
//  Extension_CGFloat.swift
//  AAA-Passenger
//
//  Created by Amit Prajapati on 12/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//


import Foundation
import CoreGraphics

extension CGFloat{
	
	init?(_ str: String) {
		guard let float = Float(str) else { return nil }
		self = CGFloat(float)
	}

	
	public func twoDigitValue() -> String {
		
		let formatter = NumberFormatter()
		formatter.maximumFractionDigits = 2
		formatter.minimumFractionDigits = 0
		formatter.roundingMode = NumberFormatter.RoundingMode.halfUp //NumberFormatter.roundingMode.roundHalfUp
	
		
//		let str : NSString = formatter.stringFromNumber(NSNumber(self))!
		let str = formatter.string(from: NSNumber(value: Double(self)))
		return str! as String;
	}

	
	
	public func proportionalFontSize() -> CGFloat {
		
		var sizeToCheckAgainst = self
		
		if(IS_IPAD_DEVICE())	{
			sizeToCheckAgainst += 4
		}
		else {
			if(IS_IPHONE_6P_OR_6SP()) {
				sizeToCheckAgainst += 1
			}
			else if(IS_IPHONE_6_OR_6S()) {
				sizeToCheckAgainst += 0
			}
			else if(IS_IPHONE_5_OR_5S()) {
				sizeToCheckAgainst -= 1
			}
			else if(IS_IPHONE_4_OR_4S()) {
				sizeToCheckAgainst -= 2
			}
		}
		return sizeToCheckAgainst
	}
}
