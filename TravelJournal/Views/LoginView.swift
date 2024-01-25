//
//  LoginView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/24/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Log In", subtitle: "Welcome back", angle: 15, background: .pink)
                
               
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text:$viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text:$viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())
                    TLButton(title: "Log In", background: .blue
                    ) {
                        viewModel.login()
                    }
                    .padding()
                }
                
                // Create account
                VStack {
                    Text("No account?")
                    NavigationLink("Create account", destination: RegisterView().navigationBarBackButtonHidden(true))
                }
                
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
