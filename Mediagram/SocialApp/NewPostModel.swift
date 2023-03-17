//
//  NewPostModel.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/03.
//

//import SwiftUI
//import Firebase
//
//struct NewPostModel: ObservableObject{
//
//    @Published var postTxt = ""
//    // Image Picker...
//    @Published var picker = false
//    @Published var img_Data = Data(count: 0)
//
//    // disabling all controls while posting...
//    @Published var isPosting = false
//
//    let uid = Auth.auth().currentUser!.uid
//
//    func post(present : Binding<PresentationMode>){
//
//        // posting Data....
//
//        isPosting = true
//
//        if img_Data.count == 0{
//
//            ref.collection("Post").document().setData([
//
//                "title": self.postTxt,
//                "url": "",
//                "ref": ref.collection("User").document(self.uid),
//                "time": Date()
//
//            ]) { (err) in
//
//                if err != nil{
//                    self.isPosting = false
//                    return
//                }
//
//                self.isPosting = false
//                // closing View When Succesfully Posted....
//                present.wrappedValue.dismiss()
//            }
//        }
//        else{
//
//            UploadImage(imageData: img_Data, path: "post_Pics") { (url) in
//
//                ref.collection("Post").document().setData([
//
//                    "title": self.postTxt,
//                    "url": url,
//                    "ref": ref.collection("User").document(self.uid),
//                    "time": Date()
//
//                ]) { (err) in
//
//                    if err != nil{
//                        self.isPosting = false
//                        return
//                    }
//
//                    self.isPosting = false
//                    // closing View When Succesfully Posted....
//                    present.wrappedValue.dismiss()
//                }
//            }
//        }
//    }
//}


//import SwiftUI
//import Firebase
//
//class NewPostModel : ObservableObject{
//
//    @Published var postTxt = ""
//    // Image Picker...
//    @Published var picker = false
//    @Published var img_Data = Data(count: 0)
//
//    // disabling all controls while posting....
//    @Published var isPosting = false
//
////    let uid = Auth.auth().currentUser!.uid
//
//    func post(present : Binding<PresentationMode>){
//
//        isPosting = true
//
//        if img_Data.count == 0{
//
//            ref.collection("Posts").document().setData([
//
//                "title": self.postTxt,
//                "pic": "",
//                "ref": ref.collection("User").document(self.uid),
//                "time": Date()
//
//
//            ]) { (err) in
//
//                if err != nil{
//                    self.isPosting = false
//                    return
//                }
//
//                self.isPosting = false
//
//                present.wrappedValue.dismiss()
//            }
//        }
//        else{
//
//            UploadImage(imageData: img_Data, path: "post_Pics") { (url) in
//
//                ref.collection("Posts").document().setData([
//
//                    "title": self.postTxt,
//                    "pic": url,
//                    "ref": ref.collection("User").document(self.uid),
//                    "time": Date()
//
//
//                ]) { (err) in
//
//                    if err != nil{
//                        self.isPosting = false
//                        return
//                    }
//
//                    self.isPosting = false
//
//                    present.wrappedValue.dismiss()
//                }
//
//            }
//        }
//    }
//
//  //  func post(present : Environment<PresentationMode>){
//
//        // Posting Data...
//     //   isPosting = true
//
////        ref.collection("Post").doument().setdata([
////
////        ]) { (err) in
//
////            if err != nil{
////        self.isPosting = false
////                return
////            }
//
////       self.isPosting = false
////        }
//  //  }
//}
