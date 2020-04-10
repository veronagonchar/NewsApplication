//
//  DataBaseRealm.swift
//  NewsApp
//
//  Created by Вероника on 4/7/20.
//  Copyright © 2020 Veronika Gonchar. All rights reserved.
//

import Foundation
import RealmSwift

class DBService: NSObject {
    
    internal var realm: Realm? {
        guard let realm = try? Realm() else {
            return nil
        }
        
        return realm
    }
    
    static private var sharedDBService: DBService = {
        let dbService = DBService()
        return dbService
    }()
    
    static var shared: DBService {
        return sharedDBService
    }
    
    static func write(data: () -> Void) {
        try? DBService.shared.realm?.write {
            data()
        }
    }
}

extension DBService {
    func setObjectToDB(object: Object) {
        do {
            try realm?.write {
                realm?.add(object, update: .all)
                print(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setObjectsToDB(objects: [Object]) {
        do {
            try realm?.write {
                realm?.add(objects, update: .all)
                print(objects)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getObject<T: Object>(ofType: T.Type, forPrimaryKey: String) -> T? {
        return realm?.object(ofType: ofType, forPrimaryKey: forPrimaryKey)
    }
    
    func getObjects<T: Object>(_ type: T.Type) -> Results<T>? {
        return realm?.objects(type).sorted(byKeyPath: "title")
    }
    
}

