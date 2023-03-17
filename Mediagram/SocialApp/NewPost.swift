//
//  NewPost.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/03.
//

//import SwiftUI
//
//struct NewPost: View {
//  //  @StateObject var newPostData = NewPostModel()
//   // @Environment(\.presentationMode) var present
//    var body: some View {
//
//        VStack{
//
//            HStack(spacing: 15){
//
//           //     Button(action: {present.wrappedValue.dismiss()}) {
//
//                Button(action: {}) {
//
//                    Text("Cancel")
//                        .fontWeight(.bold)
//                        .foregroundColor(Color("bule"))
//                }
//
//                Spacer(minLength: 0)
//
//             //   Button(action: {newPostData.post}) {
//
//                    Button(action: {}) {
//
//                    Image(systemName: "photo.fill")
//                        .font(.title)
//                        .foregroundColor(Color("blue"))
//                }
//
//             //   Button(action: {newPostData.post(present: present)}) {
//
//                    Button(action: {}) {
//
//                    Text("Post")
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                        .padding(.vertical,10)
//                        .padding(.horizontal,25)
//                        .background(Color("blue"))
//                        .clipShape(Capsule())
//                }
//            }
//            .padding()
//        //    .opacity(newPostData.isPosting ? 0.5 : 1)
//        //    .disabled(newPostData.isPosting ? true : false)
//
////            TextEditor(text: $newPostData.postTxt)
////                .cornerRadius(15)
////                .padding()
////                .opacity(newPostData.isPosting ? 0.5 : 1)
////                .disabled(newPostData.isPosting ? true : false)
////
//            // Displaying Image if its selected.....
//
////            if newPostData.img_Data.count != 0{
////
////                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
////
////                    Image(uiImage: UIImage(data: newPostData.img_Data)!)
////                        .resizable()
////                        .aspectRatio(contentMode: .fill)
////                        .frame(width: UIScreen.main.bounds.width / 2, height: 150)
////                        .cornerRadius(15)
////
////                    // Cancel Button...
////
////                    Button(action: {newPostData.img_Data = Data(count: 0)}) {
////
////                        Image(systemName: "xmark")
////                            .foregroundColor(.white)
////                            .padding(10)
////                            .background(Color("blue"))
////                            .clipShape(Circle())
////                    }
////                }
////                .padding()
////                .opacity(newPostData.isPosting ? 0.5 : 1)
////                .disabled(newPostData.isPosting ? true : false)
////            }
//        }
//        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
//        //.sheet(isPresented: $newPostData.picker) {
//
//           // ImagePicker(picker: $newPostData.picker, img_Data: $newPostData.img_Data)
//       // }
//    }
//}
//

//import SwiftUI
//
//struct NewPost: View {
//    @State private var postImage: Image?
//    @State private var pickedImage: Image?
//    @State private var showingActionSheet = false
//    @State private var showingImagePicker = false
//    @State private var imageData: Data = Data()
//    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
//    @State private var error:String = ""
//    @State private var showingAlert = false
//
//
// //   @StateObject var newPostData = NewPostModel()
//
//    func loadImage() {
//        guard let inputimage = pickedImage else {return}
//
//        postImage = inputimage
//    }
//
//    var body: some View {
//
//        VStack{
//
//            HStack(spacing: 15){
//
//                Button(action: {}) {
//
//                    Text("Cancel")
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                }
//
//                Spacer(minLength: 0)
//
//                Button(action: {}) {
//
//                    Image(systemName: "photo.fill")
//                        .font(.title)
//                        .foregroundColor(.black)
//                        .onTapGesture {
//                            self.showingActionSheet = true
//                        }
//                }
//
//                Button(action: {}) {
//
//                    Text("Post")
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                        .padding(.vertical,10)
//                        .padding(.horizontal,25)
//                        .background(Color("blue"))
//                        .clipShape(Capsule())
//                }
//            }
//            .padding()
////
////            TextEditor(text: )
////                .cornerRadius(15)
////                .padding()
//
//            // 選択された場合は画像を表示
//            if imageData.count != 0{
//
//                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
//
//                    Image(uiImage: UIImage(data: imageData)!)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: UIScreen.main.bounds.width / 2, height: 150)
//                        .cornerRadius(15)
//
//                    // キャンセルするボタン
//
//                    Button(action: {imageData = Data(count: 0)}) {
//
//                        Image(systemName: "xmark")
//                            .foregroundColor(.white)
//                            .padding(10)
//                            .background(Color("blue"))
//                            .clipShape(Circle())
//                    }
//                }
//                .padding()
//            }
//        }
//        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
//
//            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
//        }.actionSheet(isPresented: $showingActionSheet) {
//            ActionSheet(title: Text(""), buttons: [.default(Text("Choose A Photo")){
//                self.sourceType = .photoLibrary
//                self.showingImagePicker = true
//            },
//            .default(Text("Take A Photo")){
//                self.sourceType = .camera
//                self.showingImagePicker = true
//
//            }, .cancel()
//            ])
//        }
//        .background(Color("blue").ignoresSafeArea(.all, edges: .all))
//    }
//}
//
//
//
//
//
//var body: some View {
//
//    VStack{
//
//        HStack(spacing: 15){
//
//            Spacer(minLength: 0)
//
//            Button(action: {}) {
//
//                Image(systemName: "photo.fill")
//                    .font(.title)
//                    .foregroundColor(.black)
//                    .onTapGesture {
//                        self.showingActionSheet = true
//                    }
//            }
//
//            Button(action: uploadPost) {
//
//                Text("Post")
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//                    .padding(.vertical,10)
//                    .padding(.horizontal,25)
//                    .clipShape(Capsule())
//            }
//
//
//
//
//        }
//
//        .padding()
//
//        TextEditor(text: $text)
//            .cornerRadius(15)
//            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.black))
//            .padding
//
//        // 選択された場合は画像を表示
//        if imageData.count != 0{
//
//            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
//
//                Image(uiImage: UIImage(data: imageData)!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: UIScreen.main.bounds.width / 2, height: 150)
//                    .cornerRadius(15)
//
//                // キャンセルするボタン
//
//                Button(action: {imageData = Data(count: 0)}) {
//
//                    Image(systemName: "xmark")
//                        .foregroundColor(.white)
//                        .padding(10)
//                        .background(Color("blue"))
//                        .clipShape(Circle())
//                }
//            }
//            .padding()
//        }
//    }
//    .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
//
//        ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
//    }.actionSheet(isPresented: $showingActionSheet) {
//        ActionSheet(title: Text(""), buttons: [.default(Text("Choose A Photo")){
//            self.sourceType = .photoLibrary
//            self.showingImagePicker = true
//        },
//                                               .default(Text("Take A Photo")){
//            self.sourceType = .camera
//            self.showingImagePicker = true
//        }, .cancel()
//        ])
//    }
//}
