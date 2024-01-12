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
    @State private var showingAlert = false
    @State private var alertMessage = ""

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
                    do {
                        try await viewModel.signIn(withEmail: email, password: password)
                    } catch {
                        showingAlert = true
                    }
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
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Login Error"), message: Text("The email address or password you entered is incorrect. Please try again."), dismissButton: .default(Text("OK")))
            }

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
