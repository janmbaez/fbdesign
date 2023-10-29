//
//  RegistrationView.swift
//  fbdesign-backend
//
//  Created by Jan Baez on 28/10/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var ConfirmEmail = ""
    @State private var password = ""
    @State private var ConfirmPassword = ""
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        ZStack{
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("Registrate")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -60, y: -40)
                
                // Email
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                TextField("ConfirmeEmail", text: $ConfirmEmail)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Confirm Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                // Password
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Confirm Password", text: $ConfirmPassword)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Confirm Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                
                
                
                Button{
                    Task{
                        try await viewModel.createUser(withEmail: email, password: password,
                        fullname: fullname)
                    }
                } label: {
                    Text("Register")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing)))
                        .foregroundColor(.white)
                        Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
                
                
                Button{
                    dismiss()
                } label: {
                    HStack(spacing: 3){
                        Text("Already has an account?")
                            .bold()
                            .foregroundColor(.white)
                        Text("Sign in")
                            .bold()
                            .foregroundColor(.white)
                    }
                }

            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
}
 

#Preview {
    RegistrationView()
}



