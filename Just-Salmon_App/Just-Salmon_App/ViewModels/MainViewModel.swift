//
//  MainViewModel.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/27.
//

import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {
  @Published var currentUserId: String = ""
  private var handler: AuthStateDidChangeListenerHandle?
  
  init() {
    self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
      DispatchQueue.main.async {
        self?.currentUserId = user?.uid ?? ""
      }
    }
  }
  
  public var isSignIn: Bool {
    return Auth.auth().currentUser != nil
  }
}
