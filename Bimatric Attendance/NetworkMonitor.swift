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
