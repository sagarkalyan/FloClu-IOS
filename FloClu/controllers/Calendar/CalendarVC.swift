////
////  CalendarVC.swift
////  FloClu
////
////  Created by Ashish Ashish on 2019-07-29.
////  Copyright © 2019 capstoneProject. All rights reserved.
////
//
import JTAppleCalendar
import UIKit

//protocol Navigationable: class {
//    func shouldCustomNavigationControllerPopToRoot() -> Bool
//}

class CalendarVC: UIViewController {
    //    var months: Constants!

    //    func shouldCustomNavigationControllerPopToRoot() -> Bool {
    //        return true
    //    }
    @IBOutlet weak var viewData: UIView!
    @IBOutlet weak var calendarView: JTACMonthView!
    let formatter = DateFormatter()

    let numberOfRows = 6
    var lastFullDateSelected = UserDefaults.standard.object(forKey: "lastDate") as! Date
    let selectedMonthDays = UserDefaults.standard.integer(forKey: "selectedMonthDays")
    let noOfDaysItLastValue = UserDefaults.standard.integer(forKey: "noOfDaysItLastValue")
    let lengthOfCycleDaysValue = UserDefaults.standard.integer(forKey: "lengthOfCycleDaysValue")

    //    var lengthOfCycleValue: Date = Date()
    //    var newlengthOfCycleValue : Date = Date()
    //    var DaylastAddedwithDaySelected:Int = 0;
    //
    //
    //
    //    var rangeLastDate: Date = Date();
    //    var newrangeLastDate: Date = Date();
    //    var rangeMonth: Date = Date()
    //    var rangeMonthValue : Date = Date()
    //    var rangefinalDateValue:Date = Date()
    //
    //
    //    var testDate: Date = Date()
    //    var testDateValue: Date = Date()
    //    var testMonth: Date = Date()
    //    var testMonthValue : Date = Date()
    //    var finalDateValue:Date = Date()

    var  newdateValueUPdate: Date = Date()
    var  newDxateRangeValue:Date = Date()

