//
//  CommentModel.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/10.
//

import Foundation


struct CommentModel: Encodable, Decodable, Identifiable{


    var id = UUID()
    var profile: String
    var postId: String
    var username: String
    var date: Double
    var comment: String
    var ownerId: String
}
