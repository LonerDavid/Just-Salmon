//
//  LoginViewModel.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/27.
//

import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import Foundation

class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var errorMessage = ""
  init() {}
  
  func login() {
    guard validate() else {
      return
    }
    Auth.auth().signIn(withEmail: email, password: password)
  }
  
  
  func googleSignIn() {
    
  }
  
  private func validate() -> Bool {
    errorMessage = ""
    guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
          !password.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMessage = "Please fill in all fields."
      return false
    }
    
    guard email.contains("@") && email.contains(".") else {
      errorMessage = "Please enter a valid email."
      return false
    }
    print("Called")
    
    return true
  }
}
