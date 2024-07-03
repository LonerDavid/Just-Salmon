//
//  AnalysisPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import Charts
import SwiftUI

struct AnalysisPage: View {
  @State private var selectedAngle: Double?
  @State private var currentDate: Date
  let data: [Cat]
  
  
  var body: some View {
    NavigationStack {
      ZStack {
        //background
        LinearGradient(gradient: Gradient(colors: [Color("MainColorLight"), Color.white]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        
        VStack(alignment:.center) {
          HStack {
            VStack(alignment: .leading, spacing: 5) {
              Text(yearString)
                .font(.caption)
                .fontWeight(.regular)
              Text(monthString)
                .font(.largeTitle)
                .fontWeight(.bold)
            }
            Spacer()
            Button {
              withAnimation {
                previousMonth()
              }
            } label: {
//              Image(systemName: "chevron.left")
//                .font(.largeTitle)
              Image(systemName: "arrowtriangle.left.fill")
                .font(.largeTitle)
            }
            Button {
              withAnimation {
                nextMonth()
              }
            }label: {
//              Image(systemName: "chevron.right")
//                .font(.largeTitle)
              Image(systemName: "arrowtriangle.right.fill")
                .font(.largeTitle)
            }
          }
          .padding(.top, 20)
          .padding(.bottom, 1)
          .padding(.horizontal, 20)
          
          TabView {
            VStack (spacing: 0){
              HStack {
                Text("Time Allocation")
                  .padding(.horizontal)
                  .padding(.top)
                  .font(.title2)
                  .fontWeight(.medium)
                  .foregroundStyle(Color("ThemeColorRed"))
                Spacer()
              }
              Chart(data, id: \.category) { item in
                SectorMark(
                  angle: .value("Count", item.count), innerRadius: .ratio(0.8), angularInset: 2
                )
                .foregroundStyle(by: .value("Category", item.category))
                .opacity(item.category == selectedItem?.category ? 1 : 0.5)
                .cornerRadius(3)
              }
              .chartForegroundStyleScale(
                domain: data.map { $0.category },
                range: data.map { $0.color }
              )
              .chartLegend(alignment: .center, spacing: 16)
              .chartAngleSelection(value: $selectedAngle)
              .frame(height: 220)
              .padding(.vertical, 20)
              .chartBackground { chartProxy in
                GeometryReader { geometry in
                  if let anchor = chartProxy.plotFrame {
                    let frame = geometry[anchor]
                    titleView
                      .position(x: frame.midX, y: frame.midY)
                  }
                }
              }
            }
            .frame(maxHeight: 300)
            .background(RoundedRectangle(cornerRadius: 20)
              .fill(Color("ThemeColorPink")))
            .padding(.horizontal)
            
            VStack (spacing: 0){
              HStack {
                Text("Progress Level")
                  .padding(.top)
                  .padding(.horizontal)
                  .font(.title2)
                  .fontWeight(.medium)
                  .foregroundStyle(Color("ThemeColorCyan"))
                Spacer()
              }
              GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 0) {
                  ForEach(data) { item in
                    VStack {
                      HStack {
                        Text(item.category)
                          .font(.callout.weight(.medium))
                        Spacer()
                        Text("\(item.count)" + "/12 hr")
                          .font(.callout.weight(.medium))
                      }
                      .padding(.horizontal)
                      .padding(.vertical, 2)
                      ZStack (alignment: .leading){
                        Capsule()
                          .frame(height: 6)
                          .foregroundStyle(.black.opacity(0.1))
                        Capsule()
                          .frame(height: 6)
                          .frame(maxWidth: .infinity)
                          .frame(maxWidth: ((geometry.size.width - 30) * Double(item.count) / 12), maxHeight: .infinity, alignment: .leading)
                          .foregroundStyle(item.color)
                      }
                      .padding(.horizontal, 15)
                    }
                    .padding(.vertical, 5)
                  }
                }
              }
              .frame(maxHeight: 300)
              .padding(.bottom, 10)
            }
            .frame(maxHeight: 300)
            .background(RoundedRectangle(cornerRadius: 20)
              .fill(Color("ThemeColorLightCyan")))
            .padding(.horizontal)
          }
          .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
          .frame(maxHeight: 350)
          
          VStack {
            HStack {
              Text("Recommendation")
                .padding()
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(Color("ThemeColorOrange"))
              Spacer()
            }
            HStack {
              Text("  Exercise  ")
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(6)
                .foregroundStyle(Color.white)
                .background(Color("ThemeColorOrange"))
                .clipShape(Capsule(style: .circular))
              Text("Completion rate is below 50%. Pay attention to your health!")
                .font(.subheadline)
            }
            .padding(.horizontal, 10)
            
            HStack {
              Text("     Work     ")
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(6)
                .foregroundStyle(Color.white)
                .background(Color("ThemeColorRed"))
                .clipShape(Capsule(style: .circular))
              Text("Allocate more time for work as they often take longer than planned.")
                .font(.subheadline)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
          }
          .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color("ThemeColorLightOrange")))
          .padding()
          
          Spacer()
        }
      }
    }
  }
  
  private let categoryRanges: [(category: String, range: Range<Double>)]
  private let totalPosts: Int
  
  init(data: [Cat]) {
    self.data = data
    self._currentDate = State(initialValue: Date())
    var total = 0
    categoryRanges = data.map {
      let newTotal = total + $0.count
      let result = (category: $0.category,
                    range: Double(total) ..< Double(newTotal))
      total = newTotal
      return result
    }
    self.totalPosts = total
  }
  
  var selectedItem: Cat? {
    guard let selectedAngle else { return nil }
    if let selected = categoryRanges.firstIndex(where: {
      $0.range.contains(selectedAngle)
    }) {
      return data[selected]
    }
    return nil
  }
  
  private var monthStart: Date {
    Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: currentDate))!
  }
  
  private var titleView: some View {
    VStack {
      Text(selectedItem?.category ?? "Total")
        .font(.title2.weight(.medium))
      Text((selectedItem?.count.formatted() ?? totalPosts.formatted()) + " hours")
        .font(.caption)
    }
  }
  private var monthString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM"
    return formatter.string(from: monthStart)
  }
  
  private var yearString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    return formatter.string(from: monthStart)
  }
  
  private func previousMonth() {
    if let newDate = Calendar.current.date(byAdding: .month, value: -1, to: currentDate) {
      currentDate = newDate
    }
  }
  
  private func nextMonth() {
    if let newDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate) {
      currentDate = newDate
    }
  }
}

struct Cat: Identifiable {
  var id: UUID = UUID()
  var category: String
  var count: Int
  var color: Color
}

let data: [Cat] = [
  .init(category: "Campus", count: 10, color: .blue),
  .init(category: "Social", count: 5, color: .mint),
  .init(category: "Sleep", count: 10, color: .purple),
  .init(category: "Work", count: 10, color: .red),
  .init(category: "Exercise", count: 10, color: .orange)
]

#Preview {
  AnalysisPage(data: data)
}
