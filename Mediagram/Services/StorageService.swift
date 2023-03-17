//
//  StorageService.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/09/30.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage

// firebase timeline



//class StorageService {
//
//    static var storage = Storage.storage()
//
//    static var storageRoot = storage.reference()
//
//    static var storageProfile = storageRoot.child("profile")
//
//    static var storagePost = storageRoot.child("posts")
//
//    static func storagePostId(postId:String) -> StorageReference {
//        return storagePost.child(postId)
//    }
//
//
//    static func storageProfile(userId:String) -> StorageReference {
//        return storageProfile.child(userId)
//    }
//
//
//
//    static func editProfile(userId:String, username: String, bio: String, imageData: Data, metaData: StorageMetadata, storageProfileImageRef: StorageReference, onError: @escaping(_ errorMessage: String) -> Void) {
//
//        storageProfileImageRef.putData(imageData, metadata: metaData) {
//           (StorageMetadata, error) in
//
//            if error != nil {
//                onError(error!.localizedDescription)
//                return
//            }
//
//            storageProfileImageRef.downloadURL{
//                (url, error) in
//                if let metaImageUrl = url?.absoluteString{
//
//                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
//                        changeRequest.photoURL = url
//                        changeRequest.displayName = username
//                        changeRequest.commitChanges{
//                            (error) in
//                            if error != nil{
//
//                                onError(error!.localizedDescription)
//                                return
//                            }
//                        }
//                    }
//                    let firestoreUserId = AuthService.getUserId(userId: userId)
//
//                    firestoreUserId.updateData([
//                        "profileImageUrl": metaImageUrl,
//                        "username": username,
//                        "bio": bio
//                    ])
//
//                }
//
//                }
//        }
//    }
//
//    static func saveProfileImage(userId:String, username:String, email:String, imageData:Data, metaData:StorageMetadata, storageProfileImageRef: StorageReference, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
//
//        storageProfileImageRef.putData(imageData, metadata: metaData) {
//           (StorageMetadata, error) in
//
//            if error != nil {
//                onError(error!.localizedDescription)
//                return
//            }
//
//            storageProfileImageRef.downloadURL{
//                (url, error) in
//                if let metaImageUrl = url?.absoluteString{
//
//                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
//                        changeRequest.photoURL = url
//                        changeRequest.displayName = username
//                        changeRequest.commitChanges{
//                            (error) in
//                            if error != nil{
//
//                                onError(error!.localizedDescription)
//                                return
//                            }
//                        }
//                    }
//                    let firestoreUserId = AuthService.getUserId(userId: userId)
//                    let user = User.init(uid: userId, email: email, profileImageUrl: metaImageUrl, username: username, searchName: username.splitString(), bio: "")
//
//                    guard let dict = try?user.asDictionary() else {return}
//
//                    firestoreUserId.setData(dict){
//                        (error) in
//                        if error != nil{
//                            onError(error!.localizedDescription)
//                        }
//                    }
//
//                    onSuccess(user)
//                }
//            }
//        }
//    }
//
//    static func savePostPhoto(userId:String, caption: String, postId: String, imageData: Data, metadata: StorageMetadata, storagePostRef: StorageReference, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void ) {
//
//
//
//
//                storagePostRef.downloadURL{
//                    (url, error) in
//                    if let metaImageUrl = url?.absoluteString{
//
//                        let firestorePostRef = PostService.PostsUserId(userId: userId).collection("posts").document(postId)
//
//                        let post = PostModel.init(caption: caption, likes: [:], geoLocation: "", ownerId: userId, postId: postId, username: Auth.auth().currentUser!.displayName!, profile: Auth.auth().currentUser!.photoURL!.absoluteString, mediaUrl: metaImageUrl, date: Date().timeIntervalSince1970, likeCount: 0)
//
//                        guard let dict = try? post.asDictionary() else {return}
//
//                        firestorePostRef.setData(dict) {
//                            (error) in
//                            if error != nil {
//                                onError(error!.localizedDescription)
//                                return
//                            }
//
//                            PostService.timelineUserId(userId: userId).collection("timeline").document(postId).setData(dict)
//
//                            PostService.AllPosts.document(postId).setData(dict)
//                            onSuccess()
//                        }
//
//
//                    }
//            }
//        }
//    }
//
//

//Firebase Timeline......倉庫....

