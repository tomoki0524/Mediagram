//
//  UploadImage.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/03.
//
//
//import SwiftUI
//import Firebase
//import FirebaseFirestore
//import FirebaseStorage
//
//
//func UploadImage(imageData: Data,path: String,completion: @escaping (String) -> ()) {
//
//    let storage = Storage.storage().reference()
//  //  let uid = Auth.auth().currentUser!.uid
//
//
////    storage.child(path).child(uid).putData(imageData, metadata: nil) { (_, err) in
//    storage.child(path).putData(imageData, metadata: nil) { (_, err) in
//
//        if err != nil{
//            completion("")
//            return
//
//        }
//
////        storage.child(path).child(uid).downloadURL { (url, err) in
////            if err != nil{
////                completion("")
////                return
////
////            }
//
//        storage.child(path).downloadURL { (url, err) in
//            if err != nil{
//                completion("")
//                return
//
//            }
//
//            completion("\(url!)")
//        }
//    }
//
//}
