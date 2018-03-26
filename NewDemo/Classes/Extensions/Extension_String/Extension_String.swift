//
//  Extension_String.swift
//  AAA-Passenger
//
//  Created by Amit Prajapati on 12/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit


extension String {
    
    static func queryStringFromParameters(parameters: Dictionary<String,String>) -> String {
        
        if (parameters.count == 0){
            return ""
        }
        var queryString = ""
        for (key, value) in parameters {
            if queryString.isEmpty {
                queryString = "{"
            }else {
                queryString += ","
            }
            queryString += "\"" + key + "\"" + ":" + "\"" + value + "\""
        }
        if !queryString.isEmpty {
            queryString = queryString + "}"
        }
        return queryString
    }

    static func queryStringFromParameters_String_Any(parameters: Dictionary<String,Any>) -> String {
        
        if (parameters.count == 0){
            return ""
        }
        var queryString = ""
        for (key, value) in parameters {
            if queryString.isEmpty {
                queryString = "{"
            }else {
                queryString += ","
            }
//            queryString += "\"" + key + "\"" + ":" + "\"" + value + "\""
            queryString = queryString + "\"" + key + "\"" + ":" + "\"" + "\(value)" + "\""
        }
        if !queryString.isEmpty {
            queryString = queryString + "}"
        }
        return queryString
    }

    
    
    static func queryStringFromParameters_ForPDF(parameters: Dictionary<String,String>) -> String {
        
        if (parameters.count == 0){
            return ""
        }
        var queryString = ""
        for (key, value) in parameters {
            if queryString.isEmpty {
                queryString = ""
            }else {
                queryString += "&"
            }
            queryString += key + "=" + value
        }
        if !queryString.isEmpty {
            queryString = queryString + ""
        }
        return queryString
        
//        requestId=MS1514381449182&sessionId=lf
    }

}


extension String {

    func fillIfEmpty() -> String {
        return isEmpty ? "-" : self
    }
    
    func convertToDictionary() -> [String: Any]? {
        if let data1 = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data1, options: .mutableLeaves) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
	func isLastCharcterAWhiteSpace() -> Bool{
		
		if(self.count == 0){
			return false
		}
		
		var result:Bool = false
		if(self.count == 1){
			result = self[0] == " "
		}else{
			result = self[self.count-1] == " "
		}
		
		return result
	}
	
    func containsAnyLetter() -> Bool{

        return (self as NSString).rangeOfCharacter(from: NSCharacterSet.letters).location != NSNotFound
    }
    
	func containsAdjacentSpaces() -> Bool{
		
		if(self.count == 0){
			return false
		}
		
		var result = false
		if(self.count == 1){
			result = false
		}else{
			var wasLastCharacterAWhiteSpace = false
            for i in 0..<self.count{
                if self[i].isChar() {
                    if(wasLastCharacterAWhiteSpace){
                        return true
                    }
                    wasLastCharacterAWhiteSpace = true
                }else{
                    wasLastCharacterAWhiteSpace = false
                }
            }
		}
		return result
	}
	
	func whiteSpaceTrimmed() -> String{
		return self.components(separatedBy: NSCharacterSet.whitespaces).filter({ !$0.isEmpty }).joined(separator: " ")
	}
    
    func removingAllWhiteSpaces() -> String{
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func encodedUrl() -> String{
        if let encoded = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            return encoded
        }else{
            return self
        }
    }
	
    func encodedWith(allowedCharacterSet:CharacterSet) -> String{
        
        if let encoded = self.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet){
            return encoded
        }else{
            return self
        }
    }
    
	func heightWithWidthAndFont(width: CGFloat, font: UIFont) -> CGFloat {
		
		let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
		return boundingBox.height
	}
	
	func isValidEmail() -> Bool	{
		return ( (isValidEmail_OLD(stringToCheckForEmail: self as String))  && (isValidEmail_NEW(stringToCheckForEmail: self as String)) )
	}
	
	private func isValidEmail_OLD(stringToCheckForEmail:String) -> Bool {
		let emailRegex = "[A-Z0-9a-z]+([._%+-]{1}[A-Z0-9a-z]+)*@[A-Z0-9a-z]+([.-]{1}[A-Z0-9a-z]+)*(\\.[A-Za-z]{2,4}){0,1}"
		return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: stringToCheckForEmail)
	}
	
	private func isValidEmail_NEW(stringToCheckForEmail:String) -> Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluate(with: stringToCheckForEmail)
	}
	
	var containsEmoji: Bool {
		get {
			for scalar in unicodeScalars {
				switch scalar.value {
				case 0x1F600...0x1F64F, // Emoticons
				0x1F300...0x1F5FF, // Misc Symbols and Pictographs
				0x1F680...0x1F6FF, // Transport and Map
				0x2600...0x26FF,   // Misc symbols
				0x2700...0x27BF,   // Dingbats
				0xFE00...0xFE0F:   // Variation Selectors
					return true
				default:
					continue
				}
			}
			return false
		}
	}
}

/**
 *  x || X -> Any character
 *  c || C -> Alphabetic character
 *  n || N -> Numerical character
 */

extension String {
    
    fileprivate static let ANYONE_CHAR_UPPER = "X"
    fileprivate static let ONLY_CHAR_UPPER = "C"
    fileprivate static let ONLY_NUMBER_UPPER = "N"
    fileprivate static let ANYONE_CHAR = "x"
    fileprivate static let ONLY_CHAR = "c"
    fileprivate static let ONLY_NUMBER = "n"
    
