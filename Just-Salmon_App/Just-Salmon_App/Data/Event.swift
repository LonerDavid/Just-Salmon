//
//  Event.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import Foundation

struct Event: Decodable, Identifiable {
  var id, name: String
  var date: DateInterval?
  var notes: String?
  
  var catagory: String
  var subcatagoty: String?
  
  init(id: String, name: String, date: DateInterval?, notes: String?, catagory: String, subcatagory: String?) {
    self.id = id
    self.name = name
    self.date = date
    self.notes = notes
    self.catagory = catagory
    self.subcatagoty = subcatagory
  }
}

extension Event {
  static let stub = Event(id: "0", name: "test", date: nil, notes: nil, catagory: "test", subcatagory: "test2")
}
