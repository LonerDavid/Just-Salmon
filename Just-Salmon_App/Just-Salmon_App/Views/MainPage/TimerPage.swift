//
//  MainPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/18.
//

import SwiftUI

struct TimerPage: View {
  @State private var timeRemaining: TimeInterval = 1168
  @State private var timer: Timer?
  @State private var isRunning: Bool = false
  @State private var percentage1: Double = 0.5
  @State private var percentage2: Double = 0
  @State private var percentage3: Double = 0.75

  let radius: CGFloat = 250
  let spaceLength: CGFloat = 2.0 * Double.pi * 125
  
  
  
  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color("MainColorLight"), Color.white]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        
        VStack(alignment: .center) {
          ZStack {
            Circle()
              .stroke(Color("MainColor"), style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [0.2, 15], dashPhase: 0))
            Circle()
              .trim(from: 0,to: CGFloat(1 - (timeRemaining / 1168) + 0.25))
              .stroke(Color("MainColor"), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
              .rotationEffect(.degrees(-90))
            Circle()
              .stroke(Color("MainColor"), lineWidth: 1)
              .fill(.white)
              .frame(width: 14, height: 14)
              .offset(CGSize(width: 0, height: -125))
              .rotationEffect(Angle.degrees((Double(1 - (timeRemaining / 1168) + 0.25) * 360)))
            VStack {
              Text(formattedTime())
                .font(.system(size: 48, weight: .bold))
                .foregroundStyle(Color("TextColorLightGray"))
              Text("Work")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color("MainColor"))
            }
          }
          .frame(maxWidth: 250)
          
          VStack {
            HStack() {
              Text("Choose an event")
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(Color("TextColorLightGray"))
              Spacer()
            }
            .padding(.vertical)
            
            VStack(alignment: .center, spacing: 5) {
              NavigationLink(value: Destination.timerPage){
                HStack(spacing: 10) {
                  Image(systemName: "suitcase")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24, alignment: .leading)
                  Text("Work")
                    .padding(.leading, 10)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(Color("TextColorLightGray"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                  Text("2/4 hr")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(Color("TextColorLightGray"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                                  
                }
                .padding()
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .background(
                  GeometryReader { proxy in
                    Capsule(style: .continuous)
                      .fill(Color("ThemeColorRed"))
                      .frame(width: (proxy.size.width - 60) * percentage1 + 60)
                  }
                )
                .font(.title)
                .foregroundStyle(.white)
                .overlay(
                  Capsule(style: .continuous)
                    .stroke(Color("ThemeColorRed"), lineWidth: 2)
                )
              }
            }
            
            VStack(alignment: .center, spacing: 5) {
              NavigationLink(value: Destination.timerPage){
                HStack(spacing: 10) {
                  Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24, alignment: .leading)
                  Text("Social")
                    .padding(.leading, 10)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(Color("TextColorLightGray"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                  Text("0/4 hr")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(Color("TextColorLightGray"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                                  
                }
                .padding()
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .background(
                  GeometryReader { proxy in
                    Capsule(style: .continuous)
                      .fill(Color("ThemeColorCyan"))
                      .frame(width: (proxy.size.width - 60) * percentage2 + 60)
                  }
                )
                .font(.title)
                .foregroundStyle(.white)
                .overlay(
                  Capsule(style: .continuous)
                    .stroke(Color("ThemeColorCyan"), lineWidth: 2)
                )
              }
            }

            VStack(alignment: .center, spacing: 20) {
              NavigationLink(value: Destination.timerPage){
                HStack(spacing: 10) {
                  Image(systemName: "dumbbell")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24, alignment: .leading)
                  Text("Exercise")
                    .padding(.leading, 10)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(Color("TextColorLightGray"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                  Text("3/4 hr")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(Color("TextColorLightGray"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                                  
                }
                .padding()
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .background(
                  GeometryReader { proxy in
                    Capsule(style: .continuous)
                      .fill(Color("ThemeColorOrange"))
                      .frame(width: (proxy.size.width - 60) * percentage3 + 60)
                  }
                )
                .font(.title)
                .foregroundStyle(.white)
                .overlay(
                  Capsule(style: .continuous)
                    .stroke(Color("ThemeColorOrange"), lineWidth: 2)
                )
              }
            }
          }
          .padding(.horizontal)
        }
        .toolbar {
          //Still have to be modified in the future (lacking user's data)
          ToolbarItem(placement: .topBarLeading) {
            HStack (spacing: 20){
              Image("JoinPageImage3") //temporary
                .resizable()
                .frame(width: 60, height: 60)
              VStack (alignment: .leading){
                Text("Hi, Salmon") //temporary
                  .font(.title)
                  .fontWeight(.bold)
                  .foregroundStyle(Color("TextColorLightGray"))
                Text("Good Morning") //temporary
                  .font(.subheadline)
                  .foregroundStyle(Color("TextColorLightGray"))
              }
            }
            .padding(.top, 40)
            .frame(maxWidth: .infinity, alignment: .center)
            //          .background(.blue)
          }
          //Still have to be modified in the future
          ToolbarItem(placement: .topBarTrailing){
            Button {
              if isRunning {
                stopTimer()
              } else {
                startTimer()
                isRunning = true
              }
            } label: {
              Image(systemName: "bell.badge")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .symbolRenderingMode(.multicolor)
            }
            .padding(.top, 40)
          }
          
        }
      }
    }
  }
  
  private func formattedTime() -> String {
    let hours = Int(timeRemaining) / 3600
    let minutes = Int(timeRemaining) / 60 - hours * 60
    let seconds = Int(timeRemaining) % 60
    return String(format: "%02d:%02d:%02d", hours ,minutes, seconds)
  }
  
  private func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
      if timeRemaining > 0{
        timeRemaining -= 1
      }
      else {
        stopTimer()
      }
    }
  }
  
  private func stopTimer() {
    isRunning = false
    timer?.invalidate()
    timeRemaining = 1168
  }
}

#Preview {
  TimerPage()
}
