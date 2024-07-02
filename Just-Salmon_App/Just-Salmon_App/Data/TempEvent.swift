//
//  Event.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import Foundation

struct TempEvent: Decodable, Identifiable, Hashable {
  var id = UUID()
  var name: String
  var notes: String?
  var time: DateComponents?
  var progress: Double
  
  var catagory: String
  var subcatagoty: String?
  
//  init(name: String, date: Date, notes: String, catagory: String, subcatagory: String) {
//    self.name = name
//    self.time = date
//    self.notes = notes
//    self.catagory = catagory
//    self.subcatagoty = subcatagory
//  }
}

struct TempEvents: Decodable, Identifiable {
  var id = UUID().uuidString
  var events: [TempEvent]
  var eventDate: Date
}

func getSampleDate(offset: Int) -> Date {
  let calendar = Calendar.current
  let date = calendar.date(byAdding: .day, value: offset, to: Date())
  
  return date ?? Date()
}

extension TempEvent {
  static let stub = TempEvent(name: "test", notes: "", time: Calendar.current.dateComponents(in: TimeZone.current, from: Date()), progress: 0, catagory: "test1", subcatagoty: "test2")
}

var tempEvents: [TempEvents] = [
  TempEvents(events: [
    TempEvent(name: "test1", notes: "", time: Calendar.current.dateComponents(in: TimeZone.current, from: Date()), progress: 0, catagory: "cat1", subcatagoty: "subcat1-1"),
    TempEvent(name: "test2", notes: "", time: Calendar.current.dateComponents(in: TimeZone.current, from: Date()), progress: 0, catagory: "cat1", subcatagoty: "subcat1-2"),
    TempEvent(name: "test3", notes: "", time: Calendar.current.dateComponents(in: TimeZone.current, from: Date()), progress: 0, catagory: "cat2", subcatagoty: "subcat2-1")
  ], eventDate: getSampleDate(offset: 1)),
  
  TempEvents(events: [
    TempEvent(name: "test4", notes: "", time: Calendar.current.dateComponents(in: TimeZone.current, from: Date()), progress: 0, catagory: "cat1", subcatagoty: "subcat1-1")
  ], eventDate: getSampleDate(offset: -3)),
]