    //    let range = lastdDate.range(of: .day, in: .month, for: date)!
    //    let numDays = range.count
    override func viewDidLoad() {
        super.viewDidLoad()

        viewData.backgroundColor = white
        calendarView.register(UINib(nibName: "CalendarSectionHeaderView", bundle: Bundle.main),
                              forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                              withReuseIdentifier: "CalendarSectionHeaderView")

        //        calendarView.register(UINib(nibName: "CalendarSectionHeaderView", bundle: nil), forCellWithReuseIdentifier: "CalendarCell")

        //        calendarView. register(CalendarSectionHeaderView.self, forCellReuseIdentifier: "DefaultCell")


        //        let newSelectedMonthDay = Int(selectedMonthDays)
        // Do any additional setup after loading the view, typically from a nib.

        //        // convert Date to TimeInterval (typealias for Double)
        //        let timeInterval = lastDate.month
        //        // convert to Integer
        //        let myInt = Int(timeInterval)
        //
        //        for month in Months {
        //           if myInt == month
        //           {
        //
        //            }
        //            else
        //           {
        //
        //            }
        //        }

        //        if myInt == feb {


        //        var count = 3
        //        var monthSelected = Int(lastFullDateSelected.month)
        //        var daySelected = lastFullDateSelected.day
        //        var yearSelected = lastFullDateSelected.year
        //        for index in 1...12  {

        newdateValueUPdate =   Calendar.current.date(byAdding: .day, value: lengthOfCycleDaysValue, to: lastFullDateSelected)!

        newDxateRangeValue = Calendar.current.date(byAdding: .day, value: noOfDaysItLastValue, to: lastFullDateSelected)!

        //        print(newdateValueUPdate,"new valus is ihijbnkn")
        //        let dayDurationInSeconds: TimeInterval = 60*60*24
        //        for dateingValue in stride(from: lastFullDateSelected, to: newDxateRangeValue, by: dayDurationInSeconds) {
        //
        //            print(dateingValue)
        //            configureCalendarView()
        //
        //        }

        //        configureCalendarView()

        //            print(monthSelected,"Month selected 68790890t786ry9802i90y7twgjby89eyjbcjkbuyrs8uresruh")
        //            var isMothDecember: Bool = false


        //            let gapInPeriods = daySelected + lengthOfCycleDaysValue
        //            let rangeofPeriod = daySelected + noOfDaysItLastValue
        //
        ////            let monthIs: Bool = true
        //           switch monthSelected
        //           {
        //           case 1,3,5,7,8,10,12:
        //            do {
        //                if gapInPeriods > 31
        //                {
        //                  let nextMonthDate =  gapInPeriods - 31
        //                  let nextMonth = monthSelected + 1
        //                    monthSelected = nextMonth
        //                    testDate = lastFullDateSelected;
        ////                    testMonth = lastFullDateSelected;
        //                    testDateValue = testDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                    testMonth = testDateValue
        //                    testMonthValue = testMonth.changing(Calendar.Component.month, value:nextMonth )
        //                    finalDateValue = testMonthValue
        //                    print(monthSelected,"Month selected in if 68790890t786ry9802i90y7twgjby89eyjbcjkbuyrs8uresruh")
        //
        //                    configureCalendarView()
        //
        //
        //
        //                }
        //                else
        //                {
        //                    let nextMonthDate = gapInPeriods
        //                    testDate = lastFullDateSelected;
        //                    testDateValue = testDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                    finalDateValue = testDateValue
        //                    configureCalendarView()
        //                    print(monthSelected,"Month selected in if 68790890t786ry9802i90y7twgjby89eyjbcjkbuyrs8uresruh")
        //
        //                }
        //
        //                if rangeofPeriod > 31
        //                {
        //                    var nextMonthDate =  rangeofPeriod - 31
        //                    nextMonthDate = nextMonthDate  - 1
        //                    let nextMonth = monthSelected + 1
        //                    monthSelected = nextMonth
        //
        //                    rangeLastDate = lastFullDateSelected;
        //                    //                    testMonth = lastFullDateSelected;
        //                    newrangeLastDate = rangeLastDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                    rangeMonth = newrangeLastDate
        //                    rangeMonthValue = rangeMonth.changing(Calendar.Component.month, value:nextMonth )
        //                    rangefinalDateValue = rangeMonthValue
        //                    configureCalendarView()
        //                }
        //                else
        //                {
        //                    var nextMonthDate =  rangeofPeriod
        //                    nextMonthDate = nextMonthDate  - 1
        ////                    let nextMonth = monthSelected + 1
        //                    rangeLastDate = lastFullDateSelected;
        //                    //                    testMonth = lastFullDateSelected;
        //                    newrangeLastDate = rangeLastDate.changing(Calendar.Component.day, value:nextMonthDate )
        ////                    rangeMonth = newrangeLastDate
        ////                    rangeMonthValue = rangeMonth.changing(Calendar.Component.month, value:nextMonth )
        //                    rangefinalDateValue = newrangeLastDate
        //                    configureCalendarView()
        //                }
        //
        //            }
        //            break;
        //           case 4,6,9,11:
        //           do {
        //            if gapInPeriods > 30
        //            {
        //                let nextMonthDate =  gapInPeriods - 30
        //                let nextMonth = monthSelected + 1
        //                monthSelected = nextMonth
        //
        //                testDate = lastFullDateSelected;
        //                //                    testMonth = lastFullDateSelected;
        //                testDateValue = testDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                testMonth = testDateValue
        //                testMonthValue = testMonth.changing(Calendar.Component.month, value:nextMonth )
        //                finalDateValue = testMonthValue
        //
        //                configureCalendarView()
        //            }
        //            else
        //            {
        //                let nextMonthDate = gapInPeriods
        //                testDate = lastFullDateSelected;
        //                testDateValue = testDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                finalDateValue = testDateValue
        //
        //                configureCalendarView()
        //
        //            }
        //
        //            if rangeofPeriod > 30
        //            {
        //                var nextMonthDate =  rangeofPeriod - 30
        //                nextMonthDate = nextMonthDate  - 1
        //                let nextMonth = monthSelected + 1
        //                monthSelected = nextMonth
        //
        //                rangeLastDate = lastFullDateSelected;
        //                //                    testMonth = lastFullDateSelected;
        //                newrangeLastDate = rangeLastDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                rangeMonth = newrangeLastDate
        //                rangeMonthValue = rangeMonth.changing(Calendar.Component.month, value:nextMonth )
        //                rangefinalDateValue = rangeMonthValue
        //                configureCalendarView()
        //            }
        //            else
        //            {
        //                var nextMonthDate =  rangeofPeriod
        //                nextMonthDate = nextMonthDate  - 1
        //                //                    let nextMonth = monthSelected + 1
        //                rangeLastDate = lastFullDateSelected;
        //                //                    testMonth = lastFullDateSelected;
        //                newrangeLastDate = rangeLastDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                //                    rangeMonth = newrangeLastDate
        //                //                    rangeMonthValue = rangeMonth.changing(Calendar.Component.month, value:nextMonth )
        //                rangefinalDateValue = newrangeLastDate
        //                configureCalendarView()
        //            }
        //
        //            }
        //           break;
        //
        //           case 2:
        //           do {
        //                if gapInPeriods > 28
        //                {
        //                    let nextMonthDate =  gapInPeriods - 28
        //                    let nextMonth = monthSelected + 1
        //                    monthSelected = nextMonth
        //
        //                    testDate = lastFullDateSelected;
        //                    //                    testMonth = lastFullDateSelected;
        //                    testDateValue = testDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                    testMonth = testDateValue
        //                    testMonthValue = testMonth.changing(Calendar.Component.month, value:nextMonth )
        //                    finalDateValue = testMonthValue
        //
        //                    configureCalendarView()
        //                }
        //                else
        //                {
        //                    let nextMonthDate = gapInPeriods
        //                    testDate = lastFullDateSelected;
        //                    testDateValue = testDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                    finalDateValue = testDateValue
        //
        //                    configureCalendarView()
        //
        //                }
        //            if rangeofPeriod > 28
        //            {
        //                var nextMonthDate =  rangeofPeriod - 28
        //                nextMonthDate = nextMonthDate  - 1
        //                let nextMonth = monthSelected + 1
        //                monthSelected = nextMonth
        //
        //                rangeLastDate = lastFullDateSelected;
        //                //                    testMonth = lastFullDateSelected;
        //                newrangeLastDate = rangeLastDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                rangeMonth = newrangeLastDate
        //                rangeMonthValue = rangeMonth.changing(Calendar.Component.month, value:nextMonth )
        //                rangefinalDateValue = rangeMonthValue
        //                configureCalendarView()
        //            }
        //            else
        //            {
        //                var nextMonthDate =  rangeofPeriod
        //                nextMonthDate = nextMonthDate  - 1                //                    let nextMonth = monthSelected + 1
        //                rangeLastDate = lastFullDateSelected;
        //                //                    testMonth = lastFullDateSelected;
        //                newrangeLastDate = rangeLastDate.changing(Calendar.Component.day, value:nextMonthDate )
        //                //                    rangeMonth = newrangeLastDate
        //                //                    rangeMonthValue = rangeMonth.changing(Calendar.Component.month, value:nextMonth )
        //                rangefinalDateValue = newrangeLastDate
        //                configureCalendarView()
        //            }
        //            }
        //           break;
        //
        //           default:
        //            break
        ////            return monthSelected + 1
        //            }
        //           var newMOnth =  monthSelected + 1
        //            monthSelected = newMOnth
        //            print(monthSelected, "new month is 9789t67ghvbjkhy8t78ywinmsbjkdgughdnjkh")
        //        }
        //
        //
        //
        //



        //            if 31 < gapInPeriods && monthSelected != 12
        //            {
        //                if {
        //
        //                }
        //
        //            }
        //













        //        let selectedDate = lastFullDateSelected.day
        //
        //        DaylastAddedwithDaySelected = selectedDate + lengthOfCycleDaysValue
        //
        //       let nextPeriodDate = DaylastAddedwithDaySelected - selectedMonthDays
        //        lengthOfCycleValue = lastFullDateSelected;
        //        newlengthOfCycleValue = rangeLastDate.changing(Calendar.Component.day, value:DaylastAddedwithDaySelected )
        //
        //
        //        let periodRangeValue = selectedDate + noOfDaysItLastValue
        //        print(periodRangeValue," periodRangeValue 898908878989887898989089089890809")
        //                    let newNoOfDateLast = lastFullDateSelected.day + noOfDaysItLastValue
        //        rangeLastDate = lastFullDateSelected;
        //        newvalue = rangeLastDate.changing(Calendar.Component.day, value: newNoOfDateLast)
        //        print(newvalue, "rangeLastDate kjbhiuguihhjnbhvjvhbhjvhjghkbhj")
        //
        //
        ////        print(nextPeriodDate, "sjuwlchdilioikuouioioipuouiouiyuoiyoiuy")
        //              configureCalendarView()

        //        }
        //        else
        //        {
        //             print("erooooooooooooooooooooooooooooooooooooor");
        //        }
        //

    }

