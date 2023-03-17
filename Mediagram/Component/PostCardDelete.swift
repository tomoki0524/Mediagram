//
//  PostCardDelete.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2022/03/14.
//

import SwiftUI

struct PostCardDelete: View {
    @ObservedObject var postCardDeleteService = PostCardDeleteService()
//    @ObservedObject var postCardFightService = PostCardFightService()

    @State private var animate = false
    private let duration: Double = 0.3
    private var animetionScale: CGFloat{
        postCardDeleteService.isLiked ? 0.5 : 2.0
    }
    
    init(post: PostModel) {
        self.postCardDeleteService.post = post
        self.postCardDeleteService.hasLikedPost()
    }
    
    var body: some View {

        VStack(alignment: .leading){

            HStack(spacing: 15){
                Button(action: {
                    self.animate = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute : {
                        self.animate = false
                    
                        if(self.postCardDeleteService.isLiked) {
                            self.postCardDeleteService.unlike()
                        } else{
                            self.postCardDeleteService.like()
                        }
                    })
                    
                    
                }) {
                        Image(systemName: (self.postCardDeleteService.isLiked) ? "delete.right.fill": "delete.right")
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor((self.postCardDeleteService.isLiked) ? .red : .black )

                }.padding().scaleEffect(animate ? animetionScale : 1)
                .animation(.easeIn(duration: duration))

                Spacer()

            }.padding(.leading, 16)

            }
        }
    }
