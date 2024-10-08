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
  @State private var currentDate = Date()
  @State private var index = 0 //temporary, test only
  @FocusState var focusField: FocusField?
  
  var body: some View {
    NavigationStack{
      Form {
        Section{
          TextField("Title", text: $event.name)
            .focused($focusField, equals: .title)
          Picker("Catagory", selection: $event.category) {
            ForEach(Category.allCases, id: \.self) { state in
              Text(state.description)
            }
          }
          //TextField("Subcatagory", text: $Event.subcatagoty)
          TextField("Subcatagory", text: $event.subcat)
          .focused($focusField, equals: .subcategory)
        }
        
        Section {
          DatePicker("Start", selection: Binding(
            get: {
              event.startTime?.date ?? Date()
            },
            set: { newDate in
                event.startTime = Calendar.current.dateComponents([.year, .month, .day], from: newDate)
            }
        ))
          DatePicker("End", selection: Binding(
            get: {
              event.endTime?.date ?? Date().addingTimeInterval(3600)
            },
            set: { newDate in
              event.endTime = Calendar.current.dateComponents([.year, .month, .day], from: newDate)
            }
        ))
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
          TextField("Notes", text: Binding(
            get: { self.event.notes ?? "" },
            set: { self.event.notes = $0.isEmpty ? nil : $0 }
        ),  axis: .vertical)
            .focused($focusField, equals: .notes)
            .lineLimit(5...10)
        }
      }
      .navigationTitle("New Event")
      .navigationBarTitleDisplayMode(.inline)
      .scrollDismissesKeyboard(.immediately)
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
    }
  }
}

#Preview {
  NewEventPage(event: .stub) {_ in}
}
