//
//  RealmService.swift
//  
//
//  Created by Ruttab Haroon on 23/06/2022.
//

import Foundation
import RealmSwift
import UIKit

class RealmService {
    
    private init() {}
    static let shared = RealmService()
    
    var realm = try! Realm()
    
    func create<T:Object>(_ object: T) {
        do {
            try realm.write{
                realm.add(object)
            }
            
        } catch {
            post(error)
        }
    }
    
    func update<T:Object>(_ object: T, dictionary: [String:Any]) {
        do {
            try realm.write{
                for (k,v) in dictionary {
                    object.setValue(v, forKey: k)
                }
            }
            
        } catch {
            post(error)
        }
    }
    
    func delete<T:Object>(_ object: T) {
        do {
            try realm.write{
                realm.delete(object)
            }
        } catch {
            post(error)
        }
    }
    

    
    func post(_ error: Error) {
        NotificationCenter.default.post(name: NSNotification.Name.realmErrorNotif, object: error)
    }
    
    func observeRealmErrors(in vc: UIViewController, completion: @escaping (Error?)->Void) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.realmErrorNotif,
                                               object: nil,
                                               queue: nil) { notif in
            completion(notif.object as? Error)
        }
    }
    
    func stopObservingErrors(in vc: UIViewController) {
        NotificationCenter.default.removeObserver(vc,
                                                  name: NSNotification.Name("RealmError"),
                                                  object: nil)
    }
    
    func getRealmFileURL() -> URL? {
        return self.realm.configuration.fileURL
    }
    
}


extension NSNotification.Name {
    static let realmErrorNotif = NSNotification.Name(rawValue: "RealmError")
}
