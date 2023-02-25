
import UIKit
import GoogleSignIn

class LogInViewController: UIViewController {

    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signIn(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }

            // TODO: If sign in succeeded, display the app's main content View.
          }
    }
}

/*
 
 //TODO: Add a sign-out button to your app, visible to signed-in users
 //and connect the button to a method in your ViewController that calls signOut:. For example, use an IBAction:
 
 @IBAction func signOut(sender: Any) {
   GIDSignIn.sharedInstance.signOut()
 }
 
 */
