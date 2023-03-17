//
//  PostService.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/08.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage

class PostService {
    
    static var storeRoot = Firestore.firestore()

    static var Posts = AuthService.storeRoot.collection("posts")

    static var AllPosts = AuthService.storeRoot.collection("allPosts")
    static var Timeline = AuthService.storeRoot.collection("timeline")

    static func PostsUserId(userId: String) -> DocumentReference {
        return Posts.document("qyJ93QoJun9idZcK9ShV")
    }
    
//    static func AllPostsUserId(userId: String) -> DocumentReference {
//        return AllPosts.document(userId)
//    }
//

    static func timelineUserId(userId: String) -> DocumentReference {
        return Timeline.document(userId)
    }

    static func uploadPost(caption: String, imageData: Data, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String) -> Void) {

        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        let postId = PostService.PostsUserId(userId: userId).collection("posts").document().documentID
        
     //   let postId = PostService.AllPosts.collection("allPosts").document().documentID

        let storagePostRef = StorageService.storagePostId(postId: postId)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"

        StorageService.savePostPhoto(userId: userId, caption: caption, postId: postId, imageData: imageData, metadata: metadata, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)


    }
    
    
    
//    func unfollow(userId: String, followingCount: @escaping (_ followingCount: Int)-> Void, followersCount: @escaping (_ followersCount: Int)-> Void) {
//
//        ProfileService.followersId(userId: userId).getDocument {
//
//            (document, err) in
//
//            if let doc = document, doc.exists {
//                doc.reference.delete()
//
//                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
//            }
//        }
//    }
    
    
    static func loadPost(postId: String, onSuccess: @escaping(_ post: PostModel)-> Void){

        PostService.AllPosts.document(postId).getDocument {

            (snapshot, err) in

            guard let snap = snapshot else {
                print("Error")
                return
            }

            let dict = snap.data()

            guard let decoded = try? PostModel.init(fromDictionary: dict!)
            else {
                return
            }
            onSuccess(decoded)
        }
        
//        PostService.AllPostsUserId(userId: userId).collection("posts").getDocument {
//
//            (snapshot, err) in
//
//            guard let snap = snapshot else {
//                print("Error")
//                return
//            }
//
//            let dict = snap.data()
//
//            guard let decoded = try? PostModel.init(fromDictionary: dict!)
//            else {
//                return
//            }
//            onSuccess(decoded)
//        }
    }

    
    static func loadUserPosts(userId: String, onSuccess: @escaping(_ posts: [PostModel]) -> Void) {
        
    

        PostService.PostsUserId(userId: userId).collection("posts").getDocuments{
        (snapshot, error) in

            guard let snap = snapshot else {
                print("Error")
                return
            }

            var posts = [PostModel]()

            for doc in snap.documents {
                let dict = doc.data()
                guard let decoder = try? PostModel.init(fromDictionary: dict)

                else {
                    return
                }
                posts.append(decoder)
            }
            onSuccess(posts)
        }
        
        
//        PostService.PostsUserId(userId: userId).collection("posts").getDocuments{
//        (snapshot, error) in
//
//            guard let snap = snapshot else {
//                print("Error")
//                return
//            }
//
//            var posts = [PostModel]()
//
//            for doc in snap.documents {
//                let dict = doc.data()
//                guard let decoder = try? PostModel.init(fromDictionary: dict)
//
//                else {
//                    return
//                }
//                posts.append(decoder)
//            }
//            onSuccess(posts)
//        }
//
        
        //ここまでが既存のコード↑
        
        
//        PostService.AllPosts.getDocuments{
//        (snapshot, error) in
//
//            guard let snap = snapshot else {
//                print("Error")
//                return
//            }
//
//            var posts = [PostModel]()
//
//            for doc in snap.documents {
//                let dict = doc.data()
//                guard let decoder = try? PostModel.init(fromDictionary: dict)
//
//                else {
//                    return
//                }
//                posts.append(decoder)
//            }
//            onSuccess(posts)
//        }
        
       
    }
    
}