    func configureCalendarView(){



        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        calendarView.height = 650
        calendarView.allowsRangedSelection = true

        //        let selectedDate = lastDate
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        //        dateFormatter.timeZone = TimeZone.init(abbreviation: "GMT-07:00")
        //        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        //        let mydate = dateFormatter.date(from:selectedDate)!
        //


        //        let newdate = mydate
        //        let month = Calendar.current.component(.month, from: newdate)
        //        print(month)

        self.calendarView.scrollToDate(lastFullDateSelected,animateScroll: false)
        if noOfDaysItLastValue == 1
        {
            print("workin if")
            self.calendarView.selectDates([ lastFullDateSelected, newdateValueUPdate ])
            //        self.calendarView.selectDates([ lastFullDateSelected, newvalue ])

            //
        }
        else
        {
            print("workin else")

            self.calendarView.selectDates([ lastFullDateSelected, newdateValueUPdate ])

            self.calendarView.selectDates(from:  lastFullDateSelected, to: newDxateRangeValue )


        }


    }

    // Configure the cell
    func configureCell(cell: JTACDayCell?, cellState: CellState) {
        guard let currentCell = cell as? CalendarCell else {
            return
        }

        currentCell.dateLabel.text = cellState.text
        configureSelectedStateFor(cell: currentCell, cellState: cellState)
        configureTextColorFor(cell: currentCell, cellState: cellState)
        let cellHidden = cellState.dateBelongsTo != .thisMonth
        currentCell.isHidden = cellHidden

    }
    // Configure text colors
    func configureTextColorFor(cell: JTACDayCell?, cellState: CellState){

        guard let currentCell = cell as? CalendarCell else {
            return
        }
        if cellState.isSelected{
            currentCell.dateLabel.textColor = UIColor.black
        }else{
            if cellState.dateBelongsTo == .thisMonth && cellState.date > Date()  {
                currentCell.dateLabel.textColor = UIColor.white
            }else{
                currentCell.dateLabel.textColor = UIColor.gray
            }
        }
    }

