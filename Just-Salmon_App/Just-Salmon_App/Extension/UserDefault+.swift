//
//  UserDefault+.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/7/4.
//

import Foundation
import SwiftUI

extension UserDefaults {
  enum Key: String {
    case event
  }
}

extension AppStorage {
  init(wrappedValue: Value, _ key: UserDefaults.Key, store: UserDefaults? = nil) where Value:
  RawRepresentable, Value.RawValue == String {
    self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
  }
}
