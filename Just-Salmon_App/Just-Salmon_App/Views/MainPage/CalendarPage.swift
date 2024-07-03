//
//  CalendarPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import SwiftUI

struct CalendarPage: View {
  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color("MainColorLight"), Color.white]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()

        ScrollView(.vertical) {
          VStack(spacing: 20) {
            DatePickerPage()
          }
        }
        .padding(.bottom, 5)
      }
    }
  }
}
#Preview {
  CalendarPage()
}
