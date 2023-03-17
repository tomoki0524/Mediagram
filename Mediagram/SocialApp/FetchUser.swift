//
//  FetchUser.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/03.
//

//import SwiftUI
//import Firebase
//
//let ref = Firestore.firestore()
//
//func fetchUser(uid: String,completion: @escaping (UserModel) -> ()){
//
//    ref.collection("User").document().getDocument { (doc, err) in
//        guard let user = doc else{return}
//
//        let username = user.data()?["username"] as! String
//        let pic = user.data()?["imageurl"] as! String
//        let bio = user.data()?["bio"] as! String
//  //      let uid = user.documentID
//    //    let uid = user.data()?["uid"] as! String
//
//        DispatchQueue.main.async {
//            completion(UserModel(username: username, pic: pic, bio: bio))
//        }
//    }
//}
