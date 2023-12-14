//
//  DataService.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 14.12.2023.
//

import CoreData
import Foundation

final class DataService {
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "CoreDataModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                print(error)
            }
        }
        return persistentContainer
    }()

    func save() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                print(error)
            }
        }
    }

    func addFriends(friends: [Friend]) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ModelFriendCD")
        for friend in friends {
            fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: [friend.id])
            let result = try? persistentContainer.viewContext.fetch(fetchRequest)
            guard result?.first == nil else {
                continue
            }
            let modelFriend = ModelFriendCD(context: persistentContainer.viewContext)
            modelFriend.id = Int64(friend.id)
            modelFriend.firstName = friend.firstName
            modelFriend.lastName = friend.lastName
            modelFriend.online = Int64(friend.online)
            modelFriend.photo = friend.photo
        }
        save()
        
    }
    
    func fetchFriends()-> [Friend]{
        let fetchRequest: NSFetchRequest<ModelFriendCD> = ModelFriendCD.fetchRequest()
        guard (try? persistentContainer.viewContext.fetch(fetchRequest)) != nil else {
            return []
        }
        var newFriends: [Friend] = []
        for friend in newFriends {
            newFriends.append(Friend(id: Int(friend.id), firstName: friend.firstName, lastName: friend.lastName, photo: friend.photo, online: Int(friend.online)))
        }
        return newFriends
    }
    
    func addGroup(groups: [Group]) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ModelGroupCD")
        for group in groups {
            fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: [group.id])
            
            let result = try? persistentContainer.viewContext.fetch(fetchRequest)
            guard result?.first == nil else {
                continue
            }
            
            let modelGroup = ModelGroupCD(context: persistentContainer.viewContext)
            modelGroup.id = Int64(group.id)
            modelGroup.name = group.name
            modelGroup.descript = group.description
            modelGroup.photo = group.photo
        }
        save()
    }
    func fetchGroups() -> [Group] {
        let fetchRequest: NSFetchRequest<ModelGroupCD> = ModelGroupCD.fetchRequest()
        guard (try? persistentContainer.viewContext.fetch(fetchRequest)) != nil else {
            return []
        }
        var newGroups: [Group] = []
        for group in newGroups {
            newGroups.append(Group(id: Int(group.id), name: group.name, description: group.description, photo: group.photo))
        }
        return newGroups
    }
    
    func addFriendData(){
        
    }
}

