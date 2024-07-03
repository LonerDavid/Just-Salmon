//
//  GanttChartPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/7/2.
//
import SwiftUI

struct GanttChartPage: View {
  @State private var currentDate: Date
  @State var events: [Event]
  
  private let dayWidth: CGFloat = 50
  private let rowHeight: CGFloat = 40
  private let cornerRadius: CGFloat = 10
  
  init(events: [Event], startDate: Date) {
    self.events = events
    self._currentDate = State(initialValue: startDate)
  }
  
  private var monthStart: Date {
    Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: currentDate))!
  }
  
  private var numberOfDays: Int {
    Calendar.current.range(of: .day, in: .month, for: monthStart)?.count ?? 30
  }
  
  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color("MainColorLight"), Color.white]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        
        VStack {
          HStack {
            VStack(alignment: .leading, spacing: 5) {
              Text(yearString)
                .font(.caption)
                .fontWeight(.regular)
              Text(monthString)
                .font(.largeTitle)
                .fontWeight(.bold)
            }
            Spacer()
            Button {
              withAnimation {
                previousMonth()
              }
            } label: {
              //            Image(systemName: "chevron.left")
              //              .font(.title)
              Image(systemName: "arrowtriangle.left.fill")
                .font(.title)
            }
            Button {
              withAnimation {
                nextMonth()
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
                GanttChartPage(events: .stub, startDate: Date())
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
          
          ScrollView(.horizontal) {
            VStack(alignment: .leading, spacing: 20) {
              // Days header
              HStack(spacing: 0) {
                Text("Event")
                  .frame(width: 100, alignment: .center)
                Spacer()
                ForEach(0..<numberOfDays, id: \.self) { day in
                  Text("\(dayString(for: day))")
                    .frame(width: dayWidth)
                }
              }
              .padding(.vertical, 10)
              .background(Color.gray.opacity(0.2))
              .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
              
              // Events grouped by category and subcat
              ForEach(Category.allCases, id: \.self) { category in
                VStack(alignment: .leading, spacing: 5) {
                  Text(category.description)
                    .font(.headline)
                    .frame(width: 100, height: rowHeight - 4, alignment: .center)
                    .background(category.color)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                  
                  ForEach(groupedEvents(for: category), id: \.0) { subcat, events in
                    HStack(spacing: 0) {
                      Text(subcat ?? "")
                        .frame(width: 100, height: rowHeight - 4, alignment: .center)
                        .overlay(
                          RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(category.color, lineWidth: 1)
                        )
                      Spacer()
                      ZStack(alignment: .leading) {
                        Rectangle()
                          .fill(Color.clear)
                        ForEach(events, id: \.id) { event in
                          eventBar(for: event)
                        }
                      }
                      .frame(width: CGFloat(numberOfDays) * dayWidth, height: rowHeight)
                    }
                  }
                }
              }
            }
          }
          Spacer()
        }
      }
    }
  }
  
  private func eventBar(for event: Event) -> some View {
    guard let startDate = event.startTime?.dateUsingCurrentCalendar, let endDate = event.endTime?.dateUsingCurrentCalendar else {
      return AnyView(EmptyView())
    }
    
    let monthEnd = Calendar.current.date(byAdding: .month, value: 1, to: monthStart)!
    
    let eventStart = max(monthStart, startDate)
    let eventEnd = min(monthEnd, endDate)
    
    let eventStartOffset = Calendar.current.dateComponents([.day], from: monthStart, to: eventStart).day!
    let eventDuration = Calendar.current.dateComponents([.day], from: eventStart, to: eventEnd).day!
    
    let eventWidth = CGFloat(eventDuration + 1) * dayWidth // Add 1 to include the start day
    
    return AnyView(
      ZStack(alignment: .center) {
        RoundedRectangle(cornerRadius: cornerRadius)
          .fill(event.category.color.opacity(0.5))
        
        Text(event.name)
          .font(.caption)
          .foregroundColor(.primary)
        //          .padding(.leading, 5)
          .lineLimit(1)
      }
        .frame(width: max(0, eventWidth), height: rowHeight - 4)
        .offset(x: CGFloat(eventStartOffset) * dayWidth)
    )
  }
  
  private func groupedEvents(for category: Category) -> [(String?, [Event])] {
    let filteredEvents = eventsInCurrentMonth().filter { $0.category == category }
    let grouped = Dictionary(grouping: filteredEvents, by: { $0.subcat })
    return grouped.sorted(by: { ($0.key ?? "") < ($1.key ?? "") })
  }
  
  private func eventsInCurrentMonth() -> [Event] {
    let monthEnd = Calendar.current.date(byAdding: .month, value: 1, to: monthStart)!
    return events.filter { event in
      guard let startDate = event.startTime?.dateUsingCurrentCalendar, let endDate = event.endTime?.dateUsingCurrentCalendar else {
        return false
      }
      return startDate < monthEnd && endDate > monthStart
    }
  }
  
  private var monthYearString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy"
    return formatter.string(from: monthStart)
  }
  
  private var monthString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM"
    return formatter.string(from: monthStart)
  }
  
  private var yearString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    return formatter.string(from: monthStart)
  }
  
  private func dayString(for day: Int) -> String {
    let date = Calendar.current.date(byAdding: .day, value: day, to: monthStart)!
    let formatter = DateFormatter()
    formatter.dateFormat = "d"
    return formatter.string(from: date)
  }
  
  private func previousMonth() {
    if let newDate = Calendar.current.date(byAdding: .month, value: -1, to: currentDate) {
      currentDate = newDate
    }
  }
  
  private func nextMonth() {
    if let newDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate) {
      currentDate = newDate
    }
  }
}

extension DateComponents {
    var dateUsingCurrentCalendar: Date? {
        Calendar.current.date(from: self)
    }
}

#Preview {
  GanttChartPage(events: .stub, startDate: Date())
}
