//
//  User.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/27.
//

import Foundation

struct User: Codable {
  let id: String
  let name: String
  let email: String
  let joined: TimeInterval
}
