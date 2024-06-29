//
//  AnalysisPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/21.
//

import Charts
import SwiftUI

struct AnalysisPage: View {
  @State var analysisPage: Bool = false
  
  var body: some View {
    NavigationStack {
      ZStack {
        //background
        LinearGradient(gradient: Gradient(colors: [Color("MainColorLight"), Color.white]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        
        VStack(alignment:.center) {
          HStack {
            Button {
              
            } label: {
              //            Image(systemName: "chevron.left")
              //              .font(.title)
              Image(systemName: "arrowtriangle.left.fill")
                .font(.largeTitle)
            }
            Spacer()
            VStack(alignment: .center, spacing: 10) {
//              Text(extraDate()[0])
              Text("June") //temp
                .font(.largeTitle)
                .fontWeight(.bold)
//              Text(extraDate()[1])
              Text("2024") //temp
                .font(.caption)
                .fontWeight(.regular)
            }
            Spacer()
            Button {
              
            }label: {
              //            Image(systemName: "chevron.right")
              //              .font(.title)
              Image(systemName: "arrowtriangle.right.fill")
                .font(.largeTitle)
            }
          }
          .padding(.top, 20)
          .padding(.horizontal, 20)
          
          TabView {
            VStack {
              HStack {
                Text("Time Allocation")
                  .padding()
                  .font(.title2)
                  .fontWeight(.medium)
                  .foregroundStyle(Color("ThemeColorRed"))
                Spacer()
              }
              
              Chart(data, id: \.category) { item in
                SectorMark(
                  angle: .value("Count", item.count), innerRadius: .ratio(0.8), angularInset: 2
                )
                //                  .foregroundStyle(item.color)
                .foregroundStyle(by: .value("Category", item.category))
                .cornerRadius(3)
                //                  .annotation(position: .trailing) {
                //                    Text("\(item.category)")
                //                  }
              }
              .chartLegend(alignment: .center, spacing: 16)
//              .aspectRatio(contentMode: .fit)
              .frame(width: .infinity, height: 220)
              .padding()
            }
            .background(RoundedRectangle(cornerRadius: 20)
              .fill(Color("ThemeColorPink")))
            .padding(.horizontal)
            
            VStack {
              HStack {
                Text("Progress Level")
                  .padding()
                  .font(.title2)
                  .fontWeight(.medium)
                  .foregroundStyle(Color("ThemeColorCyan"))
                Spacer()
              }
              
              Chart(data, id: \.category) { item in
                SectorMark(
                  angle: .value("Count", item.count), innerRadius: .ratio(0.8), angularInset: 2
                )
                //                  .foregroundStyle(item.color)
                .foregroundStyle(by: .value("Category", item.category))
                .cornerRadius(3)
                //                  .annotation(position: .trailing) {
                //                    Text("\(item.category)")
                //                  }
              }
              .scaledToFit()
              .frame(width: 220, height: 220)
              .padding()
            }
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
}

struct Category {
  var category: String
  var count: Int
  var color: Color
}

let data: [Category] = [
  .init(category: "Campus", count: 5, color: .blue),
  .init(category: "Social", count: 5, color: .mint),
  .init(category: "Sleep", count: 5, color: .purple),
  .init(category: "Work", count: 5, color: .red),
  .init(category: "Exercise", count: 5, color: .orange)
]

#Preview {
  AnalysisPage()
}
