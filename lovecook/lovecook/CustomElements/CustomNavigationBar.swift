
import Foundation
import UIKit

extension UINavigationItem {
    
    func configureNavigationItem(navigationItem: UINavigationItem) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = UIColor.customLightGreen()
    }
}
