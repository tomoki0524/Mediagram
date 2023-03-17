//
//  PostModel.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/07.
//

import Foundation

struct PostModel: Encodable, Decodable {

    var caption: String
    var likes: [String: Bool]
   // var fights: [String: Bool]
    var geoLocation: String
    var ownerId: String
    var postId: String
    var username: String
    var profile: String
    var mediaUrl: String
    var date: Double
    var likeCount: Int
 //   var fightCount: Int


}
