//
//  CommentInput.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/10.
//

//import SwiftUI
//import SDWebImageSwiftUI
//
//struct CommentCard: View {
//    @ObservedObject var commentDeleteService = CommentDeleteService()
//    var comment: CommentModel
//
//    @State private var animate = false
//    private let duration: Double = 0.3
//    private var animetionScale: CGFloat{
//        commentDeleteService.isLiked ? 0.5 : 2.0
//    }
//
//    var body: some View {
//        HStack {
//            WebImage(url: URL(string: comment.profile)!)
//
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .scaledToFit()
//                .clipShape(Circle())
//                .frame(width: 30, height: 30, alignment: .center)
//                .shadow(color: .gray, radius: 3)
//                .padding(.leading)
//
//            VStack (alignment: .leading){
//                Text(comment.username).font(.subheadline).bold()
//                Text(comment.comment).font(.caption)
//            }
//            Spacer()
//
//            Text((Date(timeIntervalSince1970: comment.date)).timeAgo() + "ago").font(.subheadline)
//            Button(action: {
//                self.animate = true
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute : {
//                    self.animate = false
//
//                    if(self.commentDeleteService.isLiked) {
//                        self.commentDeleteService.unlike(postId: String, onSuccess: ([CommentModel])-> Void, onError: (_, error: String) -> Void, newComment: @escaping(CommentModel) -> Void, listener: @escaping(_ listenerHandle: ListenerRegistration) -> Void)
//                    } else{
//                        self.commentDeleteService.like(comment: String, username: String, profile: String, ownerId: String, postId: String, onSuccess: () -> Void, onError: (_, error: String) -> Void)
//                    }
//                })
//
//
//            }) {
//                    Image(systemName: (self.commentDeleteService.isLiked) ? "delete.right.fill": "delete.right")
//                        .frame(width: 25, height: 25, alignment: .center)
//                        .foregroundColor((self.commentDeleteService.isLiked) ? .red : .black )
//
//            }
//         //   Text("delete.right")
//
//        }
//    }
//}


import SwiftUI
import SDWebImageSwiftUI
import Foundation
import Firebase


struct CommentCard: View {
    @ObservedObject var commentDeleteService = CommentDeleteService()
    var comment: CommentModel
    
//    func deleteComment() {
//     //   if !text.isEmpty {
//        PostCardDeleteService.like()
//    //  }
//    }

    var body: some View {
        HStack {
            WebImage(url: URL(string: comment.profile)!)

                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 30, height: 30, alignment: .center)
                .shadow(color: .gray, radius: 3)
                .padding(.leading)

            VStack (alignment: .leading){
                Text(comment.username).font(.subheadline).bold()
                Text(comment.comment).font(.caption)
            }
            Spacer()

            Text((Date(timeIntervalSince1970: comment.date)).timeAgo() + "ago").font(.subheadline)
          //  Button(action: deleteComment) {
                   
            Button(action: {
            }) {
                
                Image(systemName: "delete.right")
            }.padding()
        }
    }
}

//Button(action: uploadPost) {
//    Text("Post").font(.title).modifier(ButtonModifiers())
//}

//import SwiftUI
//
//struct CommentCard: View {
//    @ObservedObject var commentDeleteService = CommentDeleteService()
//    var comment: CommentModel
//
//    @State private var animate = false
//    private let duration: Double = 0.3
//    private var animetionScale: CGFloat{
//        commentDeleteService.isLiked ? 0.5 : 2.0
//    }
//
////    init(post: PostModel) {
////        self.commentDeleteService.post = post
////        self.commentDeleteService.hasLikedPost()
////    }
//
//    var body: some View {
//
//        VStack(alignment: .leading){
//
//            HStack(spacing: 15){
//                Button(action: {
//                    self.animate = true
//
//                    DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute : {
//                        self.animate = false
//
//                        if(self.postCardDeleteService.isLiked) {
//                            self.postCardDeleteService.unlike()
//                        } else{
//                            self.postCardDeleteService.like()
//                        }
//                    })
//
//
//                }) {
//                        Image(systemName: (self.postCardDeleteService.isLiked) ? "delete.right.fill": "delete.right")
//                            .frame(width: 25, height: 25, alignment: .center)
//                            .foregroundColor((self.postCardDeleteService.isLiked) ? .red : .black )
//
//                }.padding().scaleEffect(animate ? animetionScale : 1)
//                .animation(.easeIn(duration: duration))
//
//                Spacer()
//
//            }.padding(.leading, 16)
//
//            }
//        }
//    }
//
