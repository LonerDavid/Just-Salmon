//
//  Event.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import Foundation

struct Event: Decodable, Identifiable {
  var id = UUID().uuidString
  var name: String
  var time: Date = Date()
  var notes: String
  
  var catagory: String
  var subcatagoty: String
  
//  init(name: String, date: Date, notes: String, catagory: String, subcatagory: String) {
//    self.name = name
//    self.time = date
//    self.notes = notes
//    self.catagory = catagory
//    self.subcatagoty = subcatagory
//  }
}

struct Events: Decodable, Identifiable {
  var id = UUID().uuidString
  var events: [Event]
  var eventDate: Date
}

func getSampleDate(offset: Int) -> Date {
  let calendar = Calendar.current
  let date = calendar.date(byAdding: .day, value: offset, to: Date())
  
  return date ?? Date()
}

extension Event {
  static let stub = Event(name: "test", notes: "", catagory: "test1", subcatagoty: "test2")
}

var events: [Events] = [
  Events(events: [
    Event(name: "test1", notes: "", catagory: "cat1", subcatagoty: "subcat1-1"),
    Event(name: "test2", notes: "", catagory: "cat1", subcatagoty: "subcat1-2"),
    Event(name: "test3", notes: "", catagory: "cat2", subcatagoty: "subcat2-1")
  ], eventDate: getSampleDate(offset: 1)),
  
  Events(events: [
    Event(name: "test4", notes: "", catagory: "cat1", subcatagoty: "subcat1-1")
  ], eventDate: getSampleDate(offset: -3)),
  
  Events(events: [
    Event(name: "test5", notes: "", catagory: "cat2", subcatagoty: "subcat2-1")
  ], eventDate: getSampleDate(offset: -8)),
  
  Events(events: [
    Event(name: "test6", notes: "", catagory: "cat1", subcatagoty: "subcat1-3")
  ], eventDate: getSampleDate(offset: -20))

]
