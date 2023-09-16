import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            VStack (alignment: .leading){
                Text("燃えるゴミの日")
                    .background(Color.red)
                    .font(.title)
                    .frame(height: 40)
                Text("燃えないゴミの日")
                    .background(Color.brown)
                    .font(.title)
            }
            CalendarView()
                .frame(height: 400)
        }
    }
    // 通知の許可申請
    init(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("許可されました！")
            }else{
                print("拒否されました...")
            }
        }
    }
    
    // 通知内容
    func sendNotificationRequest(){
        let content = UNMutableNotificationContent()
        content.title = "浜松ゴミ捨てカレンダー"
        content.body = "今日はゴミ捨ての日です！"
        content.sound = UNNotificationSound.default
        
        // 現在の日時を取得
        let today = Date()
        let current_mounth = Calendar.current.component(.month, from: today)
        let current_date = Calendar.current.component(.day, from: today)
        
        // トリガーを作成
        let triggerDate = DateComponents(month:current_mounth, day:current_date, hour:7, minute:30, second:0)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        // リクエストを作成
        let request = UNNotificationRequest.init(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(height: 400)
    }
}
