//
//  DatePicker.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/28.
//

import SwiftUI

struct DatePickerPage: View {
  @State private var currentDate: Date = Date()
  @State var currentMonth: Int = 0
  @State private var events: [Event] = .stub
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
          NavigationLink {
            CalendarPage()
              .navigationBarBackButtonHidden()
          } label: {
            Text("Monthly Calendar")
          }
          NavigationLink {
            CalendarPage()
              .navigationBarBackButtonHidden()
          } label: {
            Text("Weekly Calendar")
          }
          NavigationLink {
            GanttChartPage(events: .stub, startDate: Date())
              .navigationBarBackButtonHidden()
          } label: {
            Text("Gantt Chart")
          }
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
        
        LazyVGrid(columns: columns, spacing: 0) {
          ForEach(extractDate()) { value in
            CardView(value: value)
              .onTapGesture {
                withAnimation {
                  currentDate = value.date
                }
              }
          }
        }
//        .background(.blue)
        .padding(.horizontal, 8)
        
        VStack(spacing: 10) {
          Text("Events")
            .font(.title2.bold())
            .frame(maxWidth: .infinity, alignment: .leading)
          let dateEvents = getEventsForDateRange(start: currentDate, end: currentDate)
            if dateEvents != []{
              ForEach(dateEvents, id: \.id) { event in
                VStack(alignment:.leading, spacing: 10) {
                  HStack{
                    Text(getTimeString(components: event.startTime))
                    Image(systemName: "arrow.right")
                    Text(getTimeString(components: event.endTime))
                  }
                  .font(.caption)
                  Text(event.name)
                    .font(.title2)
                    .fontWeight(.medium)
                  Text(event.category.description + "/" + getSubcatString(subcat: event.subcat))
                    .font(.caption)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).fill(event.category.color.opacity(0.5)))
              }
            } else {
              VStack(alignment:.leading, spacing: 10) {
                Text("No Event Found")
              }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 20)
      }
      
      VStack {
        Text("Categories")
          .font(.title2.bold())
          .frame(maxWidth: .infinity, alignment: .leading)
        //progress view
        VStack(alignment: .center, spacing: 10) {
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
            .frame(height: 56)
            .frame(maxWidth: .infinity)
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
        VStack(alignment: .center, spacing: 10) {
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
            .frame(height: 56)
            .frame(maxWidth: .infinity)
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
            .frame(height: 56)
            .frame(maxWidth: .infinity)
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
      .padding(.horizontal)
      .padding(.bottom, 20)
    }
    .onChange(of: currentMonth) {
      currentDate = getCurrentMonth()
    }
  }
  
  @ViewBuilder
  func CardView(value: DateValue) -> some View {
    VStack(alignment: .leading, spacing: 2) {
      if isSameMonth(date: value.date) {
        Text("\(value.day)")
          .font(.caption2)
          .foregroundStyle(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
          .background(
            Circle()
              .fill(Color(isSameDay(date1: value.date, date2: currentDate) ? .themeColorRed : .clear))
              .frame(width: 15, height: 15)
          )
          .frame(maxWidth: .infinity, alignment: .topLeading)
          .padding(.leading, 4)
          .padding(.top, 2)
        
        let dateEvents = getEventsForDateRange(start: value.date, end: value.date)
        
        VStack(spacing: 2) {
          ForEach(dateEvents.prefix(3), id: \.id) { event in
            EventView(event: event, date: value.date)
          }
        }
        
        if dateEvents.count > 3 {
          Text("+\(dateEvents.count - 3) more")
            .font(.system(size: 8))
            .foregroundColor(.gray)
            .padding(.leading, 4)
        }
      } else {
        Color.clear
      }
    }
    .frame(height: 80, alignment: .top)
  }
  func EventView(event: Event, date: Date) -> some View {
    HStack(spacing: 0) {
      Text(event.name)
        .font(.system(size: 8))
        .fontWeight(.medium)
        .lineLimit(1)
        .foregroundColor(.primary)
        .padding(.horizontal, 2)
        .frame(maxWidth: .infinity) // This will make the text expand to fill available space
    }
    .frame(height: 14)
    .background(RoundedRectangle(cornerRadius: 5, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).fill(event.category.color.opacity(0.5)))
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
  func getTimeString(components: DateComponents?) -> String {
    guard let hasComponents = components else { return "" }
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, h:mm a"
    guard let date = Calendar.current.date(from: hasComponents) else { return "" }
    let dateString = formatter.string(from: date)
    return dateString
  }
  func getSubcatString(subcat: String?) -> String {
    guard let hasSubcat = subcat else {return ""}
    return hasSubcat
  }
  func getCurrentMonth() -> Date {
    let calendar = Calendar.current
    var dateComponents = calendar.dateComponents([.year, .month], from: Date())
    dateComponents.month! += currentMonth
    return calendar.date(from: dateComponents) ?? Date()
  }
  func extractDate() -> [DateValue] {
    let calendar = Calendar.current
    let currentMonth = getCurrentMonth()
    
    guard let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth))
    else { return [] }
    
    let startingWeekday = calendar.component(.weekday, from: firstDayOfMonth)
    
    let totalDays = 7 * 6 // 6 weeks
    
    var dates: [DateValue] = []
    
    for day in 0..<totalDays {
      let offsetDate = calendar.date(byAdding: .day, value: day - (startingWeekday - 1), to: firstDayOfMonth)!
      let extractedDay = calendar.component(.day, from: offsetDate)
      dates.append(DateValue(day: extractedDay, date: offsetDate))
    }
    
    return dates
  }
  func getEventsForDateRange(start: Date, end: Date) -> [Event] {
    return events.filter { event in
      guard let startTime = event.startTime, let endTime = event.endTime,
            let eventStart = Calendar.current.date(from: startTime),
            let eventEnd = Calendar.current.date(from: endTime) ,
            let newEnd = Calendar.current.date(byAdding: .day, value: 1, to: start) else { return false }
      return eventStart <= newEnd && eventEnd >= start
    }
  }
  func isSameMonth(date: Date) -> Bool {
    let calendar = Calendar.current
    return calendar.isDate(date, equalTo: currentDate, toGranularity: .month)
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
extension Calendar {
  func generateDates(
    inside interval: DateInterval,
    matching components: DateComponents
  ) -> [Date] {
    var dates: [Date] = []
    dates.append(interval.start)
    
    enumerateDates(
      startingAfter: interval.start,
      matching: components,
      matchingPolicy: .nextTime
    ) { date, _, stop in
      if let date = date {
        if date < interval.end {
          dates.append(date)
        } else {
          stop = true
        }
      }
    }
    
    return dates
  }
}

#Preview {
  CalendarPage()
}
