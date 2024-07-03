//
//  AddEventPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import SwiftUI

struct NewEventPage: View {
  enum FocusField {
    case title
    case category
    case subcategory
    case notes
  }
  
  @Environment(\.dismiss) var dismiss
  @State var event: Event
  var onSave: (Event) -> Void
//  @State var tempSubcatagory: String
  
  
  @State private var currentDate = Date()
  @State private var index = 0 //temporary, test only
  @State private var test = "" //temporary, test only
  @FocusState var focusField: FocusField?
  
  var body: some View {
    NavigationStack{
      Form {
        Section{
          TextField("Title", text: $Event.name)
            .focused($focusField, equals: .title)
          Picker("Catagory", selection: $event.category) {
              ForEach(Category.allCases, id: \.self) { state in
                  Text(state.description)
              }
          }
          //TextField("Subcatagory", text: $Event.subcatagoty)
          TextField("Subcatagory", text: $test)
            .focused($focusField, equals: .subcategory)
        }
        
        Section {
          DatePicker("Start", selection: $currentDate)
          DatePicker("End", selection: $currentDate)
          Picker("Repeat",selection: $index) {
            Text("Never").tag(0)
            Text("Every Day").tag(1)
            Text("Every Week").tag(2)
            Text("Every 2 Weeks").tag(3)
            Text("Every Month").tag(4)
            Text("Every Year").tag(5)
          }
        }
        
        Section {
          //          TextField("Title", text: $Event.notes,  axis: .vertical)
          //              .lineLimit(5...10)
          TextField("Notes", text: $test,  axis: .vertical)
            .focused($focusField, equals: .notes)
            .lineLimit(5...10)
        }
      }
      .navigationTitle("New Event")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button {
            onSave(event)
            dismiss()
          } label: {
            Text("Save")
          }
        }
        
        ToolbarItem(placement: .cancellationAction) {
          Button {
            dismiss()
          } label: {
            Text("Cancel")
              .foregroundStyle(Color("TextColorLightGray"))
          }
        }
      }
      .onTapGesture {
        focusField = nil
      }
    }
  }
}

#Preview {
  NewEventPage(event: .stub) {_ in}
}
