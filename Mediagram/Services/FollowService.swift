//
//  Followservice.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/10/10.
//

import Foundation
import Firebase


class FollowService: ObservableObject {

    func updateFollowCount(userId: String, followingCount: @escaping (_ followingCount: Int)-> Void, followersCount: @escaping (_ followersCount: Int)-> Void) {

        ProfileService.followingCollection(userid: userId).getDocuments{
            (snap, error) in

            if let doc = snap?.documents {
                followingCount(doc.count)

            }
        }

        ProfileService.followersCollection(userid: userId).getDocuments{
            (snap, error) in

            if let doc = snap?.documents {
                followersCount(doc.count)

            }
        }

    }


    func manageFollow(userId: String, followCheck: Bool, followingCount: @escaping (_ followingCount: Int)-> Void, followersCount: @escaping (_ followersCount: Int)-> Void) {

        if !followCheck {
            follow(userId: userId, followingCount: followingCount, followersCount: followersCount)

        } else {
            unfollow(userId: userId, followingCount: followingCount, followersCount: followersCount)
        }
    }

    func follow(userId: String, followingCount: @escaping (_ followingCount: Int)-> Void, followersCount: @escaping (_ followersCount: Int)-> Void) {


        ProfileService.followingId(userId: userId).setData([:]){
            (err) in

            if err == nil {
                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)

            }

        }

        ProfileService.followersId(userId: userId).setData([:]){
            (err) in

            if err == nil {
                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)

            }

        }
    }

    func unfollow(userId: String, followingCount: @escaping (_ followingCount: Int)-> Void, followersCount: @escaping (_ followersCount: Int)-> Void) {

        ProfileService.followingId(userId: userId).getDocument {

            (document, err) in

            if let doc = document, doc.exists {
                doc.reference.delete()

                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
            }
        }

        ProfileService.followersId(userId: userId).getDocument {

            (document, err) in

            if let doc = document, doc.exists {
                doc.reference.delete()

                self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
            }
        }
    }
}
