//
//  DataFetcher.swift
//  Bimatric Attendance
//
import UIKit

class DataFetcher {

    func fetchData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.showError("Failed to fetch data: \(error.localizedDescription)")
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.showError("No data fetched from the server")
                }
                return
            }
            
            // Process the fetched data
            self.processFetchedData(data)
        }
        
        task.resume()
    }

    func processFetchedData(_ data: Data) {
        // Implement your data processing logic here
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // Find the topmost view controller to present the alert
        if let topController = UIApplication.shared.keyWindow?.rootViewController {
            topController.present(alert, animated: true, completion: nil)
        }
    }
}
