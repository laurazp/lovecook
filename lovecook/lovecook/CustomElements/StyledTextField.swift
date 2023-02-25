
import UIKit

class StyledTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSetUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        defaultSetUp()
    }
    
    func defaultSetUp() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray3.cgColor
        layer.cornerRadius = 5
    }

}
