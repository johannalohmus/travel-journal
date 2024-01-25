//
//  LoginView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/24/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            // Header
            HeaderView()
            
            // Login Form
            Form {
                TextField("Email Address", text:$email).textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text:$password).textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    // attempt log in
                } label:
                {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                        Text("Log In")
                            .foregroundColor(Color.white)
                            .bold()
                    }
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
