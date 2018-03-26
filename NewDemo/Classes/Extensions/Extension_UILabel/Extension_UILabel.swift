//
//  Extension_UILabel.swift
//  AAA-Passenger
//
//  Created by Amit Prajapati on 12/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//


import Foundation
import UIKit

extension UILabel {
	
	func setLineHeight(lineHeight: CGFloat) {
		self.setLineHeight(lineHeight: lineHeight, withAlignment: .left)
	}
	
	func setLineHeight(lineHeight: CGFloat, withAlignment alignment:NSTextAlignment) {
		let text = self.text
		if let text = text {
			let attributeString = NSMutableAttributedString(string: text)
			
			let style = NSMutableParagraphStyle()
			style.lineSpacing = lineHeight
			style.alignment = alignment
			
            attributeString.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: NSMakeRange(0, text.count))
			self.attributedText = attributeString
		}
	}
    
    func setUnderline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedStringKey.underlineStyle,
                                          value: NSUnderlineStyle.styleSingle.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}

extension UILabel {
	
    func addCharacterSpacing()
    {
            if let labelText = text, labelText.count > 0 {
                let attributedString = NSMutableAttributedString(string: labelText)
                attributedString.addAttribute(NSAttributedStringKey.kern, value: 1.15, range: NSRange(location: 0, length: attributedString.length - 1))
                attributedText = attributedString
            }
    }
	func addImageWith(name: String, behindText: Bool) {
		
		let attachment = NSTextAttachment()
		attachment.image = UIImage(named: name)
		let attachmentString = NSAttributedString(attachment: attachment)
		
		
		guard let txt = self.text else {
			return
		}
		
		
		if behindText {
			
			let strLabelText = NSMutableAttributedString(string: txt)
			strLabelText.append(attachmentString)
			
			self.attributedText = strLabelText
			
		} else {
			 
			let strLabelText = NSAttributedString(string: txt)
			let mutableAttachmentString = NSMutableAttributedString(attributedString: attachmentString)
			mutableAttachmentString.append(strLabelText)
			
			self.attributedText = mutableAttachmentString
			
		}
		
	}
	
	func removeImage() {
		
		let text = self.text
		self.attributedText = nil
		self.text = text
	}
}
