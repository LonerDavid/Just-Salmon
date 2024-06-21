
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
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 130)
            .offset(CGSize(width: 140, height: 0))
            .ignoresSafeArea()
          Image("JoinPageImage1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 195)
            .offset(CGSize(width: -30, height: -30))
          Text("Track,\nAdjust,\nSucceed.")
            .lineSpacing(5.0)
            .multilineTextAlignment(.leading)
            .frame(alignment: .leading)
            .font(.system(size: 70, weight: .heavy))
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
              HomeScreen()
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
//        case .registerPage:
////          RegisterPage()
//          TimerPage()
//        }
//      }
    }
  }
}

enum Destination{
  case timerPage
  case registerPage
}

#Preview {
  JoinPage()
}
