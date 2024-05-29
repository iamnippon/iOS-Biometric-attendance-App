//
//  HomeViewController.swift
//  Bimatric Attendance
//


import LocalAuthentication
import CoreLocation
import UIKit

class HomeViewController: UIViewController {
    var locationManager: LocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = LocationManager()
    }

    @IBAction func checkInButtonTapped(_ sender: UIButton) {
        authenticateUser(for: "check-in")
    }

    @IBAction func checkOutButtonTapped(_ sender: UIButton) {
        authenticateUser(for: "check-out")
    }

    func authenticateUser(for action: String) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate to \(action)") { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.proceedWithAction(action)
                    } else {
                        self.showError("Authentication failed")
                    }
                }
            }
        } else {
            showError("Biometric authentication not available")
        }
    }

    func proceedWithAction(_ action: String) {
        guard let currentLocation = locationManager?.locationManager.location else {
            showError("Unable to get current location")
            return
        }

        // Replace these coordinates with the actual office location coordinates
        let officeLatitude: CLLocationDegrees = 37.7749 // Example latitude
        let officeLongitude: CLLocationDegrees = -122.4194 // Example longitude
        let officeLocation = CLLocation(latitude: officeLatitude, longitude: officeLongitude)
        let distance = currentLocation.distance(from: officeLocation)

        if distance < 100 { // e.g., within 100 meters
            let successMessage = action == "check-in" ? "Check-In successful" : "Check-Out successful"
            showSuccess(successMessage)
        } else {
            showError("You are not at the office location")
        }
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func showSuccess(_ message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

//  Author: Nippon Chowdhury 28/5/24.
//  Author GitHub: [https://github.com/iamnippon]
//  Repo: git Clone https://github.com/iamnippon/iOS-Biometric-attendance-App.git


