
import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        typealias UIViewType = FSCalendar
        
        let fsCalendar = FSCalendar()
        fsCalendar.delegate = context.coordinator
        fsCalendar.dataSource = context.coordinator
        
        fsCalendar.scrollDirection = .vertical //スクロールの方向
        fsCalendar.scope = .month //表示の単位（週単位 or 月単位）
        fsCalendar.locale = Locale(identifier: "ja")
        fsCalendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 20) //ヘッダーテキストサイズ
        fsCalendar.appearance.headerDateFormat = "yyyy年MM月" //ヘッダー表示のフォーマット
        fsCalendar.appearance.headerTitleColor = UIColor.label //ヘッダーテキストカラー
        fsCalendar.appearance.headerMinimumDissolvedAlpha = 0
        fsCalendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 20)
        fsCalendar.appearance.titleFont = UIFont.systemFont(ofSize: 16)
        fsCalendar.appearance.titleFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold) 
        fsCalendar.appearance.titleWeekendColor = .red
        fsCalendar.appearance.titleTodayColor = .orange
        fsCalendar.appearance.weekdayTextColor = .white
        fsCalendar.appearance.todayColor = .opaqueSeparator
        fsCalendar.appearance.todaySelectionColor = .clear

        fsCalendar.calendarWeekdayView.weekdayLabels[1].backgroundColor = .red
        fsCalendar.calendarWeekdayView.weekdayLabels[2].backgroundColor = .brown
        fsCalendar.backgroundColor = .gray
        fsCalendar.appearance.borderRadius = 0.6
        fsCalendar.calendarWeekdayView.weekdayLabels[4].backgroundColor = .red

        return fsCalendar
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator{
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        var parent:CalendarView
        
        init(_ parent:CalendarView){
            self.parent = parent
        }
    }
}
