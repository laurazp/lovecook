
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
        layer.backgroundColor = UIColor.customLightGreen().cgColor
        layer.cornerRadius = layer.frame.height/2
        layer.masksToBounds = true
        tintColor = .white
    }
    
    func setUpWhiteButtonWithBorder() {
        layer.backgroundColor = UIColor.systemBackground.cgColor
        layer.cornerRadius = layer.frame.height/2
        layer.borderWidth = 2
        layer.borderColor = UIColor.customLightGreen().cgColor
        layer.masksToBounds = true
        tintColor = UIColor.customLightGreen()
    }
    
    //TODO: Change button title font ?
    func setButtonFont(button: UIButton, title: String) {
        let normalAttributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)])
        button.setAttributedTitle(normalAttributedTitle, for: .normal)
    }
}
