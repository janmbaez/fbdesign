//
//  fbdesign_backendApp.swift
//  fbdesign-backend
//
//  Created by Jan Baez on 28/10/23.
//

import SwiftUI
import Firebase

@main
struct fbdesign_backendApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
