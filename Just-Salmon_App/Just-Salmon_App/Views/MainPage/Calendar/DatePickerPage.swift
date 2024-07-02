//
//  DatePicker.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/28.
//

import SwiftUI

struct DatePickerPage: View {
  @Binding var currentDate: Date
  @State var currentMonth: Int = 0
  @State private var percentage1: Double = 0.5
  @State private var percentage2: Double = 0
  @State private var percentage3: Double = 0.75
  
  var body: some View {
    VStack {
      //Days
      let days: [String] =
      ["S", "M", "T", "W", "T", "F", "S"]
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
      
      //calendar view
      VStack{
        HStack (spacing: 10){
          ForEach(days, id: \.self) {day in
            Text(day)
              .font(.callout)
              .fontWeight(.semibold)
              .frame(maxWidth: .infinity)
          }
          
        }
        let columns = Array(repeating: GridItem(.flexible()), count: 7)
        
        LazyVGrid(columns: columns, spacing: 15) {
          ForEach(extractDate()) { value in
            CardView(value: value)
              .background(
                Capsule()
                  .fill(Color("ThemeColorOrange"))
                  .padding(.horizontal, 8)
                  .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
              )
              .onTapGesture {
                currentDate = value.date
              }
          }
        }
      }
      .padding(.bottom, 10)
      .padding(.horizontal, 5)
      
      //progress view
      VStack(alignment: .center, spacing: 5) {
        NavigationLink(value: Destination.timerPage){
          HStack(spacing: 10) {
            Image(systemName: "suitcase")
              .resizable()
              .scaledToFit()
              .frame(width: 24, height: 24, alignment: .leading)
            Text("Work")
              .padding(.leading, 10)
              .font(.system(size: 20, weight: .medium))
              .foregroundStyle(Color("TextColorLightGray"))
              .frame(maxWidth: .infinity, alignment: .leading)
            Text("2/4 hr")
              .font(.system(size: 20, weight: .medium))
              .foregroundStyle(Color("TextColorLightGray"))
              .frame(maxWidth: .infinity, alignment: .trailing)
            
          }
          .padding()
          .frame(width: 360, height: 56)
          .background(
            GeometryReader { proxy in
              Capsule(style: .continuous)
                .fill(Color("ThemeColorRed"))
                .frame(width: (proxy.size.width - 60) * percentage1 + 60)
            }
          )
          .font(.title)
          .foregroundStyle(.white)
          .overlay(
            Capsule(style: .continuous)
              .stroke(Color("ThemeColorRed"), lineWidth: 2)
          )
        }
      }
      VStack(alignment: .center, spacing: 5) {
        NavigationLink(value: Destination.timerPage){
          HStack(spacing: 10) {
            Image(systemName: "person")
              .resizable()
              .scaledToFit()
              .frame(width: 24, height: 24, alignment: .leading)
            Text("Social")
              .padding(.leading, 10)
              .font(.system(size: 20, weight: .medium))
              .foregroundStyle(Color("TextColorLightGray"))
              .frame(maxWidth: .infinity, alignment: .leading)
            Text("0/4 hr")
              .font(.system(size: 20, weight: .medium))
              .foregroundStyle(Color("TextColorLightGray"))
              .frame(maxWidth: .infinity, alignment: .trailing)
            
          }
          .padding()
          .frame(width: 360, height: 56)
          .background(
            GeometryReader { proxy in
              Capsule(style: .continuous)
                .fill(Color("ThemeColorCyan"))
                .frame(width: (proxy.size.width - 60) * percentage2 + 60)
            }
          )
          .font(.title)
          .foregroundStyle(.white)
          .overlay(
            Capsule(style: .continuous)
              .stroke(Color("ThemeColorCyan"), lineWidth: 2)
          )
        }
      }
      VStack(alignment: .center, spacing: 20) {
        NavigationLink(value: Destination.timerPage){
          HStack(spacing: 10) {
            Image(systemName: "dumbbell")
              .resizable()
              .scaledToFit()
              .frame(width: 24, height: 24, alignment: .leading)
            Text("Exercise")
              .padding(.leading, 10)
              .font(.system(size: 20, weight: .medium))
              .foregroundStyle(Color("TextColorLightGray"))
              .frame(maxWidth: .infinity, alignment: .leading)
            Text("3/4 hr")
              .font(.system(size: 20, weight: .medium))
              .foregroundStyle(Color("TextColorLightGray"))
              .frame(maxWidth: .infinity, alignment: .trailing)
            
          }
          .padding()
          .frame(width: 360, height: 56)
          .background(
            GeometryReader { proxy in
              Capsule(style: .continuous)
                .fill(Color("ThemeColorOrange"))
                .frame(width: (proxy.size.width - 60) * percentage3 + 60)
            }
          )
          .font(.title)
          .foregroundStyle(.white)
          .overlay(
            Capsule(style: .continuous)
              .stroke(Color("ThemeColorOrange"), lineWidth: 2)
          )
        }
      }
    }
    .onChange(of: currentMonth) {
      currentDate = getCurrentMonth()
    }
  }
  
  @ViewBuilder
  func CardView(value: DateValue) -> some View {
    VStack {
      if value.day != -1 {
        //
        if let event = tempEvents.first(where: { event in
          return isSameDay(date1: event.eventDate, date2: value.date)
        }){
          Text("\(value.day)")
            .font(.caption)
            .foregroundStyle(isSameDay(date1: event.eventDate, date2: currentDate) ? .white : .primary)
            .frame(maxWidth: .infinity)
          Spacer()
          Circle()
            .fill(isSameDay(date1: event.eventDate, date2: currentDate) ? .white : Color.accentColor)
            .frame(width: 8, height: 8)
        }
        else{
          Text("\(value.day)")
            .font(.caption)
            .foregroundStyle(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
            .frame(maxWidth: .infinity)
          Spacer()
        }
      }
    }
    .padding(.vertical, 9)
    .frame(height: 50, alignment: .top)
  }
  
  //checking dates
  func isSameDay(date1: Date, date2: Date) -> Bool {
    let calendar = Calendar.current
    return calendar.isDate(date1, inSameDayAs: date2)
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
  
  func extractDate() -> [DateValue]{
    let calendar = Calendar.current
    let currentMonth = getCurrentMonth()
    
    //Get current month and date
    var days = currentMonth.getAllDates().compactMap { date -> DateValue
      in
      let day = calendar.component(.day, from: date)
      return DateValue(day: day, date: date)
    }
    let firstWeekdays = calendar.component(.weekday, from: days.first?.date ?? Date())
    for _ in 0..<firstWeekdays - 1 {
      days.insert(DateValue(day: -1, date: Date()), at: 0)
    }
    return days
  }
  
  func monthlyCalendar() {
    
  }
  func weeklyCalendar() {
    
  }
  func ganttChart() {
    
  }
}

extension Date {
  func getAllDates() -> [Date] {
    let calendar = Calendar.current
    let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
    let range = calendar.range(of: .day, in: .month, for: startDate)!
    
    return range.compactMap { day -> Date in
      return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
    }
  }
}

#Preview {
  CalendarPage()
}
