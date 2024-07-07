//x
import SwiftUI

struct MainPage: View {
  enum Tab {
    case timer
    case calendar
    case analysis
    case home
  }
  
  @State var tab: Tab = .calendar
  @State var isPresent: Bool = false
  @State var editingEvent: Event?
  @AppStorage(.event) var events: [Event] = .stub
  
  var body: some View {
    ZStack(alignment: .bottom) {
      TabView(selection: $tab) {
        TimerPage().tabItem {
          Image(systemName: "timer")
          Text("Timer")
        }
        .id(Tab.timer)
        
        CalendarPage(events: events)
          .tabItem {
            Image(systemName: "calendar")
            Text("Calendar")
          }
          .id(Tab.calendar)
        
        Spacer()
        
        AnalysisPage(data: data)
          .tabItem {
            Image(systemName: "chart.bar.xaxis.ascending")
            Text("Analysis")
          }
          .id(Tab.analysis)
        
        HomePage()
          .tabItem {
            Image(systemName: "house")
              .resizable()
              .scaledToFit()
              .frame(width: 35, height: 35)
            Text("Home")
          }
          .id(Tab.home)
      }
      
      Button {
        isPresent = true
        editingEvent = .new
      } label: {
        Image(systemName: "plus.circle.fill")
          .resizable()
          .frame(width: 50, height: 50)
      }
      .frame(width: 80, height: 50)
      .background(.clear)
    }
    .sheet(item: $editingEvent) {
      NewEventPage(event: $0, onSave: onSave)
    }
  }
  
  func onSave(event: Event) {
    guard let index = events.index(ofID: event.id) else {
      events.insert(event, at: 0)
      return
    }
    print("Saved")
    events[index] = event
  }
  
  func onDelete(id: UUID) {
    guard let index = events.index(ofID: id) else {
      return
    }
    events.remove(at: index)
  }
}

#Preview {
  MainPage()
}
