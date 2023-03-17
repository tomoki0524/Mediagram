//
//  UserUserProfile.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2022/09/06.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserUserProfile: View {

    @State private var value: String = ""
    @State var users: [User] = []
    @State var isLoading = false

    func searchUsers(){
        isLoading = true

        SearchSearchService.searchUser(input: value) {
            (users) in

            self.isLoading = false
            self.users = users
        }

    }

    var body: some View {
        ScrollView{
            VStack(alignment: .leading){

                SearchBar(value: $value).padding()
                    .onChange(of: value, perform: {
                        new in

                        searchUsers()
                    })
                
                if !isLoading {
                    ForEach(users, id:\.uid) {

                        user in

                        NavigationLink(destination: UserProfileView(user: user)) {

                        HStack{
                            WebImage(url: URL(string: user.profileImageUrl)!)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60, alignment: .trailing)
                                .padding()

                            Text(user.username).font(.subheadline).bold()

                           // Divider().background(Color.black)
                        }
                        
                    }
                    }
                }

            }
        }.navigationTitle("User Search")
    }
}