    func configureSelectedStateFor(cell: JTACDayCell?, cellState: CellState){

        guard let currentCell = cell as? CalendarCell else {
            return
        }
        if cellState.isSelected{
            currentCell.selectedView.isHidden = false
            currentCell.bgView.isHidden = true
        }else{
            currentCell.selectedView.isHidden = true
            currentCell.bgView.isHidden = true
        }
    }
    
    
    
    @IBAction func changeDateOfPeriods(_ sender: Any) {
        
        
        UserDefaults.standard.removeObject(forKey: "lastDate")
        UserDefaults.standard.removeObject(forKey: "noOfDaysItLastValue")
        UserDefaults.standard.removeObject(forKey: "lengthOfCycleDaysValue")
        UserDefaults.standard.removeObject(forKey: "selectedMonthDays")

        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "CalendarEntryStoryBoard")
        self.navigationController?.pushViewController(secondViewController!, animated: true)
        
        
    }
    
    
    
}

extension CalendarVC: JTACMonthViewDataSource{
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {

        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        configureCell(cell: cell, cellState: cellState)

    }



    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        formatter.dateFormat = "dd MM yy"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        calendar.scrollingMode = .stopAtEachSection

        let startDate = Calendar.current.startOfDay(for: formatter.date(from: "01 07 19")!)
        let endDate = Calendar.current.startOfDay(for: formatter.date(from: "31 12 20")!)

        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: numberOfRows,
                                                 calendar: Calendar.current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .tillEndOfRow,
                                                 firstDayOfWeek: .sunday,
                                                 hasStrictBoundaries: true)
        return parameters
    }


}

extension CalendarVC:JTACMonthViewDelegate{

    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {

        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        configureCell(cell: cell, cellState: cellState)
        cell.dateLabel.textColor = UIColor.black

        if (date >= lastFullDateSelected) {

            let currentCell = cell as CalendarCell
            currentCell.bgView.isHidden = false

            let deltaDays = Calendar.current.dateComponents([.day], from: lastFullDateSelected, to: date).day!
            let currentCycleDays = deltaDays % lengthOfCycleDaysValue
            if currentCycleDays >= noOfDaysItLastValue {
                if currentCycleDays < noOfDaysItLastValue + 2 {
                    currentCell.bgView.backgroundColor = color4
                } else if currentCycleDays < lengthOfCycleDaysValue - 2 {

                    currentCell.bgView.backgroundColor = color3
                } else {
                    currentCell.bgView.backgroundColor = color2
                }
            } else {
                currentCell.bgView.backgroundColor = color1
            }
        }
        return cell

    }

    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState) {
        configureCell(cell: cell, cellState: cellState)
    }

    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState) {
        configureCell(cell: cell, cellState: cellState)
    }



    func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "CalendarSectionHeaderView", for: indexPath)
        let date = range.start
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        (header as! CalendarSectionHeaderView).title.text = formatter.string(from: date)
        return header
    }

    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        return MonthSize(defaultSize: 40)
    }

}





extension Date: Strideable {
    public func distance(to other: Date) -> TimeInterval {
        return other.timeIntervalSinceReferenceDate - self.timeIntervalSinceReferenceDate
    }

    public func advanced(by n: TimeInterval) -> Date {
        return self + n
    }
}
