//
//  LoginView.swift
//  fbdesign-backend
//
//  Created by Jan Baez on 28/10/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack{
            VStack{
                // form fields
                VStack(spacing: 24){
                    InputView()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
