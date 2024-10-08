//
//  RegistrationView.swift
//  ThreadsTutorials
//
//  Created by YURIY IZBASH on 21. 9. 24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldsModifierTests())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldsModifierTests())
                
                TextField("Enter your fullname", text: $viewModel.fullName)
                    .modifier(ThreadsTextFieldsModifierTests())
                
                TextField("Enter your username", text: $viewModel.userName)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldsModifierTests())
            }
            
            Button {
                Task { try await viewModel.createUser()}
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 40)
                    .background(Color.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
               dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.black)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
