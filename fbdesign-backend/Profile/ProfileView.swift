//
//  ProfileView.swift
//  fbdesign-backend
//
//  Created by Jan Baez on 29/10/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            Section{
                HStack{
                    Text(user.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(user.fullname)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text(user.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Section("General"){
                HStack{
                    SettingsRowView(imageName: "gear",
                                    title: "Version",
                                    tintColor: Color(.systemGray))
                    Spacer()
                    
                    Text("0.0.1")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
            }
            Section("Account"){
                Button{
                    viewModel.signOut()
                } label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill",               title: "Sign Out",
                                    tintColor: .red)
                }
                
                Button{
                    print("Sign out..")
                } label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill",               title: "Delete Account",
                                    tintColor: .red)
                }
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
