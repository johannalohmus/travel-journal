//
//  RegisterView.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/24/24.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            // Header
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.orange)
                    .rotationEffect(Angle(degrees:-15))
                VStack {
                    Text("Register")
                        .font(.system(size:50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text("Start logging!")
                        .font(.system(size:30))
                        .foregroundColor(Color.white)
                }
                .padding(.top,30)
            }
            .frame(width:UIScreen.main.bounds.width * 3, height:300)
            .offset(y:-100)
            
            // Login Form
            Form {
                TextField("Name", text:$name).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email Address", text:$email).textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text:$password).textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    // attempt log in
                } label:
                {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                        Text("Register")
                            .foregroundColor(Color.white)
                            .bold()
                    }
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
