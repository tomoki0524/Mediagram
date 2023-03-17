//
//  PostCardSympathy.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2022/03/09.
//

import SwiftUI

struct PostCardSympathy: View {
    @ObservedObject var postCardSympathyService = PostCardSympathyService()
//    @ObservedObject var postCardFightService = PostCardFightService()

    @State private var animate = false
    private let duration: Double = 0.3
    private var animetionScale: CGFloat{
        postCardSympathyService.isLiked ? 0.5 : 2.0
    }
    
    init(post: PostModel) {
        self.postCardSympathyService.post = post
        self.postCardSympathyService.hasLikedPost()
    }
    
    var body: some View {

        VStack(alignment: .leading){

            HStack(spacing: 15){
                Button(action: {
                    self.animate = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute : {
                        self.animate = false
                    
                        if(self.postCardSympathyService.isLiked) {
                            self.postCardSympathyService.unlike()
                        } else{
                            self.postCardSympathyService.like()
                        }
                    })
                    
                    
                }) {
                        Image(systemName: (self.postCardSympathyService.isLiked) ? "person.2.circle.fill": "person.2.circle")
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor((self.postCardSympathyService.isLiked) ? .red : .black )

                }.padding().scaleEffect(animate ? animetionScale : 1)
                .animation(.easeIn(duration: duration))

                Spacer()

            }.padding(.leading, 16)

            if(self.postCardSympathyService.post.likeCount > 0) {
                Text("\(self.postCardSympathyService.post.likeCount) 共感")
            }
            }
        }
    }
