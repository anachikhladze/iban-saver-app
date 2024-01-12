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
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationStack {
            signUpImage
            signUpText
            inputFields
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
            .frame(maxWidth: 80, maxHeight: 100)
            .padding(.vertical, 32)
    }
    
    private var signUpText: some View {
        Text("Sign Up")
            .font(.custom("Avenir Next", size: 30))
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
            
            confirmPasswordField
        }
        .padding(.horizontal)
        .padding(.top, 12)
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
                        .foregroundStyle(Color(.systemGreen))
                } else {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemRed))
                }
            }
        }
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
        && email.contains("@")
        && !password.isEmpty
        && confirmPassword == password
        && password.count > 5
        && !fullname.isEmpty
        
    }
}
