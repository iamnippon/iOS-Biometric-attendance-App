//
//  SignInViewController.swift
//  Bimatric Attendance
//
//  Created by mindbend91@gmail.com on 28/5/24.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButtonTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z]{2,64}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }

    @IBAction func signInButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, isValidEmail(email),
              let password = passwordTextField.text else {
            showError("Invalid email or password")
            return
        }

        let savedPassword = UserDefaults.standard.string(forKey: "userPassword")
        if password == savedPassword {
            // Navigate to home screen
            navigateToHomeScreen()
        } else {
            showError("Incorrect email or password")
        }
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func navigateToHomeScreen() {
        // Assuming you have a segue set up to navigate to the home screen
        performSegue(withIdentifier: "showHomeScreen", sender: self)
    }
}

