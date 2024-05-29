//
//  LocationManager.swift
//  Bimatric Attendance
//
import CoreLocation
import UIKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            // Print the current location for debugging
            print("Current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            validateLocation(location)
        }
    }

    func validateLocation(_ location: CLLocation) {
        // Implement logic to compare current location with office location
        let officeLatitude = 37.7749 // Replace with actual office latitude
        let officeLongitude = -122.4194 // Replace with actual office longitude
        let officeLocation = CLLocation(latitude: officeLatitude, longitude: officeLongitude)
        let distance = location.distance(from: officeLocation)

        if distance < 100 { // e.g., within 100 meters
            print("User is at the office")
        } else {
            print("User is not at the office")
        }
    }
}

//  Author: Nippon Chowdhury 28/5/24.
//  Author GitHub: [https://github.com/iamnippon]
//  Repo: git Clone https://github.com/iamnippon/iOS-Biometric-attendance-App.git


