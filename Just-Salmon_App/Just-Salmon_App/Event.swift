//
//  Event.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import Foundation

struct Event: Decodable, Identifiable {
  let id, name: String
  var time: TimeInterval
  var date: DateInterval
}
