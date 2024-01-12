//
//  LoginView.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 11.01.24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationStack {
            Image("bank")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 80, maxHeight: 100)
                .padding(.vertical, 32)
            
            VStack(spacing: 24) {
                Text("Login")
                    .font(.custom("Avenir Next", size: 30))
                    .fontWeight(.semibold)
                
                
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@gmail.com")
                    .textInputAutocapitalization(.never)
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                HStack(alignment: .bottom) {
                    Spacer()
                    Text("Forgot Password?")
                        .fontWeight(.bold)
                        .font(.footnote)
                        .foregroundStyle(.blue)
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                Task {
                   try await viewModel.signIn(withEmail: email, password: password)
                }
            } label: {
                HStack {
                    Text("SIGN IN")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            
            .background(Color(.systemBlue))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden()
            } label: {
                HStack(spacing: 2) {
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}

#Preview {
    LoginView()
}


extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: LoginViewModel

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
        .onReceive(viewModel.$userSession) { _ in
          
        }
    }
}
