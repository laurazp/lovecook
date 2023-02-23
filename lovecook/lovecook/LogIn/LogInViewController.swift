
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    private func setUpView() {
        //Background image
        backgroundImageView.alpha = 0.7
        //Log In button
        logInButton.backgroundColor = .systemGreen
        logInButton.layer.cornerRadius = logInButton.layer.frame.height/2
        logInButton.tintColor = .white
        //Sign In button
        signInButton.backgroundColor = .systemBackground
        signInButton.layer.cornerRadius = logInButton.layer.frame.height/2
        signInButton.layer.borderWidth = 2
        signInButton.layer.borderColor = UIColor.systemGreen.cgColor
        signInButton.tintColor = .black
    }
}

/*
 Photo by <a href="https://unsplash.com/@miracletwentyone?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Joseph Gonzalez</a> on <a href="https://unsplash.com/photos/fdlZBWIP0aM?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
   
 */
