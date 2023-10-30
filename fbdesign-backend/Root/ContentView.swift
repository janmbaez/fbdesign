//
//  ContentView.swift
//  fbdesign-backend
//
//  Created by Jan Baez on 28/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
            if viewModel.userSession != nil {
               ProfileView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
