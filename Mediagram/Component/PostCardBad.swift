//
//  PostCardBad.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2022/03/09.
//

import SwiftUI

struct PostCardBad: View {
    @ObservedObject var postCardBadService = PostCardBadService()
//    @ObservedObject var postCardFightService = PostCardFightService()

    @State private var animate = false
    private let duration: Double = 0.3
    private var animetionScale: CGFloat{
        postCardBadService.isLiked ? 0.5 : 2.0
    }
    
    init(post: PostModel) {
        self.postCardBadService.post = post
        self.postCardBadService.hasLikedPost()
    }
    
    var body: some View {

        VStack(alignment: .leading){

            HStack(spacing: 15){
                Button(action: {
                    self.animate = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute : {
                        self.animate = false
                    
                        if(self.postCardBadService.isLiked) {
                            self.postCardBadService.unlike()
                        } else{
                            self.postCardBadService.like()
                        }
                    })
                    
                    
                }) {
                        Image(systemName: (self.postCardBadService.isLiked) ? "hand.thumbsdown.fill": "hand.thumbsdown")
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor((self.postCardBadService.isLiked) ? .red : .black )

                }.padding().scaleEffect(animate ? animetionScale : 1)
                .animation(.easeIn(duration: duration))

                Spacer()

            }.padding(.leading, 16)

            if(self.postCardBadService.post.likeCount > 0) {
                Text("\(self.postCardBadService.post.likeCount) 低評価")
            }
            }
        }
    }
