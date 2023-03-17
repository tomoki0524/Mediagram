//
//  PostCardImage.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/09.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardImage: View {
    @EnvironmentObject var session: SessionStore
    @State var users: [User] = []
    
    @State var show = false
    @State private var isLinkActive = false
    var post: PostModel
    
    
    func listen(){
        session.listen()
    }

    var body: some View {

        VStack(alignment: .leading){

            HStack{
                WebImage(url: URL(string: post.profile)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60, alignment: .center)
                    .shadow(color: .gray, radius: 3)

                VStack(alignment: .leading, spacing: 4){
                    Text(post.username).font(.headline)
                    Text((Date(timeIntervalSince1970: post.date)).timeAgo() + "ago").font(.subheadline)

                    NavigationLink(destination: EditPost(session: self.session.session), isActive: $isLinkActive){
                    Button(action: {self.isLinkActive = true}){
                        Text("Edit Post").font(.title).modifier(ButtonModifiers())
                    }.padding(.horizontal)
                    }

                }.padding(.leading, 10)
            }.padding(.leading)
            .padding(.top, 16)

            Text(post.caption)
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 32)

            WebImage(url: URL(string: post.mediaUrl)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.size.width, height: 400, alignment: .center)
                .clipped()
        }
        
        
    }
    
    
    
}







//    VStack(alignment: .center, spacing: 30){
//
//        if self.show{
//
//            PopOver()
//                .background(Color.white)
//                .clipShape(ArrowShape())
//                .cornerRadius(15)
//                .offset(y: 15)
//
//        }
//
//        Button(action: {
//
//            withAnimation(.spring()){
//
//                self.show.toggle()
//            }
//
//        }) {
//
//            Image(systemName: self.show ? "xmark" : "list.triangle")
//                .resizable()
//                .frame(width: 20, height: 22)
//                .foregroundColor(.purple)
//                .padding()
//
//
//        }.background(Color.white)
//            .clipShape(Circle())
//    }
//    .padding()


//struct PostCardImage_Previews: PreviewProvider {
//    static var previews: some View {
//        PostCardImage()
//    }
//}
