//
//  Main.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/01.
//

import SwiftUI
import FirebaseAuth

struct Main: View {
    
    @State var show = false

    @EnvironmentObject var session: SessionStore
    @StateObject var profileService = ProfileService()

    var body: some View {
        ScrollView{

            VStack{
                ForEach(self.profileService.posts, id:\.postId ) {
                    (post) in

                    PostCardImage(post: post)
                    PostCardDelete(post: post)
                    PostCardFight(post: post)
                    PostCardSympathy(post: post)
                    PostCardBad(post: post)
                    PostCard(post: post)
                  //  PostCardFight(post: post)
            
                    VStack{
                        
                        if self.show{
                            
                            PopOver()
                                .background(Color.white)
                                .clipShape(ArrowShape())
                                .cornerRadius(15)
                                .offset(y: 15)

                        }
                    
                        Button(action: {
                            
                            withAnimation(.spring()){
                                
                                self.show.toggle()
                            }
                            
                        }) {
                            
                            Image(systemName: self.show ? "xmark" : "list.triangle")
                                .resizable()
                                .frame(width: 20, height: 22)
                                .foregroundColor(.purple)
                                .padding()
                            
                            
                        }.background(Color.white)
                            .clipShape(Circle())
                    }.padding()
                   // .padding()
                }
            }

        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .onAppear{
            self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
    }
    }
}


//struct Main_Previews: PreviewProvider {
//    static var previews: some View {
//        Main()
//    }
//}
//


//alignment: .center, spacing: 15