//class StorageService {
//
//    static var storage = Storage.storage()
//
//    static var storageRoot = storage.reference()
//
//    static var storageProfile = storageRoot.child("profile")
//
//    static var storagePost = storageRoot.child("post")
//
//    static func storagePostId(postId:String) -> StorageReference {
//            return storageProfile.child(postId)
//        }
//
//    static func storageProfileId(userId:String) -> StorageReference {
//            return storageProfile.child(userId)
//        }
//
//    static func saveProfileImage(userId:String, username:String, email:String, imageData:Data, metaData:StorageMetadata, storageProfileImageRef: StorageReference, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
//
//        storageProfileImageRef.putData(imageData, metadata: metaData) {
//           (StorageMetadata, error) in
//
//            if error != nil {
//                onError(error!.localizedDescription)
//                return
//            }
//
//            storageProfileImageRef.downloadURL{
//                (url, error) in
//                if let metaImageUrl = url?.absoluteString{
//
//                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
//                        changeRequest.photoURL = url
//                        changeRequest.displayName = username
//                        changeRequest.commitChanges{
//                            (error) in
//                            if error != nil{
//
//                                onError(error!.localizedDescription)
//                                return
//                            }
//                        }
//                    }
//                    let firestoreUserId = AuthService.getUserId(userId: userId)
//                    let user = User.init(uid: userId, email: email, profileImageUrl: metaImageUrl, username: username, searchName: username.splitString(), bio: "")
//
//                    guard let dict = try?user.asDictionary() else {return}
//
//                    firestoreUserId.setData(dict){
//                        (error) in
//                        if error != nil{
//                            onError(error!.localizedDescription)
//                        }
//                    }
//
//                    onSuccess(user)
//                }
//            }
//        }
//    }
//
//    static func savePostPhoto(user:String, caption: String, postId: String, image: Data, metadata: StorageMetadata, storagePostRef: StorageReference, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
//
//        storageProfileImageRef.putData(imageData, metadata: metaData) {
//           (StorageMetadata, error) in
//
//            if error != nil {
//                onError(error!.localizedDescription)
//                return
//            }
//
//            storagePostRef.putData(imageData, metadata: metaData)
//
//            (StorageMetadata, error) in
//
//             if error != nil {
//                 onError(error!.localizedDescription)
//                 return
//             }
//        }
//    }
//
//
//}

class StorageService {

    static var storage = Storage.storage()

    static var storageRoot = storage.reference()

    static var storageProfile = storageRoot.child("profile")

    static var storagePost = storageRoot.child("posts")

    static func storagePostId(postId:String) -> StorageReference {
        return storagePost.child(postId)
    }


    static func storageProfile(userId:String) -> StorageReference {
        return storageProfile.child(userId)
    }



    static func editProfile(userId:String, username: String, bio: String, imageData: Data, metaData: StorageMetadata, storageProfileImageRef: StorageReference, onError: @escaping(_ errorMessage: String) -> Void) {

        storageProfileImageRef.putData(imageData, metadata: metaData) {
           (StorageMetadata, error) in

            if error != nil {
                onError(error!.localizedDescription)
                return
            }

            storageProfileImageRef.downloadURL{
                (url, error) in
                if let metaImageUrl = url?.absoluteString{

                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges{
                            (error) in
                            if error != nil{

                                onError(error!.localizedDescription)
                                return
                            }
                        }
                    }
                    let firestoreUserId = AuthService.getUserId(userId: userId)
                    
               //     let firestoreUsersId = AuthService.getUserssId(userId: userId)


                    firestoreUserId.updateData([
                        "profileImageUrl": metaImageUrl,
                        "username": username,
                        "bio": bio,
                      //  "searchName": searchName
                    ])

                }

                }
        }
    }

    static func saveProfileImage(userId:String, username:String, email:String, imageData:Data, metaData:StorageMetadata, storageProfileImageRef: StorageReference, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {

        storageProfileImageRef.putData(imageData, metadata: metaData) {
           (StorageMetadata, error) in

            if error != nil {
                onError(error!.localizedDescription)
                return
            }

            storageProfileImageRef.downloadURL{
                (url, error) in
                if let metaImageUrl = url?.absoluteString{

                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges{
                            (error) in
                            if error != nil{

                                onError(error!.localizedDescription)
                                return
                            }
                        }
                    }
                    let firestoreUserId = AuthService.getUserId(userId: userId)
                    
             //       let firestoreUsersId = AuthService.getUserssId(userId: userId)
                    
                    
                    let user = User.init(uid: userId, email: email, profileImageUrl: metaImageUrl, username: username, searchName: username.splitString(), bio: "")

                    guard let dict = try?user.asDictionary() else {return}

                    firestoreUserId.setData(dict){
                        (error) in
                        if error != nil{
                            onError(error!.localizedDescription)
                        }
                    }

                    onSuccess(user)
                }
            }
        }
    }

    static func savePostPhoto(userId:String, caption: String, postId: String, imageData: Data, metadata: StorageMetadata, storagePostRef: StorageReference, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void ) {
        
            
            storagePostRef.putData(imageData, metadata: metadata){
                
                (StorageMetadata, error) in
                
                if error != nil {
                    onError(error!.localizedDescription)
                    return
                }
                
                storagePostRef.downloadURL{
                    (url, error) in
                    if let metaImageUrl = url?.absoluteString{
                        let firestorePostRef = PostService.PostsUserId(userId: userId).collection("posts").document(postId)

                        let post = PostModel.init(caption: caption, likes: [:], geoLocation: "", ownerId: userId, postId: postId, username: Auth.auth().currentUser!.displayName!, profile: Auth.auth().currentUser!.photoURL!.absoluteString, mediaUrl: metaImageUrl, date: Date().timeIntervalSince1970, likeCount: 0)
                        
                        guard let dict = try? post.asDictionary() else {return}

                        firestorePostRef.setData(dict) {
                            (error) in
                            if error != nil {
                                onError(error!.localizedDescription)
                                return
                            }

                            PostService.timelineUserId(userId: userId).collection("timeline").document(postId).setData(dict)

                            PostService.AllPosts.document(postId).setData(dict)
                            onSuccess()
                        }

                    }
            }




               
        }
    }
}


