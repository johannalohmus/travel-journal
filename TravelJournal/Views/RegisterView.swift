//
//  RegisterView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/24/24.
//

import SwiftUI

struct RegisterView: View {
    
    @State var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start logging now", angle: -15, background: .orange)
            
            // Login Form
            Form {
                TextField("Name", text:$viewModel.name).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email Address", text:$viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text:$viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())
                TLButton(title: "Register", background: .green
                ) {
                    viewModel.register();
                }
                .padding()
            }
            
            // Create account
            VStack {
                Text("Already have an account?")
                NavigationLink("Log in", destination: LoginView().navigationBarBackButtonHidden(true))
            }
            
            .padding(.bottom, 50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