    func format(_ format: String, oldString: String) -> String {
        let stringUnformated = self.unformat(format, oldString: oldString)
        var newString = String()
        var counter = 0
        if stringUnformated.count == counter {
            return newString
        }
        for i in 0..<format.count {
            var stringToAdd = ""
            let unicharFormatString = format[i]
            let charFormatString = unicharFormatString
            let charFormatStringUpper = unicharFormatString.uppercased()
            let unicharString = stringUnformated[counter]
            let charString = unicharString
            let charStringUpper = unicharString.uppercased()
            if charFormatString == String.ANYONE_CHAR {
                stringToAdd = charString
                counter += 1
            } else if charFormatString == String.ANYONE_CHAR_UPPER {
                stringToAdd = charStringUpper
                counter += 1
            } else if charFormatString == String.ONLY_CHAR_UPPER {
                counter += 1
                if charStringUpper.isChar() {
                    stringToAdd = charStringUpper
                }
            } else if charFormatString == String.ONLY_CHAR {
                counter += 1
                if charString.isChar() {
                    stringToAdd = charString
                }
            } else if charFormatStringUpper == String.ONLY_NUMBER_UPPER {
                counter += 1
                if charString.isNumber() {
                    stringToAdd = charString
                }
            } else {
                stringToAdd = charFormatString
            }
         //   'characters' is deprecated: Please use String or Substring directly
            newString += stringToAdd
            if counter == stringUnformated.count {
                if i == format.count - 2 {
                    let lastUnicharFormatString = format[i + 1]
                    let lastCharFormatStringUpper = lastUnicharFormatString.uppercased()
                    let lasrCharControl = (!(lastCharFormatStringUpper == String.ONLY_CHAR_UPPER) &&
                        !(lastCharFormatStringUpper == String.ONLY_NUMBER_UPPER) &&
                        !(lastCharFormatStringUpper == String.ANYONE_CHAR_UPPER))
                    if lasrCharControl {
                        newString += lastUnicharFormatString
                    }
                }
                break
            }
        }
        return newString
    }
    
    func unformat(_ format: String, oldString: String) -> String {
        var string: String = self
        var undefineChars = [String]()
        for i in 0..<format.count {
            let unicharFormatString = format[i]
            let charFormatString = unicharFormatString
            let charFormatStringUpper = unicharFormatString.uppercased()
            if !(charFormatStringUpper == String.ANYONE_CHAR_UPPER) &&
                !(charFormatStringUpper == String.ONLY_CHAR_UPPER) &&
                !(charFormatStringUpper == String.ONLY_NUMBER_UPPER) {
                var control = false
                for i in 0..<undefineChars.count {
                    if undefineChars[i] == charFormatString {
                        control = true
                    }
                }
                if !control {
                    undefineChars.append(charFormatString)
                }
            }
        }
        if oldString.count - 1 == string.count {
            var changeCharIndex = 0
            for i in 0..<string.count {
                let unicharString = string[i]
                let charString = unicharString
                let unicharString2 = oldString[i]
                let charString2 = unicharString2
                if charString != charString2 {
                    changeCharIndex = i
                    break
                }
            }
            let changedUnicharString = oldString[changeCharIndex]
            let changedCharString = changedUnicharString
            var control = false
            for i in 0..<undefineChars.count {
                if changedCharString == undefineChars[i] {
                    control = true
                    break
                }
            }
            if control {
                var i = changeCharIndex - 1
                while i >= 0 {
                    let findUnicharString = oldString[i]
                    let findCharString = findUnicharString
                    var control2 = false
                    for j in 0..<undefineChars.count {
                        if findCharString == undefineChars[j] {
                            control2 = true
                            break
                        }
                    }
                    if !control2 {
                        string = (oldString as NSString).replacingCharacters(in: NSRange(location: i, length: 1), with: "")
                        break
                    }
                    i -= 1
                }
            }
        }
        for i in 0..<undefineChars.count {
            string = string.replacingOccurrences(of: undefineChars[i], with: "")
        }
        return string
    }
    
    fileprivate func isChar() -> Bool {
        return regexControlString(pattern: "[a-zA-ZğüşöçıİĞÜŞÖÇ]")
    }
    
    fileprivate func isNumber() -> Bool {
        return regexControlString(pattern: "^[0-9]*$")
    }
    
    fileprivate func regexControlString(pattern: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let numberOfMatches = regex.numberOfMatches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            return numberOfMatches == self.count
        } catch {
            return false
        }
    }
}
//MARK:- SUBSCRIPT
extension String {

    // USER .isChar instead
//    subscript(integerIndex: Int) -> Character {
//        let index = self.index(self.startIndex, offsetBy: integerIndex)
//        return self[index]
//    }

    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                            upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[Range(start ..< end)])
    }
}

//Get Range of string
extension String {
    func nsRange(of string: String, options: CompareOptions = .literal, range: Range<Index>? = nil, locale: Locale? = nil) -> NSRange? {
        guard let range = self.range(of: string, options: options, range: range ?? startIndex..<endIndex, locale: locale ?? .current) else { return nil }
        return NSRange(range, in: self)
    }
}

