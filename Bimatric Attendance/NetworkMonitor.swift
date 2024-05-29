//
//  NetworkMonitor.swift
//  Bimatric Attendance
//
//

import Network
import UIKit

class NetworkMonitor {

    let monitor = NWPathMonitor()
    let queue = DispatchQueue.global(qos: .background)

    init() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Connected")
            } else {
                DispatchQueue.main.async {
                    // Handle no internet connection
                }
            }
        }
    }

    deinit {
        monitor.cancel()
    }
}

//  Author: Nippon Chowdhury 28/5/24.
//  Author GitHub: [https://github.com/iamnippon]
//  Repo: git Clone https://github.com/iamnippon/iOS-Biometric-attendance-App.git

