//
//  RegisterPage.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/6/17.
//

import SwiftUI
import FirebaseAuth

struct RegisterPage: View {
  @StateObject var viewModel = RegisterViewModel()
 
  // MARK: 是不是應該要增加輸入使用者姓名的地方
  var body: some View{
    NavigationStack {
      ZStack {
      LinearGradient(gradient: Gradient(colors: [Color("MainColor"), Color.white]), startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
      VStack {
        //title
        Text("Create An Account")
          .padding(.top, 10)
          .font(.title)
          .fontWeight(.medium)
        Text("Create an account to plan smarter!")
          .font(.subheadline)
          .fontWeight(.medium)
        
        //email & passowrd
        VStack {
          TextField("User Name", text: $viewModel.name)
            .padding(12)
            .font(Font.system(size: 15, weight: .medium))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.primary.opacity(0.1), lineWidth: 1))
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
          Spacer()
            .frame(height: 12)
          
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
        
        //buttons
        Text("Upload Your Animoji")
          .font(.subheadline)
          .fontWeight(.medium)
        
        Button {
          //Upload Animoji from user
        }label: {
          Image(systemName: "plus.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
          //          .font(.largeTitle)
            .foregroundStyle(Color.secondary)
            .padding(5)
        }
        Button {
          viewModel.register()
        } label: {
          HStack{
            Spacer()
              .frame(width: 50)
            Text("Create")
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
        
        VStack {
          Text("Alraedy have an account?")
            .fontWeight(.medium)
          NavigationLink {
            LoginPage()
          } label: {
            Text("Sign In")
//              .foregroundStyle(Color.black)
              .underline()
              .fontWeight(.medium)
          }
        }
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
  RegisterPage()
}
