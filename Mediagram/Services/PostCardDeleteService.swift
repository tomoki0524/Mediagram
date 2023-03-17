//
//  PostCardDeleteService.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2022/03/14.
//

import Foundation
import Firebase
import SwiftUI

class PostCardDeleteService : ObservableObject {

    @Published var post: PostModel!
    @Published var isLiked = false
    func hasLikedPost() {
        isLiked = (post.likes["\(Auth.auth().currentUser!.uid)"] == true) ? true: false
    }

    func like() {
        post.likeCount += 1
        isLiked = true

        PostService.PostsUserId(userId: post.ownerId).collection("posts").document(post.postId).getDocument {

            (document, err) in

            if let doc = document, doc.exists {
                doc.reference.delete()
            }
        }
        PostService.AllPosts.document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": true])

        PostService.timelineUserId(userId: post.ownerId).collection("timeline").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": true])


    }

//        .getDocument {
//
//            (document, err) in
//
//            if let doc = document, doc.exists {
//                doc.reference.delete()
//
//                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
//            }

    func unlike() {
        post.likeCount -= 1
        isLiked = false

        PostService.PostsUserId(userId: post.ownerId).collection("posts").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": false])

        PostService.AllPosts.document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": false])

        PostService.timelineUserId(userId: post.ownerId).collection("timeline").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": false])


    }
}


//class PostCardDeleteService : ObservableObject {
//
//    @Published var post: PostModel!
//    @Published var isLiked = false
//    func hasLikedPost() {
//        isLiked = (post.likes["\(Auth.auth().currentUser!.uid)"] == true) ? true: false
//    }
//
//    func like() {
//        post.likeCount += 1
//        isLiked = true
//
//        PostService.PostsUserId(userId: post.ownerId).collection("posts").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": true])
//
//        PostService.AllPosts.document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": true])
//
//        PostService.timelineUserId(userId: post.ownerId).collection("timeline").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": true])
//
//
//    }
//
//    func unlike() {
//        post.likeCount -= 1
//        isLiked = false
//
//        PostService.PostsUserId(userId: post.ownerId).collection("posts").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": false])
//
//        PostService.AllPosts.document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": false])
//
//        PostService.timelineUserId(userId: post.ownerId).collection("timeline").document(post.postId).updateData(["likeCount": post.likeCount, "likes.\(Auth.auth().currentUser!.uid)": false])
//
//
//    }
//}