//class StorageService {
//
//    static var storage = Storage.storage()
//
//    static var storageRoot = storage.reference(forURL: "gs://mediagram-ddd2b.appspot.com")
//
//    static var storageProfile = storageRoot.child("profile")
//
//    static func storageProfile(userId:String) -> StorageReference {
//        return storageProfile.child(userId)
//    }
//
//    static func saveProfileImage(userId:String, username:String, email:String, imageData:Data, metaData:StorageMetadata, storageProfileImageRef: StorageReference, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
//
//        storageProfileImageRef.putData(imageData, metadata: metaData) {
//           (StorageMetadata, error) in
//
//            if error != nil {
//                onError(error!.localizedDescription)
//                return
//            }
//
//            storageProfileImageRef.downloadURL{
//                (url, error) in
//                if let metaImageUrl = url?.absoluteString{
//
//                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
//                        changeRequest.photoURL = url
//                        changeRequest.displayName = username
//                        changeRequest.commitChanges{
//                            (error) in
//                            if error != nil{
//
//                                onError(error!.localizedDescription)
//                                return
//                            }
//                        }
//                    }
//                    let firestoreUserId = AuthService.getUserId(userId: userId)
//                    let user = User.init(uid: userId, email: email, profileImageUrl: metaImageUrl, username: username, searchName: username.splitString(), bio: "")
//
//                    guard let dict = try?user.asDictionary() else {return}
//
//                    firestoreUserId.setData(dict){
//                        (error) in
//                        if error != nil{
//                            onError(error!.localizedDescription)
//                        }
//                    }
//
//                    onSuccess(user)
//                }
//            }
//        }
//    }
//}
//
//
//









//    storagePostRef.downloadURL{
//        (url, error) in
//        if let metaImageUrl = url?.absoluteString{
//
//            let firestorePostRef = PostService.PostsUserId(userId: userId).collection("posts").document(postId)
//
//            let post = PostModel.init(caption: caption, likes: [:], geoLocation: "", ownerId: userId, postId: postId, username: Auth.auth().currentUser!.displayName!, profile: Auth.auth().currentUser!.photoURL!.absoluteString, mediaUrl: metaImageUrl, date: Date().timeIntervalSince1970, likeCount: 0)
//
//            guard let dict = try? post.asDictionary() else {return}
//
//            firestorePostRef.setData(dict) {
//                (error) in
//                if error != nil {
//                    onError(error!.localizedDescription)
//                    return
//                }
//
//                PostService.timelineUserId(userId: userId).collection("timeline").document(postId).setData(dict)
//
//                PostService.AllPosts.document(postId).setData(dict)
//                onSuccess()
//            }
//
//
//        }
//}
