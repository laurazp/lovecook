
import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSetUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        defaultSetUp()
    }
    
    

    func defaultSetUp() {
        layer.backgroundColor = UIColor.systemGreen.cgColor
        layer.cornerRadius = layer.frame.height/2
        layer.masksToBounds = true
        tintColor = .white
    }
    
    func setUpWhiteButton() {
        layer.backgroundColor = UIColor.systemBackground.cgColor
        layer.cornerRadius = layer.frame.height/2
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGreen.cgColor
        layer.masksToBounds = true
        tintColor = .black
    }
}
