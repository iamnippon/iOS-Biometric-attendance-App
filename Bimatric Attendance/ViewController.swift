//
//  ViewController.swift
//  Bimatric Attendance
//
//  Author: Nippon Chowdhury 28/5/24.
//  Author GitHub: [https://github.com/iamnippon]
//  Repo: git Clone https://github.com/iamnippon/iOS-Biometric-attendance-App.git


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextFild: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z]{2,64}$"
        return NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }

    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, isValidEmail(email) else {
            showError("Invalid email address")
            return
        }
        // Proceed with signup
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}

