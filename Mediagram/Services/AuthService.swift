//
//  AuthService.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/09/30.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

//class AuthService {
//
//    static var storeRoot = Firestore.firestore()
//
//    static func getUserId(userId: String) -> DocumentReference {
//        return storeRoot.collection("users").document(userId)
//    }
//
//    static func signUp(username:String, email: String, password:String, imageData: Data, onSucces: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
//        Auth.auth().createUser(withEmail: email, password: password) {
//            (authData, error) in
//
//            if error != nil {
//                onError(error!.localizedDescription)
//                return
//            }
//
//            guard let userId = authData?.user.uid else {return}
//
//            let storageProfileUserId = StorageService.storageProfile(userId: userId)
//
//            let metadata = StorageMetadata()
//            metadata.contentType = "image/jpg"
//
////            StorageService.saveProfileImage(userId: userId, username: username, email: email, imageData: imageData, metaData: metadata, storageProfileImageRef: storageProfileUserId, onSuccess: onSucces, onError: onError)
//        }
//    }
//
//        static func signIn(email:String, password:String, onSucces: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
//
//            Auth.auth().signIn(withEmail: email, password: password) {
//                (authData, error) in
//
//                if error != nil {
//                    onError(error!.localizedDescription)
//                    return
//
//                }
//                                guard let userId = authData?.user.uid else {return}
//
//                                let firestoreUserId = getUserId(userId: userId)
//
//                                firestoreUserId.getDocument{
//                                    (document, error) in
//                                    if let dict = document?.data() {
//                                        guard let decodedUser = try? User.init(fromDictionary: dict) else {return}
//
//                                        onSucces(decodedUser)
//                                    }
//
//                                }
//
//                            }
//                        }
//                    }
//
//
////    static func signIn(email:String, password:String, onSucces: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
////
////        Auth.auth().signIn(withEmail: email, password: password) {
////            (authData, error) in
////
////            if error != nil {
////                onError(error!.localizedDescription)
////                return
////            }
////
////            guard let userId = authData?.user.uid else {return}
////
////            let firestoreUserId = getUserId(userId: userId)
////
////            firestoreUserId.getDocument{
////                (document, error) in
////                if let dict = document?.data() {
////                    guard let decodedUser = try? User.init(fromDictionary: dict) else {return}
////
////                    onSucces(decodedUser)
////                }
////
////            }
////
////        }
////    }
////}


import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class AuthService {

    static var storeRoot = Firestore.firestore()

    static func getUserId(userId: String) -> DocumentReference {
        return storeRoot.collection("users").document(userId)
    }
    
//    static func getUserssId(userId: String) -> DocumentReference {
//        return storeRoot.collection("following").document(userId)
//    }

    static func signUp(username:String, email: String, password:String, imageData: Data, onSucces: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {
            (authData, error) in

            if error != nil {
                onError(error!.localizedDescription)
                return
            }

            guard let userId = authData?.user.uid else {return}

            let storageProfileUserId = StorageService.storageProfile(userId: userId)

            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"

            StorageService.saveProfileImage(userId: userId, username: username, email: email, imageData: imageData, metaData: metadata, storageProfileImageRef: storageProfileUserId, onSuccess: onSucces, onError: onError)
        }
    }

    static func signIn(email:String, password:String, onSucces: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {

        Auth.auth().signIn(withEmail: email, password: password) {
            (authData, error) in

            if error != nil {
                onError(error!.localizedDescription)
                return
            }

            guard let userId = authData?.user.uid else {return}

            let firestoreUserId = getUserId(userId: userId)

            firestoreUserId.getDocument{
                (document, error) in
                if let dict = document?.data() {
                    guard let decodedUser = try? User.init(fromDictionary: dict) else {return}

                    onSucces(decodedUser)
                }

            }

        }
    }
}
