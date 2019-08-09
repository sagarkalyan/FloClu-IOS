////
////  CalendarEntryData.swift
////  FloClu
////
////  Created by Ashish Ashish on 2019-07-29.
////  Copyright © 2019 capstoneProject. All rights reserved.
////
//
import Foundation
import UIKit
class calendarEntryDate: UIViewController{
    
    @IBOutlet weak var showDayLabel: UILabel!
    
    
    
    @IBOutlet weak var showDateLabel: UILabel!
    
    @IBOutlet weak var numberOfDaysLabel: UILabel!
    
    
    @IBOutlet weak var lengthOfCycleLabel: UILabel!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if UserDefaults.standard.object(forKey: "lastDate")  != nil && UserDefaults.standard.object(forKey: "lengthOfCycleDaysValue")  != nil && UserDefaults.standard.object(forKey: "noOfDaysItLastValue")  != nil{
            
            
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "CalenderDisplayBoard")
            self.navigationController?.pushViewController(secondViewController!, animated: true)
         
            
     
        }
        else{
        
        let today = Date()
        let weekday = Calendar.current.component(.weekday, from: today)
        let month = Calendar.current.component(.month, from: today)
        let date = Calendar.current.component(.day, from: today)
        
        showDateLabel.text = Calendar.current.weekdaySymbols[weekday-1]
        showDayLabel.text = "\(Calendar.current.shortMonthSymbols[month-1]) \(date)"
        }
    }
    
    fileprivate lazy var datePicker: UIDatePicker = { [unowned self] in
        $0.addTarget(self, action: #selector(DatePickerViewController.actionForDatePicker), for: .valueChanged)
        return $0
        }(UIDatePicker())
    
    fileprivate var alertStyle: UIAlertController.Style = .actionSheet
    
    //  Date
    
    @IBAction func selectDate(_ sender: Any) {
        
        print("wortking===========-=-=-=====-=-=-=-=----=-=-=-=-=-=-=-=-")
        let alert = UIAlertController(style: alertStyle, title: "Date Picker", message: "Select Date")
        alert.addDatePicker(mode: .date, date: Date(), minimumDate: nil, maximumDate: nil) { date in
            
            //             date converter
            //            self.datePicker.datePickerMode = UIDatePicker.Mode.date
            //            let dateFormatter = DateFormatter()
            //            dateFormatter.dateFormat = "dd MMMM yyyy"
            //            dateFormatter.timeZone = TimeZone(abbreviation: "GMT-07:00")
            //            let selectedDate = dateFormatter.string(from: self.datePicker.date)
            //            print(selectedDate)
            //            let today = Date(iso8601String: selectedDate)
            //            print(date)
            
            //             date converter ends
            
            let today = Calendar.current.startOfDay(for: date)
            
            //            let newtoday = Calendar.current.component(., from: today)
            let weekday = Calendar.current.component(.weekday, from: today)
            let month = Calendar.current.component(.month, from: today)
            let date = Calendar.current.component(.day, from: today)
            let year = Calendar.current.component(.year, from: today)
            
            
            
            var dateComponents = DateComponents()
            dateComponents.year = year
            dateComponents.month = month
            
            let calendar = Calendar.current
            let datez = calendar.date(from: dateComponents)
            // change .month into .year to see the days available in the year
            let interval = calendar.dateInterval(of: .month, for: datez!)!
            
            let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
            
            
            
            
            
            
            UserDefaults.standard.set(today, forKey: "lastDate")
            UserDefaults.standard.set(days, forKey: "selectedMonthDays")
            
            //            adding value to mibile ends
            
            self.showDateLabel.text = Calendar.current.weekdaySymbols[weekday-1]
            self.showDayLabel.text = "\(Calendar.current.shortMonthSymbols[month-1]) \(date)"
        }
        alert.addAction(title: "Done", style: .cancel)
//        alert.show()
        self.present(alert, animated: true, completion: nil)

        
    }
    
    //     date ends
    
    
    
    
    
    @IBAction func numberOfDaysAction(_ sender: Any) {
        
        //        /  value picker
        
        let alert = UIAlertController(style: self.alertStyle, title: "Picker View", message: "Preferred Content Days")
        
        let frameSizes: [CGFloat] = (1...10).map { CGFloat($0) }
        let pickerViewValues: [[String]] = [frameSizes.map { Int($0).description }]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: frameSizes.firstIndex(of: 1) ?? 1)
        
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    vc.preferredContentSize.height = 150
                }
                
                let noDaysInInt : Int = Int(frameSizes[index.row])
                //             addind value to mobile
                
                UserDefaults.standard.set(noDaysInInt, forKey: "noOfDaysItLastValue")
                
                //            adding value to mibile ends
                self.numberOfDaysLabel.text = String (noDaysInInt)
                
                
            }
        }
        alert.addAction(title: "Done", style: .cancel)
//        alert.show()
        self.present(alert, animated: true, completion: nil)

        
        
        // valie picker
        
    }
    
    
    
    @IBAction func lengthOfCycleAction(_ sender: Any) {
        
        //        value picker
        
        let alert = UIAlertController(style: self.alertStyle, title: "Picker View", message: "Preferred Content Days")
        
        let frameSizes: [CGFloat] = (16...45).map { CGFloat($0) }
        let pickerViewValues: [[String]] = [frameSizes.map { Int($0).description }]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: frameSizes.firstIndex(of: 1) ?? 1)
        
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    vc.preferredContentSize.height = 150
                }
                let lengthDaysInInt : Int = Int(frameSizes[index.row])
                //             addind value to mobile
                
                UserDefaults.standard.set(lengthDaysInInt, forKey: "lengthOfCycleDaysValue")
                
                //            adding value to mibile ends
                self.lengthOfCycleLabel.text = String (lengthDaysInInt)
            }
        }
        alert.addAction(title: "Done", style: .cancel)
//        alert.show()
        self.present(alert, animated: true, completion: nil)

        
        
        // valie picker
    }
    
    
}


// date picker class
