//
//  CommentView.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/10.
//

import SwiftUI

struct CommentView: View {
    @StateObject var commentService = CommentService()

    var post: PostModel?
    var postId: String?

    var body: some View {
        VStack(spacing: 10) {
            ScrollView {
                if !commentService.comments.isEmpty{
                    ForEach(commentService.comments) {
                        (comment) in
                        CommentCard(comment: comment).padding(.top)
                    }
                }
            }
            CommentInput(post: post, postId: postId)
        }
        .navigationTitle("Comment")

        .onAppear{
            self.commentService.postId = self.post == nil ? self.postId :self.post?.postId

            self.commentService.loadComment()
        }
        .onDisappear{
            if self.commentService.listener != nil {
                self.commentService.listener.remove()
            }
        }
    }
}

