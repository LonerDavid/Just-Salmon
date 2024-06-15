//
//  JoinPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/15.
//

import SwiftUI

struct JoinPage: View {
  var body: some View {
    VStack{
      Spacer()
      Text("Track,\nAdjust,\nSucceed.")
        .lineSpacing(10.0)
        .multilineTextAlignment(.leading)
        .font(.system(size: 74, weight: .heavy))
//        .bold()
      HStack{
        Spacer()
        Button {
          
        } label: {
          HStack(spacing: 4) {
            Text("Join")
            Image(systemName: "arrow.right")
          }
          .font(.title)
          .foregroundStyle(.white)
          .padding(.vertical, 16)
          .padding(.horizontal, 32)
          .background(.orange)
          .clipShape(Capsule())
        }
      }
    }
    .padding(.horizontal, 32)
    .padding(.vertical, 8)
//    .background(.blue)
    
  }
}

#Preview {
  JoinPage()
}
