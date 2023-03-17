//
//  CommentDeleteService.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2022/04/29.

//
import Foundation
import Firebase


class CommentDeleteService: ObservableObject {

    @Published var isLoading = false
    @Published var comments: [CommentModel] = []
    var postId: String!
    var listener: ListenerRegistration!
    var post: PostModel!
    
    @Published var isLiked = false
       func hasLikedPost() {
           isLiked = (post.likes["\(Auth.auth().currentUser!.uid)"] == true) ? true: false
       }



    static var commentsRef = AuthService.storeRoot.collection("comments")

    static func commentsId(postId: String) -> DocumentReference {

        return commentsRef.document(postId)
    }


    func like(comment: String, username: String, profile: String, ownerId: String, postId: String, onSuccess: @escaping() -> Void, onError: @escaping(_ error: String) -> Void) {

        let comment = CommentModel(profile: profile, postId: postId, username: username, date: Date().timeIntervalSince1970, comment: comment, ownerId: ownerId)

        guard let dict = try? comment.asDictionary() else {
            return
        }

        CommentService.commentsId(postId: postId).collection("comments").addDocument(data: dict).delete() {


            (err) in

            if let err = err {
                onError(err.localizedDescription)
                return
            }

            onSuccess()
        }
    }

    func unlike(postId: String, onSuccess: @escaping ([CommentModel])-> Void, onError: @escaping(_ error: String) -> Void, newComment: @escaping(CommentModel) -> Void, listener: @escaping(_ listenerHandle: ListenerRegistration) -> Void) {

        let listenerPosts = CommentService.commentsId(postId: postId).collection("comments").order(by: "date", descending: false).addSnapshotListener {

            (snapshot, err) in

            guard let snapshot = snapshot else {return}

            var comments = [CommentModel] ()

            snapshot.documentChanges.forEach{
                (diff) in

                if (diff.type == .added){
                    let dict = diff.document.data()
                    guard let decoded = try? CommentModel.init(fromDictionary: dict) else{
                        return
                    }

                    newComment(decoded)
                    comments.append(decoded)
                }
                if (diff.type == .modified){
                    print("Modified")
                }

                if (diff.type == .removed){
                    print("Removal")
                }
            }

            onSuccess(comments)
        }
        listener(listenerPosts)
    }


    func loadComment() {
        self.comments = []
        self.isLoading = true

        self.unlike(postId: postId, onSuccess: {

            (comments) in
            if self.comments.isEmpty {
                self.comments = comments
            }
        }, onError: {
            (err) in

        }, newComment: {
            (comment) in

            if !self.comments.isEmpty {
                self.comments.append(comment)
            }
        }) {
            (listener) in
            self.listener = listener

        }
    }

    func deleteComment(comment: String, onSuccess: @escaping()-> Void) {

        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }

        guard let username = Auth.auth().currentUser?.displayName else {
            return
        }

        guard let profile = Auth.auth().currentUser?.photoURL?.absoluteString else {
            return
        }

        like(comment: comment, username: username, profile: profile, ownerId: currentUserId, postId: post.postId, onSuccess: {
            onSuccess()
        }) {
            (err) in
        }

    }
}



//import Foundation
//import Firebase
//import SwiftUI
//
//class CommentDeleteService : ObservableObject {
//
//    @Published var post: PostModel!
//    @Published var isLiked = false
//    func hasLikedPost() {
//        isLiked = (post.likes["\(Auth.auth().currentUser!.uid)"] == true) ? true: false
//    }
//
//    func like() {
//      //  post.likeCount += 1
//        isLiked = true
//
//        PostService.PostsUserId(userId: post.ownerId).collection("pposts").document(post.postId).getDocument {
//
//            (document, err) in
//
//            if let doc = document, doc.exists {
//                doc.reference.delete()
//            }
//        }
//        PostService.AllPosts.document(post.postId).updateData(["llikeCount": post.likeCount, "llikes.\(Auth.auth().currentUser!.uid)": true])
//
//        PostService.timelineUserId(userId: post.ownerId).collection("ttimeline").document(post.postId).updateData(["llikeCount": post.likeCount, "llikes.\(Auth.auth().currentUser!.uid)": true])
//
//
//    }
//
////        .getDocument {
////
////            (document, err) in
////
////            if let doc = document, doc.exists {
////                doc.reference.delete()
////
////                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
////            }
//
//    func unlike() {
//     //   post.likeCount -= 1
//        isLiked = false
//
//        PostService.PostsUserId(userId: post.ownerId).collection("pposts").document(post.postId).updateData(["llikeCount": post.likeCount, "llikes.\(Auth.auth().currentUser!.uid)": false])
//
//        PostService.AllPosts.document(post.postId).updateData(["llikeCount": post.likeCount, "llikes.\(Auth.auth().currentUser!.uid)": false])
//
//        PostService.timelineUserId(userId: post.ownerId).collection("ttimeline").document(post.postId).updateData(["llikeCount": post.likeCount, "llikes.\(Auth.auth().currentUser!.uid)": false])
//
//
//    }
//}
