
import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultButtonSetUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        defaultButtonSetUp()
    }
    
    func defaultButtonSetUp() {
        layer.backgroundColor = UIColor(red:0.67, green:0.76, blue:0.65, alpha:1.0).cgColor
        layer.cornerRadius = layer.frame.height/2
        layer.masksToBounds = true
        tintColor = .white
    }
    
    func setUpWhiteButtonWithBorder() {
        layer.backgroundColor = UIColor.systemBackground.cgColor
        layer.cornerRadius = layer.frame.height/2
        layer.borderWidth = 2
        layer.borderColor = UIColor(red:0.67, green:0.76, blue:0.65, alpha:1.0).cgColor
        layer.masksToBounds = true
        tintColor = UIColor(red:0.67, green:0.76, blue:0.65, alpha:1.0)
    }
    
    //TODO: Change button title font ?
    func setButtonFont(button: UIButton, title: String) {
        let normalAttributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)])
        button.setAttributedTitle(normalAttributedTitle, for: .normal)
    }
}
