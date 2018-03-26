//
//  Extension_UIButton.swift
//  AAA-Passenger
//
//  Created by Amit Prajapati on 12/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
	
	func makeBold(){
		self.titleLabel?.font = UIFont.appFont_Bold(fontSize: (self.titleLabel?.font.pointSize)!)
	}
	
	func makeRegular(){
		self.titleLabel?.font = UIFont.appFont_Regular(fontSize: (self.titleLabel?.font.pointSize)!)
	}
}
