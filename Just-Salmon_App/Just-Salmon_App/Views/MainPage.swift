//
//  HomeScreen.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

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
  
  var body: some View {
    ZStack(alignment: .bottom) {
      TabView(selection: $tab) {
        TimerPage().tabItem {
          Image(systemName: "timer")
          Text("Timer")
        }
        .id(Tab.timer)
        
        CalendarPage()
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
      } label: {
        Image(systemName: "plus.circle.fill")
          .resizable()
          .frame(width: 50, height: 50)
      }
      .frame(width: 80, height: 50)
      .background(.clear)
    }
    .sheet(
      isPresented: $isPresent
    ) {
      NewEventPage(event: .stub) { _ in }
    }
  }
}

#Preview {
    MainPage()
}
