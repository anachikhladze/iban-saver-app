//
//  RegistrationView.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 11.01.24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    
    @State private var containsCapitalLetter = false
    @State private var containsNumber = false
    @State private var containsSymbol = false
    @State private var isValidSize = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                signUpImage
                signUpText
            }
            inputFields
            conditionsVStack
            signUpButton
            Spacer()
            signInButton
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Success"),
                message: Text("You've registered successfully, you can sign in from the login page"),
                dismissButton: .default(Text("Ok"))
                {
                  dismiss()
                }
            )
        }
    }
    
    private var signUpImage: some View {
        Image("signup")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 80, maxHeight: 90)
    }
    
    private var signUpText: some View {
        Text("Sign Up")
            .font(.custom("Avenir Next", size: 26))
            .fontWeight(.semibold)
    }
    
    private var inputFields: some View {
        VStack(spacing: 24) {
            InputView(text: $email,
                      title: "Email Address",
                      placeholder: "name@gmail.com")
            .textInputAutocapitalization(.never)
            
            InputView(text: $fullname,
                      title: "Full Name",
                      placeholder: "Enter your name")
            
            InputView(text: $password,
                      title: "Password",
                      placeholder: "Enter your password",
                      isSecureField: true)
            .onChange(of: password) { newValue in
                validatePassword()
            }
            
            confirmPasswordField
        }
        .padding(.horizontal)
        .padding(.top, 2)
    }
    
    private var confirmPasswordField: some View {
        ZStack(alignment: .trailing) {
            InputView(text: $confirmPassword,
                      title: "Confirm Password",
                      placeholder: "Confirm your password",
                      isSecureField: true)
            
            if !password.isEmpty && !confirmPassword.isEmpty {
                if password == confirmPassword {
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemBlue))
                } else {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemRed))
                }
            }
        }
    }
    
    private var conditionsVStack: some View {
        VStack(alignment: .leading) {
            Group {
                HStack {
                    Image(systemName: containsCapitalLetter ? "checkmark.circle.fill" : "x.circle")
                        .foregroundStyle(Color(.systemBlue))
                    Text("At least one uppercase letter")
                }
                HStack {
                    Image(systemName: containsSymbol ? "checkmark.circle.fill" : "x.circle")
                        .foregroundStyle(Color(.systemBlue))
                    Text("At least one special symbol: \"@, #, $, %, &\"")
                }
                
                HStack {
                    Image(systemName: isValidSize ? "checkmark.circle.fill" : "x.circle")
                        .foregroundStyle(Color(.systemBlue))
                    Text("At least 8 characters in length")
                }
                HStack {
                    Image(systemName: containsNumber ? "checkmark.circle.fill" : "x.circle")
                        .foregroundStyle(Color(.systemBlue))
                    Text("At least one digit")
                }
            }
        }
        .padding(.top, 10)
        .font(.custom("Avenir Next", size: 15))
    }
    
    private var signUpButton: some View {
        SignInCustomButton(label: "SIGN UP") {
            try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
            showAlert = true
        }
        .disabled(!formIsValid)
        .opacity(formIsValid ? 1.0 : 0.5)
    }
    
    private var signInButton: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 2) {
                Text("Have an account?")
                Text("Sign In")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
        }
    }
}

#Preview {
    RegistrationView()
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && containsSymbol
        && containsNumber
        && containsCapitalLetter
        && !password.isEmpty
        && confirmPassword == password
        && isValidSize
        && !fullname.isEmpty
    }
    
    func validatePassword() {
        containsCapitalLetter = password.range(of: "[A-Z]", options: .regularExpression) != nil
        containsNumber = password.range(of: "[0-9]", options: .regularExpression) != nil
        containsSymbol = password.range(of: "[!@#$%^&*(),.?\":{}|<>]", options: .regularExpression) != nil
        isValidSize = password.count >= 8
    }
}
