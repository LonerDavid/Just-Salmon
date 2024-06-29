//
//  CalendarPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import SwiftUI

struct CalendarPage: View {
  @State private var currentDate = Date()

  var body: some View {
    ScrollView(.vertical) {
      VStack(spacing: 20) {
        DatePickerPage(currentDate: $currentDate)
      }
    }
  }
}
#Preview {
  CalendarPage()
}
