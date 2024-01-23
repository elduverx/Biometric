//
//  ContentView.swift
//  Biometric
//
//  Created by duverney muriel on 26/09/23.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State var canShowSecretMessage: Bool = false
    let context = LAContext()
    
    var body: some View {
        VStack {
            Button {
                authenticate()
            } label: {
                VStack{
                    Image(systemName: "faceid").font(.system(size: 120))
                    Text("Toca el boton para mas info").font(.headline).padding(.top,20)
                }
            }
            if canShowSecretMessage{
                Text("Duver es lo mas bello ❣️").font(.largeTitle).bold().padding()
            }
        }
        .padding()
    }
    func authenticate(){
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "autenticate motherfucker") { success, error in
                if success{
                    canShowSecretMessage.toggle()
                }else {
                    print(" Error en la autenticacion ")
                }
            }
        }else{
            print("Error en el dispositivo con la autentication biometrica")
        }
    }
}

#Preview {
    ContentView()
}
