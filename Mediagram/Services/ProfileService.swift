//
//  ProfileService.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/08.
//

import Foundation
import Firebase

class ProfileService: ObservableObject{
    
    @Published var posts: [PostModel] = []
    @Published var following = 0
    @Published var followers = 0
    //@Published var isLoading = false
    
    @Published var followCheck = false
        
    
    static var following = AuthService.storeRoot.collection("posts")
    static var followers = AuthService.storeRoot.collection("followers")
    
    static func followingCollection(userid: String) -> CollectionReference{

        return following.document(userid).collection("posts")
    }
    
    static func followersCollection(userid: String) -> CollectionReference{

        return followers.document(userid).collection("followers")
    }
    
    static func followingId(userId: String) -> DocumentReference {

        return following.document(Auth.auth().currentUser!.uid).collection("followingposts").document(userId)
    }

    static func followersId(userId: String) -> DocumentReference {

        return followers.document(userId).collection("followers").document(Auth.auth().currentUser!.uid)
    }

    func followState(userid: String) {
        ProfileService.followingId(userId: userid).getDocument {
            (document, error) in

            if let doc = document, doc.exists {
                self.followCheck = true
            } else {
                self.followCheck = false
            }
        }

    }
    
    func loadUserPosts(userId: String) {

        PostService.loadUserPosts(userId: "qyJ93QoJun9idZcK9ShV") { (posts) in
            
        //PostService.loadUserPosts(userId: userId) { (posts) in

            self.posts = posts
        }

        follows(userId: userId)
        followers(userId: userId)
    }
    
//    func loadUserPosts(userId: String) {
//
//        PostService.loadPost(postId: postId, onSuccess: <#T##(PostModel) -> Void##(PostModel) -> Void##(_ post: PostModel) -> Void#>) { (posts) in
//
//            self.posts = posts
//        }
//
//        follows(userId: userId)
//        followers(userId: userId)
//    }
//
    
    func follows(userId: String) {

        ProfileService.followingCollection(userid: userId).getDocuments {
           (querysnapshot, err) in

            if let doc = querysnapshot?.documents {
                self.following = doc.count
            }
        }
    }
    
    func followers(userId: String) {

        ProfileService.followersCollection(userid: userId).getDocuments {
           (querysnapshot, err) in

            if let doc = querysnapshot?.documents {
                self.followers = doc.count
            }
        }
    }
}
