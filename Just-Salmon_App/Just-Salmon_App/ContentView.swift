//
//  ContentView.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/8.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = MainViewModel()
  
  var body: some View {
    if viewModel.isSignIn, !viewModel.currentUserId.isEmpty {
      MainPage()
    } else {
      JoinPage()
    }
  }
}

#Preview {
  ContentView()
}
