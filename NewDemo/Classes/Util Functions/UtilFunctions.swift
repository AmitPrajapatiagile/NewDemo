//
//  UtilFunctions.swift
//  AAA-Passenger
//
//  Created by Amit Prajapati on 12/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//


import Foundation
import UIKit




let INTERNET_MESSAGE:String = "Please check your internet connection and try again."
func SHOW_INTERNET_ALERT(){
//    showAlertWithTitleFromVC(vc: (appDelegate.window?.rootViewController)!, title: Constant.App.name, andMessage: INTERNET_MESSAGE, buttons: ["Dismiss"]) { (index) in
//    }
}

//MARK:- ALERT

func showAlertWithTitleFromVC(vc:UIViewController, andMessage message:String){
    
    showAlertWithTitleFromVC(vc: vc, title: Constant.App.name, andMessage: message, buttons: ["Dismiss"]) { (index) in
    }
}


func showAlertWithTitleFromVC(vc:UIViewController, title:String, andMessage message:String, buttons:[String], completion:((_ index:Int) -> Void)!) -> Void {
    
    var newMessage = message
    if newMessage == "The Internet connection appears to be offline." {
        newMessage = INTERNET_MESSAGE
    }
    
    
    let alertController = UIAlertController(title: title, message: newMessage, preferredStyle: .alert)
    for index in 0..<buttons.count    {
        
        let action = UIAlertAction(title: buttons[index], style: .default, handler: {
            (alert: UIAlertAction!) in
            if(completion != nil){
                completion(index)
            }
        })
        
        alertController.addAction(action)
    }
    
    DispatchQueue.main.async {
        vc.present(alertController, animated: true, completion: nil)
    }
    //    vc.present(alertController, animated: true, completion: nil)
}


//MARK:- ACTION SHEET
func showActionSheetWithTitleFromVC(vc:UIViewController, title:String, andMessage message:String, buttons:[String],canCancel:Bool, completion:((_ index:Int) -> Void)!) -> Void {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    
    
    
    for index in 0..<buttons.count    {
        
        let action = UIAlertAction(title: buttons[index], style: .default, handler: {
            (alert: UIAlertAction!) in
            if(completion != nil){
                completion(index)
            }
        })
        
        alertController.addAction(action)
    }
    
    if(canCancel){
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) in
            if(completion != nil){
                completion(buttons.count)
            }
        })
        
        alertController.addAction(action)
    }
    
    DispatchQueue.main.async {
        vc.present(alertController, animated: true, completion: nil)
    }
    //    vc.present(alertController, animated: true, completion: nil)
}
//MARK:- NETWORK ACTIVITY INDICATOR

func SHOW_NETWORK_ACTIVITY_INDICATOR(){
	UIApplication.shared.isNetworkActivityIndicatorVisible =  true
}

func HIDE_NETWORK_ACTIVITY_INDICATOR(){
	UIApplication.shared.isNetworkActivityIndicatorVisible =  false
}


//MARK:- USER DEFAULTS

func setUserDefaultsFor(object:AnyObject, with key:String) {
	UserDefaults.standard.set(object, forKey: key)
	UserDefaults.standard.synchronize()
}

func getUserDefaultsForKey(key:String) -> AnyObject? {
	return UserDefaults.standard.object(forKey: key) as AnyObject?
}

func removeUserDefaultsFor(key:String) {
	UserDefaults.standard.removeObject(forKey: key)
	UserDefaults.standard.synchronize()
}



//MARK:- PROPORTIONAL SIZE
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

func GET_PROPORTIONAL_WIDTH (width:CGFloat) -> CGFloat {
	return ((SCREEN_WIDTH * width)/750)
}
func GET_PROPORTIONAL_HEIGHT (height:CGFloat) -> CGFloat {
	return ((SCREEN_HEIGHT * height)/1334)
}




//MARK:- DEVICE CHECK

//Check IsiPhone Device
func IS_IPHONE_DEVICE()->Bool{
	let deviceType = UIDevice.current.userInterfaceIdiom == .phone
	return deviceType
}

//Check IsiPad Device
func IS_IPAD_DEVICE()->Bool{
	let deviceType = UIDevice.current.userInterfaceIdiom == .pad
	return deviceType
}

//iPhone 4 OR 4S
func IS_IPHONE_4_OR_4S()->Bool{
	let SCREEN_HEIGHT_TO_CHECK_AGAINST:CGFloat = 480
	var device:Bool = false
	
	if(SCREEN_HEIGHT_TO_CHECK_AGAINST == SCREEN_HEIGHT)	{
		device = true
	}
	return device
}

//iPhone 5 OR OR 5C OR 4S
func IS_IPHONE_5_OR_5S()->Bool{
	let SCREEN_HEIGHT_TO_CHECK_AGAINST:CGFloat = 568
	var device:Bool = false
	if(SCREEN_HEIGHT_TO_CHECK_AGAINST == SCREEN_HEIGHT)	{
		device = true
	}
	return device
}

//iPhone 6 OR 6S
func IS_IPHONE_6_OR_6S()->Bool{
	let SCREEN_HEIGHT_TO_CHECK_AGAINST:CGFloat = 667
	var device:Bool = false
	
	if(SCREEN_HEIGHT_TO_CHECK_AGAINST == SCREEN_HEIGHT)	{
		device = true
	}
	return device
}

//iPhone 6Plus OR 6SPlus
func IS_IPHONE_6P_OR_6SP()->Bool{
	let SCREEN_HEIGHT_TO_CHECK_AGAINST:CGFloat = 736
	var device:Bool = false
	
	if(SCREEN_HEIGHT_TO_CHECK_AGAINST == SCREEN_HEIGHT)	{
		device = true
	}
	return device
}

//MARK:- DEVICE ORIENTATION CHECK
func IS_DEVICE_PORTRAIT() -> Bool {
	return UIDevice.current.orientation.isPortrait
}

func IS_DEVICE_LANDSCAPE() -> Bool {
	return UIDevice.current.orientation.isLandscape
}


//MARK:- SYSTEM VERSION CHECK
func SYSTEM_VERSION_EQUAL_TO(version: String) -> Bool {
	return UIDevice.current.systemVersion.compare(version,
	                                                      options: NSString.CompareOptions.numeric) == ComparisonResult.orderedSame
}

func SYSTEM_VERSION_GREATER_THAN(version: String) -> Bool {
	return UIDevice.current.systemVersion.compare(version,
	                                                      options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
}

func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: String) -> Bool {
	return UIDevice.current.systemVersion.compare(version,
	                                                      options: NSString.CompareOptions.numeric) != ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN(version: String) -> Bool {
	return UIDevice.current.systemVersion.compare(version,
	                                                      options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: String) -> Bool {
	return UIDevice.current.systemVersion.compare(version,
	                                                      options: NSString.CompareOptions.numeric) != ComparisonResult.orderedDescending
}
