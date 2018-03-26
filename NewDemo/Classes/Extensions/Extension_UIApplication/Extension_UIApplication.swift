//
//  Extension_UIApplication.swift
//  AAA-Passenger
//
//  Created by Amit Prajapati on 12/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    //let gAppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "0"
    static var appVersion: String {
        if let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") {
            return "\(appVersion)"
        } else {
            return ""
        }
    }
    
    static var appBuild: String {
        if let buildVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") {
            return "\(buildVersion)"
        } else {
            return ""
        }
    }
    
    static var appVersionWithBuild: String {
        let versionAndBuild = "\(UIApplication.appVersion).\(UIApplication.appBuild)"
        return versionAndBuild
    }
    
}

