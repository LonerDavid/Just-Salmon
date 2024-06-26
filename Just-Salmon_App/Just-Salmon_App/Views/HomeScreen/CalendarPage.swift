//
//  CalendarPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import SwiftUI
import MijickCalendarView

struct CalendarPage: View {
  @State private var selectedDate: Date? = nil
  @State private var selectedRange: MDateRange? = .init()
  
  var body: some View {
    MCalendarView(selectedDate: $selectedDate, selectedRange: $selectedRange)
  }
}
#Preview {
  CalendarPage()
}
