//
//  GanttChartPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/7/2.
//

import SwiftUI

struct GanttChartPage: View {
  @State private var currentDate = Date()
  @State var currentMonth: Int = 0
  
  var body: some View {
    NavigationStack {
      ZStack {
        VStack {
          HStack {
            VStack(alignment: .leading, spacing: 5) {
              Text(extraDate()[1])
                .font(.caption)
                .fontWeight(.regular)
              Text(extraDate()[0])
                .font(.largeTitle)
                .fontWeight(.bold)
            }
            Spacer()
            Button {
              withAnimation {
                currentMonth -= 1
              }
            } label: {
              //            Image(systemName: "chevron.left")
              //              .font(.title)
              Image(systemName: "arrowtriangle.left.fill")
                .font(.title)
            }
            Button {
              withAnimation {
                currentMonth += 1
              }
            }label: {
              //            Image(systemName: "chevron.right")
              //              .font(.title)
              Image(systemName: "arrowtriangle.right.fill")
                .font(.title)
            }
            
            Menu {
              Button("Monthly Calendar", action: monthlyCalendar)
              Button("Weekly Calendar", action: weeklyCalendar)
              Button("Gantt Chart", action: ganttChart)
            }label: {
            Image(systemName: "calendar")
              .font(.title)
            }
          }
          .padding(.top, 20)
          .padding(.bottom, 10)
          .padding(.horizontal, 20)
          
          ScrollView(Axis.Set.horizontal) {
            Text("Test")
          }
          Spacer()
        }
      }
    }
    .onChange(of: currentMonth) {
      currentDate = getCurrentMonth()
    }
  }
  //extracting Year and Month for display
  func extraDate() -> [String] {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM YYYY"
    let date = formatter.string(from: currentDate)
    
    return date.components(separatedBy: " ")
  }
  
  func getCurrentMonth() -> Date {
    let calendar = Calendar.current
    guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
      return Date()
    }
    return currentMonth
  }
  
  func monthlyCalendar() {
    
  }
  func weeklyCalendar() {
    
  }
  func ganttChart() {
    
  }
}

#Preview {
  GanttChartPage()
}
