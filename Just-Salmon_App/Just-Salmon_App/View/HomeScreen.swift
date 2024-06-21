//
//  HomeScreen.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import SwiftUI

struct HomeScreen: View {
  @State var tab: Int = 3
    
    var body: some View {
      TabView (selection: $tab){
        TimerPage().tabItem {
          Image(systemName: "timer")
          Text("Timer")
        }.id(0)
        CalendarPage().tabItem {
          Image(systemName: "calendar")
          Text("Calendar")
        }.id(1)
        AddEventPage().tabItem {
          Image(systemName: "plus.circle.fill")
          Text("Add")
        }.id(2)
        AnalysisPage().tabItem {
          Image(systemName: "chart.bar.xaxis.ascending")
          Text("Analysis")
        }.id(3)
        TimerPage().tabItem {
          Image(systemName: "house")
            .resizable()
            .scaledToFit()
            .frame(width: 35, height: 35)
          Text("Home")
        }.id(4)
      }
    }
}

#Preview {
    HomeScreen()
}
