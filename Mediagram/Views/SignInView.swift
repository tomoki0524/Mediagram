//
//  SignInView.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/09/30.
//
//
//import SwiftUI
//
//struct SignInView: View {
//    @State private var email: String = ""
//    @State private var password: String = ""
//
//    @State private var error:String = ""
//    @State private var showingAlert = false
//    @State private var alertTitle: String = "Oh No 😱"
//
//
//    func errorCheck() -> String? {
//        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
//            password.trimmingCharacters(in: .whitespaces).isEmpty
//            {
//
//            return "Please fill in all fields and provide an image"
//        }
//        return nil
//
//    }
//
//    func clear(){
//        self.email = ""
//        self.password = ""
//    }
//
//    func signIn() {
//        if let error = errorCheck() {
//            self.error = error
//            self.showingAlert = true
//            return
//        }
//
//        AuthService.signIn(email: email, password: password, onSucces: {
//            (user) in
//            self.clear()
//        }){
//            (errorMessage) in
//            print("Error \(errorMessage)")
//            self.error = errorMessage
//            self.showingAlert = true
//            return
//        }
//    }
//
//    var body: some View {
//
//        NavigationView {
//            VStack(spacing: 20){
//                    Image(systemName: "camera").font(.system(size: 60, weight: .black, design: .monospaced))
//
//                    VStack(alignment: .leading){
//                        Text("Welcome Back").font(.system(size: 32, weight: .heavy))
//                        Text("SignIn To Contine").font(.system(size: 16, weight: .medium))
//
//                    }
//
//                        FormField(value: $email, icon: "envelope.fill", placeholder: "E-mail")
//                        FormField(value: $password, icon: "lock.fill", placeholder: "Password", isSecure: true)
//
//    //                Button(action: { signIn()
//    //                    listen()
//    //
//    //                }){
//    //                        Text("Sign In").font(.title).modifier(ButtonModifiers())
//    //                    }.alert(isPresented: $showingAlert) {
//    //                        Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
//    //                }
//    //
//    //                HStack{
//    //                    Text("New?")
//    //                    NavigationLink(destination: SignUpView()){
//    //                    Text("Create an Account.").font(.system(size: 20, weight: .semibold))
//    //                        .foregroundColor(.black)
//    //                    }
//    //                }
//    //
//    //            }.padding()
//    //            }.navigationTitle("")
//    //            .navigationBarHidden(true)
//
//                        Button(action: signIn){
//                            Text("Sign In").font(.title).modifier(ButtonModifiers())
//                        }.alert(isPresented: $showingAlert) {
//                            Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
//                        }
//                    HStack{
//                        Text("New?")
//                        NavigationLink(destination: SignUpView()) {
//                            Text("Create an Account.").font(.system(size: 20, weight: .semibold))
//                                .foregroundColor(.black)
//                        }
//                        }
//            }.padding()
//        }
//
//    }
//}
//
//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var session: SessionStore
    
    func listen(){
        session.listen()
    }
    
    @State private var email: String = ""
    @State private var password: String = ""
    
        @State private var error:String = ""
        @State private var showingAlert = false
        @State private var alertTitle: String = "Oh No 😱"
    
        func errorCheck() -> String? {
            if email.trimmingCharacters(in: .whitespaces).isEmpty ||
                password.trimmingCharacters(in: .whitespaces).isEmpty
                {
    
                return "Please fill in all field."
            }
            return nil
    
        }
    
        func clear(){
            self.email = ""
            self.password = ""
        }
    
        func signIn() {
            if let error = errorCheck() {
                self.error = error
                self.showingAlert = true
                return
            }
    
            AuthService.signIn(email: email, password: password, onSucces: {
                (user) in
                self.clear()
            }) {
                (errorMessage) in
                print("Error \(errorMessage)")
                self.error = errorMessage
                self.showingAlert = true
                return
            }
        }
   
    
    var body: some View {
        NavigationView {
        VStack(spacing: 20){
            Image(systemName: "camera").font(.system(size: 60, weight: .black, design: .monospaced))
            
            VStack(alignment: .leading){
                Text("Welcome Back").font(.system(size: 32, weight: .heavy))
                Text("SignIn To Contine").font(.system(size: 16, weight: .medium))
                
            }
                FormField(value: $email, icon: "envelope.fill", placeholder: "E-mail")
                FormField(value: $password, icon: "lock.fill", placeholder: "Password", isSecure: true)
                
            Button(action: { signIn()
                listen()
                
            }){
                    Text("Sign In").font(.title).modifier(ButtonModifiers())
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
            }
            
            HStack{
                Text("New?")
                NavigationLink(destination: SignUpView()){
                Text("Create an Account.").font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                }
            }
            
        }.padding()
        }.navigationTitle("")
        .navigationBarHidden(true)
            
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
