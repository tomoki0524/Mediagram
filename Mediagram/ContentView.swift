//
//  ContentView.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/09/30.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func listen(){
        session.listen()
    }
    
    var body: some View {
        
        Group{
            if(session.session != nil) {
                HomeView()
            } else {
                SignInView()
            }
        }.onAppear(perform: listen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
