//
//  Extension_UIView.swift
//  AAA-Passenger
//
//  Created by Amit Prajapati on 12/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//

import Foundation
import UIKit


//MARK:- AIEdge
enum AIEdge:Int {
    case
    Top,
    Left,
    Bottom,
    Right,
    Top_Left,
    Top_Right,
    Bottom_Left,
    Bottom_Right,
    All,
    None
}


extension Bundle
{
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}


extension UIView {
    
    //MARK:- HEIGHT / WIDTH
    
    var width:CGFloat {
        return self.frame.size.width
    }
    var height:CGFloat {
        return self.frame.size.height
    }
    var xPos:CGFloat {
        return self.frame.origin.x
    }
    var yPos:CGFloat {
        return self.frame.origin.y
    }
    
    //MARK:- ROTATE
    func rotate(angle: CGFloat) {
        
        let radians = angle / 180.0 * CGFloat(Double.pi)
        self.transform = self.transform.rotated(by: radians);
    }
    
    
    
    //MARK:- BORDER
    func applyBorderDefault() {
        self.applyBorder(color: UIColor.red, width: 1.0)
    }
    func applyBorderDefault1() {
        self.applyBorder(color: UIColor.green, width: 1.0)
    }
    func applyBorderDefault2() {
        self.applyBorder(color: UIColor.blue, width: 1.0)
    }
    func applyBorder(color:UIColor, width:CGFloat) {
        DispatchQueue.main.async {
            self.layer.borderColor = color.cgColor
            self.layer.borderWidth = width
        }
    }
    
    
    func applyBorderToAllSubViews(){
        
        print("sssssss")
        for i in self.subviews{
            i.applyBorderDefault()
            i.applyBorderToAllSubViews()
        }
    }
    
    //MARK:- CIRCLE
    func applyCircle() {
        
        DispatchQueue.main.async {
            self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) * 0.5
            self.layer.masksToBounds = true
            self.clipsToBounds = true
        }
    }
    
    //MARK:- CORNER RADIUS
    func applyCornerRadius(radius:CGFloat) {
        DispatchQueue.main.async {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
        }
    }
    
    
    //MARK:- SHADOW
    
    func applyShadowWithColor(color:UIColor, opacity:Float, radius: CGFloat, edge:AIEdge, shadowSpace:CGFloat)	{
        
        var sizeOffset:CGSize = CGSize.zero
        switch edge {
        case .Top:
            sizeOffset = CGSize(width: 0, height: -shadowSpace)
        case .Left:
            sizeOffset = CGSize(width: -shadowSpace, height: 0)
        case .Bottom:
            sizeOffset = CGSize(width: 0, height: shadowSpace)
        case .Right:
            sizeOffset = CGSize(width: shadowSpace, height: 0)
            
            
        case .Top_Left:
            sizeOffset = CGSize(width: -shadowSpace, height: -shadowSpace)
        case .Top_Right:
            sizeOffset = CGSize(width: shadowSpace, height: -shadowSpace)
        case .Bottom_Left:
            sizeOffset = CGSize(width: -shadowSpace, height: shadowSpace)
        case .Bottom_Right:
            sizeOffset = CGSize(width: shadowSpace, height: shadowSpace)
            
            
        case .All:
            sizeOffset = CGSize(width: 0, height: 0)
        case .None:
            sizeOffset = CGSize.zero
        }
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = sizeOffset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
    
    
    func addBorderWithColor(color:UIColor, edge:AIEdge, thicknessOfBorder:CGFloat)	{
        
        
        DispatchQueue.main.async {
            
            var rect:CGRect = CGRect.zero
            
            switch edge {
            case .Top:
                rect = CGRect(x: 0, y: 0, width: self.width, height: thicknessOfBorder)
            case .Left:
                rect = CGRect(x: 0, y: 0, width: thicknessOfBorder, height:self.width )
            case .Bottom:
                rect = CGRect(x: 0, y: self.height - thicknessOfBorder, width: self.width, height: thicknessOfBorder)
            case .Right:
                rect = CGRect(x: self.width-thicknessOfBorder, y: 0, width: thicknessOfBorder, height: self.height)
            default:
                break
            }
            
            let layerBorder = CALayer()
            layerBorder.frame = rect
            layerBorder.backgroundColor = color.cgColor
            self.layer.addSublayer(layerBorder)
        }
    }
    
    //MARK:- ANIMATE VIBRATE
    func animateVibrate() {
        
        let duration = 0.05
        
        UIView.animate(withDuration: duration ,
                       animations: {
                        self.transform = self.transform.translatedBy(x: 5, y: 0)
        },
                       completion: { finish in
                        
                        UIView.animate(withDuration: duration ,
                                       animations: {
                                        self.transform = self.transform.translatedBy(x: -10, y: 0)
                        },
                                       completion: { finish in
                                        
                                        
                                        UIView.animate(withDuration: duration ,
                                                       animations: {
                                                        self.transform = self.transform.translatedBy(x: 10, y: 0)
                                        },
                                                       completion: { finish in
                                                        
                                                        
                                                        UIView.animate(withDuration: duration ,
                                                                       animations: {
                                                                        self.transform = self.transform.translatedBy(x: -10, y: 0)
                                                        },
                                                                       completion: { finish in
                                                                        
                                                                        UIView.animate(withDuration: duration){
                                                                            self.transform = CGAffineTransform.identity
                                                                        }
                                                        })
                                        })
                        })
        })
    }
}
