
//
//  JoinPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/15.
//

import SwiftUI

struct JoinPage: View {
  var body: some View {
    NavigationStack{
      ZStack{
        LinearGradient(gradient: Gradient(colors: [Color("MainColorLight"), Color.white]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack{
          Image("JoinPageImage2")
          //          .resizable()
            .frame(width: 136.26, height: 136.26)
            .offset(CGSize(width: 135, height: 0))
            .ignoresSafeArea()
          Image("JoinPageImage1")
            .resizable()
            .frame(width: 195, height: 195)
            .offset(CGSize(width: -15.0, height: 0))
          Text("Track,\nAdjust,\nSucceed.")
            .lineSpacing(5.0)
            .multilineTextAlignment(.leading)
            .frame(alignment: .leading)
            .font(.system(size: 74, weight: .heavy))
            .padding(.vertical)
            .foregroundColor(Color("TextColorGray"))
            .overlay(alignment: .topTrailing){
              Spacer()
              Image("JoinPageImage3")
                .resizable()
                .offset(CGSize(width: 30.0, height: 35.0))
                .frame(width: 106, height: 106)
            }
          HStack (alignment: .bottom){ //button
            Spacer()
            NavigationLink {
              TimerPage()
                .navigationBarBackButtonHidden()
            } label:{
              HStack(spacing: 4) {
                Text("Join")
                  .fontWeight(.semibold)
                Image(systemName: "arrow.right")
                  .fontWeight(.semibold)
              }
              .font(.title)
              .foregroundStyle(.white)
              .padding(.vertical, 16)
              .padding(.horizontal, 32)
              .background(Color("MainColor"))
              .clipShape(Capsule())
              .shadow(radius: 5, x: 0, y: 5)
            }
          }
          .frame(alignment: .bottomTrailing)
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 8)
        
      }

//      .navigationDestination(for: Destination.self) { destination in
//        switch destination {
//        case .timerPage:
//          TimerPage()
//            .navigationBarBackButtonHidden()
//        case .RegisterPage:
////          RegisterPage()
//          TimerPage()
//        }
//      }
    }
  }
}

enum Destination{
  case timerPage
  case RegisterPage
}

#Preview {
  JoinPage()
}
