
import Foundation

protocol Repository {
    
    associatedtype T
    
    func get(id: Int, completionHandler: (T?, Error?) -> Void)
    func list(completionHandler: @escaping ([T]?) -> ())
    func add(_ item: T)
    func delete(_ item: T, completionHandler: (Error?) -> Void)
//    func edit(_ item: T, name: String, completionHandler: (Error?) -> Void)
 }
