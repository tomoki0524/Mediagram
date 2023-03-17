//
//  Following Header.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/11/07.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import SDWebImageSwiftUI


struct Following_Header: View {

    @ObservedObject var observedData = getData()

    var body: some View {

        NavigationView{

            ZStack{

                List(observedData.datas){i in

                    Text("Following List\(i.username)")

                }
            }
        }
    }
}


struct datatype : Identifiable {
    var id: String



    var username : String
}

class getData : ObservableObject{

    @Published var datas = [datatype]()

    init() {

        let db = Firestore.firestore()

        db.collection("following").addSnapshotListener { (snap, err) in

            if err != nil{

                print((err?.localizedDescription)!)
                return
            }

            for i in snap!.documentChanges{

                if i.type == .added{

                    let id = i.document.documentID
                    let username = i.document.documentID

                    DispatchQueue.main.async {

                        self.datas.append(datatype(id: id, username: username))
                    }
                }
            }
        }
    }
}

struct Following_Header_Previews: PreviewProvider {
    static var previews: some View {
        Following_Header()
    }
}
