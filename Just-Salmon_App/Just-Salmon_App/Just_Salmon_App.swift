//
//  Just_Salmon_AppApp.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/8.
//

import SwiftUI
import Firebase

@main
struct Just_Salmon_App: App {
  
  init() {
    FirebaseApp.configure()
  }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
