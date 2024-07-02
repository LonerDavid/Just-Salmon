//
//  Event.swift
//  Just_Test
//
//  Created by Loner David on 2024/7/2.
//

import Foundation
import SwiftUI

struct Event: Hashable, Codable{
  var id: UUID
  var name: String
  var startTime: DateComponents?
  var EndTime: DateComponents?
  var notes: String?
  var progress: Double
  var catagory: Catagory
  var subcat: String?
  
  init(id: UUID = UUID(), name: String, startTime: DateComponents? = nil, EndTime: DateComponents? = nil, notes: String? = nil, progress: Double, catagory: Catagory, subcat: String? = nil) {
    self.id = id
    self.name = name
    self.startTime = startTime
    self.EndTime = EndTime
    self.notes = notes
    self.progress = progress
    self.catagory = catagory
    self.subcat = subcat
  }
}

enum Catagory: CaseIterable, Codable{
  case work
  case social
  case exercise
  
  var color: Color {
    switch self{
    case .work: .themeColorRed
    case .social: .themeColorCyan
    case .exercise: .themeColorOrange
    }
  }
  
  var description: String {
    switch self {
    case .work: "Work"
    case .social: "Social"
    case .exercise: "Exercise"
    }
  }
}

extension Event {
  static let stub = Event(name: "A copy", startTime: DateComponents(year: 2024, month: 7, day: 2, hour: 12), EndTime: DateComponents(year: 2024, month: 7,day: 3 ,hour: 12), progress: 0, catagory: .work, subcat: "YT A")
}

extension [Event] {
  static let stub = [
    Event(name: "A copy", startTime: DateComponents(year: 2024, month: 7, day: 2, hour: 12), EndTime: DateComponents(year: 2024, month: 7,day: 3 ,hour: 12), progress: 0, catagory: .work, subcat: "YT A"),
    Event(name: "B copy", startTime: DateComponents(year: 2024, month: 7, day: 5, hour: 12), EndTime: DateComponents(year: 2024, month: 7,day: 7 ,hour: 12), progress: 0, catagory: .work, subcat: "YT A"),
    Event(name: "Ideation", startTime: DateComponents(year: 2024, month: 7, day: 1, hour: 5), EndTime: DateComponents(year: 2024, month: 7,day: 1 ,hour: 12), progress: 0, catagory: .work, subcat: "YT B"),
    Event(name: "Script", startTime: DateComponents(year: 2024, month: 7, day: 4, hour: 7), EndTime: DateComponents(year: 2024, month: 7,day: 5 ,hour: 12), progress: 0, catagory: .work, subcat: "YT B"),
    Event(name: "Film", startTime: DateComponents(year: 2024, month: 7, day: 6, hour: 12), EndTime: DateComponents(year: 2024, month: 7,day: 7 ,hour: 12), progress: 0, catagory: .work, subcat: "YT B"),
    Event(name: "Trip", startTime: DateComponents(year: 2024, month: 7, day: 3, hour: 12), EndTime: DateComponents(year: 2024, month: 7,day: 6 ,hour: 12), progress: 0, catagory: .work, subcat: "Family"),
    Event(name: "Amy", startTime: DateComponents(year: 2024, month: 7, day: 2, hour: 8), EndTime: DateComponents(year: 2024, month: 7,day: 2 ,hour: 10), progress: 0, catagory: .work, subcat: "Friend"),
    Event(name: "Ben", startTime: DateComponents(year: 2024, month: 7, day: 7, hour: 12), EndTime: DateComponents(year: 2024, month: 7,day: 7 ,hour: 18), progress: 0, catagory: .work, subcat: "Friend"),
    Event(name: "Competition", startTime: DateComponents(year: 2024, month: 7, day: 3, hour: 12), EndTime: DateComponents(year: 2024, month: 7,day: 5 ,hour: 12), progress: 0, catagory: .work, subcat: "Swim"),
    Event(name: "Class", startTime: DateComponents(year: 2024, month: 7, day: 1, hour: 12), EndTime: DateComponents(year: 2024, month: 7,day: 3 ,hour: 12), progress: 0, catagory: .work, subcat: "Tennis"),
    Event(name: "Game", startTime: DateComponents(year: 2024, month: 7, day: 6, hour: 12), EndTime: DateComponents(year: 2024, month: 7,day: 7 ,hour: 12), progress: 0, catagory: .work, subcat: "Baseball")
  ]
}



