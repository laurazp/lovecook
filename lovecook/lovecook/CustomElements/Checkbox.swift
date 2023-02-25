
import UIKit

class Checkbox: UIButton {
    
    let checkedImage = UIImage(systemName: "checkmark.square")
    let uncheckedImage = UIImage(systemName: "square")
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
        self.tintColor = UIColor.systemGray4
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
