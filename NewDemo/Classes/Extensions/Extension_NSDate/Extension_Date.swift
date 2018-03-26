//
//  Extension_NSDate.swift
//  AAA-Passenger
//
//  Created by Amit Prajapati on 12/03/18.
//  Copyright © 2018 agilemac-26. All rights reserved.
//


import Foundation

extension Date {
    
    // MARK:- APP SPECIFIC FORMATS
    
    public  func app_dateFromString(strDate:String, format:String) -> Date? {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale.init(identifier: "en_US")
        if let dtDate = dateFormatter.date(from: strDate){
            return dtDate as Date?
        }
        return nil
    }
    
    
    public  func app_stringFromDate() -> String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let strdt = dateFormatter.string(from: self as Date)
        if let dtDate = dateFormatter.date(from: strdt){
            return dateFormatter.string(from: dtDate)
        }
        return "--"
    }
    
    public  func app_stringFromDate(format:String) -> String{
        let dateFormatter:DateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        //        dateFormatter.dateFormat = "MM/dd/yy"
        dateFormatter.dateFormat = format
        let strdt = dateFormatter.string(from: self as Date)
        
        if let dtDate = dateFormatter.date(from: strdt){
            return dateFormatter.string(from: dtDate)
        }
        return "--"
    }
    
    public  func app_stringFromDate_notification() -> String{
        return "\(self.monthNameShort) \(self.dayTwoDigit), \(self.yearFourDigit)"
    }
    
    
    public  func app_localTime() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = TimeZone.current
        let localTime = dateFormatter.string(from: Date())
        //        print("\nLocal Time :",localTime)
        return localTime
    }
    
    public  func app_mailSengingDate() -> String{
        return "\(self.dayTwoDigit)-\(self.monthTwoDigit)-\(self.yearFourDigit)"
    }
    
    
    
    //MARK:- UTILS
    public  func getUTCFormateDate(localDate: NSDate) -> String {
        
        let dateFormatter:DateFormatter = DateFormatter()
        let timeZone: NSTimeZone = NSTimeZone(name: "UTC")!
        dateFormatter.timeZone = timeZone as TimeZone!
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        let dateString: String = dateFormatter.string(from: localDate as Date)
        return dateString
    }
    
    
    public  func combineDateWithTime(date: NSDate, time: NSDate) -> NSDate? {
        let calendar = NSCalendar.current
        
        
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date as Date)
        
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time as Date)
        
        
        let mergedComponments = NSDateComponents()
        mergedComponments.year = dateComponents.year!
        mergedComponments.month = dateComponents.month!
        mergedComponments.day = dateComponents.day!
        mergedComponments.hour = timeComponents.hour!
        mergedComponments.minute = timeComponents.minute!
        mergedComponments.second = timeComponents.second!
        
        return calendar.date(from: mergedComponments as DateComponents) as NSDate?
    }
    
    public  func getDatesBetweenDates(startDate:NSDate, andEndDate endDate:NSDate) -> [NSDate] {
        let gregorian: NSCalendar = NSCalendar.current as NSCalendar;
        let components = gregorian.components(NSCalendar.Unit.day, from: startDate as Date, to: endDate as Date, options: [])
        var arrDates = [NSDate]()
        for i in 0...components.day!{
            arrDates.append(startDate.addingTimeInterval(60*60*24*Double(i)))
        }
        return arrDates
    }
    
    
    public  func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    public  func isLessThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    public  func equalToDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    
    // MARK:- TIME
    
    public static var timeStampWithMS:String {
        return "MS\(timeStamp)"
    }
    public static var timeStampWithoutMS:String {
        return "\(timeStamp)"
    }
    
    public static var timeStamp:Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    
    public var timeWithAMPM: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from: self as Date)
    }
    
    
    
    
    // MARK:- YEAR
    
    public var yearFourDigit_Int: Int {
        return Int(self.yearFourDigit)!
    }
    
    public var yearOneDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y"
        return dateFormatter.string(from: self as Date)
    }
    public var yearTwoDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy"
        return dateFormatter.string(from: self as Date)
    }
    
    public var yearFourDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self as Date)
    }
    
    
    
    // MARK:- MONTH
    
    public var monthOneDigit_Int: Int {
        return Int(self.monthOneDigit)!
    }
    public var monthTwoDigit_Int: Int {
        return Int(self.monthTwoDigit)!
    }
    
    
    public var monthOneDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M"
        return dateFormatter.string(from: self as Date)
    }
    public var monthTwoDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: self as Date)
    }
    public var monthNameShort: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self as Date)
    }
    public var monthNameFull: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self as Date)
    }
    public var monthNameFirstLetter: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMMM"
        return dateFormatter.string(from: self as Date)
    }
    
    // MARK:- DAY
    
    public var dayOneDigit_Int: Int {
        return Int(self.dayOneDigit)!
    }
    public var dayTwoDigit_Int: Int {
        return Int(self.dayTwoDigit)!
    }
    
    public var dayOneDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self as Date)
    }
    public var dayTwoDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self as Date)
    }
    public var dayNameShort: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: self as Date)
    }
    public var dayNameFull: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self as Date)
    }
    public var dayNameFirstLetter: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEEE"
        return dateFormatter.string(from: self as Date)
    }
    
    
    
    
    // MARK:- AM PM
    public var AM_PM: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a"
        return dateFormatter.string(from: self as Date)
    }
    
    // MARK:- HOUR
    
    
    public  var hourOneDigit_Int: Int {
        return Int(self.hourOneDigit)!
    }
    public  var hourTwoDigit_Int: Int {
        return Int(self.hourTwoDigit)!
    }
    public  var hourOneDigit24Hours_Int: Int {
        return Int(self.hourOneDigit24Hours)!
    }
    public  var hourTwoDigit24Hours_Int: Int {
        return Int(self.hourTwoDigit24Hours)!
    }
    public  var hourOneDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h"
        return dateFormatter.string(from: self as Date)
    }
    public  var hourTwoDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh"
        return dateFormatter.string(from: self as Date)
    }
    public  var hourOneDigit24Hours: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H"
        return dateFormatter.string(from: self as Date)
    }
    public  var hourTwoDigit24Hours: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        return dateFormatter.string(from: self as Date)
    }
    
    // MARK:- MINUTE
    
    public  var minuteOneDigit_Int: Int {
        return Int(self.minuteOneDigit)!
    }
    public  var minuteTwoDigit_Int: Int {
        return Int(self.minuteTwoDigit)!
    }
    
    public  var minuteOneDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "m"
        return dateFormatter.string(from: self as Date)
    }
    public  var minuteTwoDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm"
        return dateFormatter.string(from: self as Date)
    }
    
    
    // MARK:- SECOND
    
    public  var secondOneDigit_Int: Int {
        return Int(self.secondOneDigit)!
    }
    public  var secondTwoDigit_Int: Int {
        return Int(self.secondTwoDigit)!
    }
    
    public  var secondOneDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "s"
        return dateFormatter.string(from: self as Date)
    }
    public  var secondTwoDigit: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ss"
        return dateFormatter.string(from: self as Date)
    }
    
    
}
