//
//  AuthViewModel.swift
//  fbdesign-backend
//
//  Created by Jan Baez on 29/10/23.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject{
    @Published var userSession: Firebase.UserDefaults?
    @Published var currentUser: User?
    init(){
        FirebaseApp.configure()
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(withEmail emai: String, password: String, fullname: String) async throws {
        
    }
    
    func signOut(){
        
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async {
        
    }
    
}
