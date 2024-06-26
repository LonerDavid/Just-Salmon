//
//  LoginPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/27.
//

import SwiftUI
import FirebaseAuth

struct LoginPage: View {
  @StateObject var viewModel = LoginViewModel()
  
  var body: some View{
    NavigationStack {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color("MainColor"), Color.white]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack {
          //title
          Text("Login with \nYour Account")
            .padding(.top, 10)
            .font(.title)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
          //email & passowrd
          VStack {
            TextField("Email Address", text: $viewModel.email)
              .padding(12)
              .font(Font.system(size: 15, weight: .medium))
              .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.primary.opacity(0.1), lineWidth: 1))
              .autocorrectionDisabled()
              .textInputAutocapitalization(.never)
            Spacer()
              .frame(height: 12)
            
            SecureField("Password", text: $viewModel.password)
              .padding(12)
              .font(Font.system(size: 15, weight: .medium))
              .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.primary.opacity(0.1), lineWidth: 1))
              .autocorrectionDisabled()
              .textInputAutocapitalization(.never)
          }
          .padding(10)
          
          if !viewModel.errorMessage.isEmpty {
            Text(viewModel.errorMessage)
              .foregroundStyle(Color.red)
              .font(.callout)
          }
          
          Button {
            viewModel.login()
          } label: {
            HStack{
              Spacer()
                .frame(width: 50)
              Text("Sign In")
              Spacer()
                .frame(width: 50)
            }
            .padding(5)
          }
          .font(.title)
          .fontWeight(.medium)
          .background(Color("MainColor"))
          .buttonStyle(.borderedProminent)
          .clipShape(RoundedRectangle(cornerRadius: 20))
          .padding()
          
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
        .padding(.horizontal)
      }
    }
  }
}


#Preview {
  LoginPage()
}
