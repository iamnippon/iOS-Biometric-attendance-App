//
//  PasswordSetupViewController.swift
//  Bimatric Attendance
//
//  Created by mindbend91@gmail.com on 28/5/24.
//

import UIKit

class PasswordSetupViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setPasswordButtonTapped(_ sender: UIButton) {
        guard let password = passwordTextField.text, !password.isEmpty else {
            showError("Password cannot be empty")
            return
        }
        UserDefaults.standard.set(password, forKey: "userPassword")
        // Navigate to login screen or perform other actions
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
