
import Foundation
import CoreData
import UIKit

class CoreDataUserRepository {
    
    typealias T =  User
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func get(id: Int, completionHandler: /*@escaping*/ (User?, Error?) -> Void) {
        //TODO: implement
    }
    
    func list(completionHandler: ([User]?, Error?) -> Void) {
        //TODO: implement
    }
    
    func add(_ item: User) {
        //TODO: implement
    }
    
    func delete(_ item: User, completionHandler: (Error?) -> Void) {
        //TODO: implement
    }
    
    func edit(_ item: User, newUsername: String, completionHandler: (Error?) -> Void) {
        item.username = newUsername
        do {
            try context.save()
        } catch {
            //TODO: handle error
        }
    }
}
