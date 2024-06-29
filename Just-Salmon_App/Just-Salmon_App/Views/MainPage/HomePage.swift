//
//  HomePage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/26.
//

import SwiftUI

struct HomePage: View {
  @StateObject var viewModel = HomeViewModel()
  
  var body: some View {
    NavigationStack {
      ZStack{
        if let user = viewModel.user {
          profile(user: user)
        } else {
          LinearGradient(gradient: Gradient(colors: [Color("MainColorLight"), Color.white]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
          Text("Loading...")
        }
      }
    }
    .onAppear {
      viewModel.fetchUser()
    }
  }
  
  @ViewBuilder
  func profile(user: User) -> some View {
    //background
    LinearGradient(gradient: Gradient(colors: [Color("MainColorLight"), Color.white]), startPoint: .top, endPoint: .bottom)
      .ignoresSafeArea()
    
    VStack {
      ZStack {
        Image("JoinPageImage3")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 160, height: 160)
          .padding()
      }
      Text(user.name)
        .font(.largeTitle)
        .fontWeight(.bold)
      
      VStack{
        Button {
          //language selection
        } label: {
          HStack{
            Image(systemName: "globe")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 20, height: 20)
            Spacer()
              .frame(width: 25)
            Text("Language")
              .font(.subheadline)
            Spacer()
            Image(systemName: "chevron.right")
          }
          .padding()
        }
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("TextColorLightGray"), lineWidth: 1))
        .padding(.horizontal,20)
        .foregroundStyle(Color("TextColorLightGray"))
        
        Button {
          //language selection
        } label: {
          HStack{
            Image(systemName: "key")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 20, height: 20)
            Spacer()
              .frame(width: 25)
            Text("Password")
              .font(.subheadline)
            Spacer()
            Image(systemName: "chevron.right")
          }
          .padding()
        }
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("TextColorLightGray"), lineWidth: 1))
        .padding(.horizontal,20)
        .foregroundStyle(Color("TextColorLightGray"))
      }
      
      HStack{
        Image(systemName: "sun.max")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20)
          .foregroundStyle(Color("ThemeColorOrange"))
        Spacer()
          .frame(width: 25)
        VStack (alignment: .leading, spacing: 1) {
          Text("Times of Sun, Hot and Humid")
            .font(.subheadline)
            .foregroundStyle(Color("ThemeColorOrange"))
          Text("31°C, probability of precipitation: 10%")
            .font(.subheadline)
            .foregroundStyle(Color("TextColorLightGray"))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .padding()
      .overlay(RoundedRectangle(cornerRadius: 12)
        .stroke(Color("ThemeColorOrange"), lineWidth: 1))
      .background(RoundedRectangle(cornerRadius: 12)
        .fill(Color("ThemeColorLightOrange")))
      .padding(.horizontal,20)
      
      HStack{
        Image(systemName: "heart")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20)
          .foregroundStyle(Color("ThemeColorRed"))
        Spacer()
          .frame(width: 25)
        VStack (alignment: .leading, spacing: 1) {
          Text("You took more steps today")
            .font(.subheadline)
            .foregroundStyle(Color("ThemeColorRed"))
          Text("Total 15,046 steps today")
            .font(.subheadline)
            .foregroundStyle(Color.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .padding()
      .overlay(RoundedRectangle(cornerRadius: 12)
        .stroke(Color("ThemeColorRed"), lineWidth: 1))
      .background(RoundedRectangle(cornerRadius: 12)
        .fill(Color("ThemeColorPink")))
      .padding(.horizontal,20)
      
      HStack{
        Image(systemName: "rays")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20)
          .foregroundStyle(Color.white)
        Spacer()
          .frame(width: 25)
        VStack (alignment: .leading, spacing: 1) {
          Text("Please take some rest!")
            .font(.subheadline)
            .foregroundStyle(Color.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .padding()
      .overlay(RoundedRectangle(cornerRadius: 12)
        .stroke(Color("ThemeColorCyan"), lineWidth: 1))
      .background(RoundedRectangle(cornerRadius: 12)
        .fill(Color("ThemeColorCyan").opacity(0.9)))
      .padding(.horizontal,20)
      
      Button {
        viewModel.logOut()
      } label: {
        HStack{
          Image(systemName: "rectangle.portrait.and.arrow.right")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
          Spacer()
            .frame(width: 25)
          Text("Sign Out")
            .font(.subheadline)
          Spacer()
          Image(systemName: "chevron.right")
        }
        .padding()
      }
      .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.red, lineWidth: 1))
      .padding(.horizontal,20)
      .foregroundStyle(Color.red)
      
      Spacer()
    }
    
  }
}

#Preview {
  HomePage()
}
