//
//  CalendarPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import SwiftUI

struct CalendarPage: View {
  @State private var date = Date.now
  let dayOfWeek = Date.capitalizedFirstLettersOfWeekdays
    var body: some View {
      VStack {
        LabeledContent("Date/Time") {
          DatePicker("", selection: $date)
        }
      }
    }
}

#Preview {
    CalendarPage()
}
