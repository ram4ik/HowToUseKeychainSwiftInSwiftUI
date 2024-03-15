//
//  ContentView.swift
//  HowToUseKeychainSwiftInSwiftUI
//
//  Created by Ramill Ibragimov on 3/15/24.
//

import SwiftUI
import KeychainSwift

struct ContentView: View {
    
    let keychain = KeychainSwift()
    
    @State private var userPassword: String = ""
    
    var body: some View {
        Button(userPassword.isEmpty ? "No password" : userPassword) {
            let newPassword = "def123!"
            keychain.set(newPassword, forKey: "user_password")
            userPassword = newPassword
        }
        .onAppear() {
            userPassword =  keychain.get("user_password") ?? ""
        }
    }
}

#Preview {
    ContentView()
}
