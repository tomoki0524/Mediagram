//
//  PostCardFight.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2022/03/09.
//

import SwiftUI

//struct PostCardFight: View {
//    @ObservedObject var postCardFightService = PostCardFightService()
//
//    @State private var animate = false
//    private let duration: Double = 0.3
//
//    private var animetionScale: CGFloat{
//        postCardFightService.isFighted ? 0.5 : 2.0
//    }
//
//    init(post: PostModel) {
//        self.postCardFightService.post = post
//        self.postCardFightService.hasFightedPost()
//    }
//
//    var body: some View {
//
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
//                        if(self.postCardFightService.isFighted) {
//                            self.postCardFightService.unfight()
//                        } else{
//                            self.postCardFightService.fight()
//                        }
//                    })
//
//
//                }) {
//                    Image(systemName: (self.postCardFightService.isFighted) ? "hand.thumbsup.fill" : "hand.thumbsup")
//                            .frame(width: 25, height: 25, alignment: .center)
//                            .foregroundColor((self.postCardFightService.isFighted) ? .red : .black )
//
//                }.padding().scaleEffect(animate ? animetionScale : 1)
//                .animation(.easeIn(duration: duration))
////
////                NavigationLink(destination: CommentView(post: self.postCardService.post)){
////                Image(systemName: "bubble.right")
////                    .resizable()
////                    .aspectRatio(contentMode: .fit)
////                    .frame(width: 25, height: 25, alignment: .center)
////
////                }
////
////
//                Spacer()
//
//            }.padding(.leading, 16)
//
//            if(self.postCardFightService.post.fightCount > 0) {
//                Text("\(self.postCardFightService.post.fightCount) 頑張れ")
//            }
////            NavigationLink(destination: CommentView(post: self.postCardService.post)){
////
////            Text("View Comments").font(.caption)
////                .padding(.leading)
////            }
//
//            }
//
//    }
//}
//



struct PostCardFight: View {
    @ObservedObject var postCardFightService = PostCardFightService()
//    @ObservedObject var postCardFightService = PostCardFightService()

    @State private var animate = false
    private let duration: Double = 0.3
    private var animetionScale: CGFloat{
        postCardFightService.isLiked ? 0.5 : 2.0
    }
    
    init(post: PostModel) {
        self.postCardFightService.post = post
        self.postCardFightService.hasLikedPost()
    }
    
    var body: some View {

        VStack(alignment: .leading){

            HStack(spacing: 15){
                Button(action: {
                    self.animate = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute : {
                        self.animate = false
                    
                        if(self.postCardFightService.isLiked) {
                            self.postCardFightService.unlike()
                        } else{
                            self.postCardFightService.like()
                        }
                    })
                    
                    
                }) {
                        Image(systemName: (self.postCardFightService.isLiked) ? "hand.thumbsup.fill": "hand.thumbsup")
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor((self.postCardFightService.isLiked) ? .red : .black )

                }.padding().scaleEffect(animate ? animetionScale : 1)
                .animation(.easeIn(duration: duration))

                Spacer()

            }.padding(.leading, 16)

            if(self.postCardFightService.post.likeCount > 0) {
                Text("\(self.postCardFightService.post.likeCount) 頑張れ")
            }
            }
        }
    }
