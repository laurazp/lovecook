
import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logInButton: CustomButton!
    @IBOutlet weak var signUpButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    private func setUpView() {
        
        //Background image
        backgroundImageView.alpha = 0.8
        //Sign Up button
        signUpButton.setUpWhiteButtonWithBorder()
        
        //logInButton.setButtonFont(button: logInButton, title: "Log In")
        //signUpButton.setButtonFont(button: signUpButton, title: "Sign Up")
    }
}

/*
 Photo by <a href="https://unsplash.com/@miracletwentyone?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Joseph Gonzalez</a> on <a href="https://unsplash.com/photos/fdlZBWIP0aM?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
   
 */
