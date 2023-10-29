//
//  InputView.swift
//  fbdesign-backend
//
//  Created by Jan Baez on 28/10/23.
//

import SwiftUI

struct InputView: View {
    @State private var email = ""
    @State private var password = ""
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
                Text("Bienvenido")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -90, y: -100)
                
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
                
                Button{
                    Task{
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    Text("Sign in")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing)))
                        .foregroundColor(.white)
                        Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)
                
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                            .bold()
                            .foregroundColor(.white)
                        Text("Sign up")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .padding(.top)
                .offset(y: 110)
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
}
 

#Preview {
    InputView()
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        aligmnet: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: aligmnet) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
