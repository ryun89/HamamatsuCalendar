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
                    Spacer()
            }
            CalendarView()
                .frame(height: 400)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(height: 400)
    }
}
