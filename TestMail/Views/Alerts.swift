//
//  Alerts.swift
//  TestMail
//
//  Created by Павел Кулицкий on 29.08.22.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showSimpleAlert(vc: UIViewController, title: String, message: String) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        DispatchQueue.main.async {
            vc.present(alertController, animated: true)
        }
    }
    
    private static func showChangeAlert(vc: UIViewController,
                                         title: String,
                                         message: String,
                                         complition: @escaping() -> Void) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "Change", style: .default)  { _ in
            complition()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(ok)
        alertController.addAction(cancel)
        DispatchQueue.main.async {
            vc.present(alertController, animated: true)
        }
    }
    
    static func showResultAlert(vc: UIViewController, message: String) {
        showSimpleAlert(vc: vc, title: "Result", message: message)
    }
    
    static func showErrorAlert(vc: UIViewController, message: String, complition: @escaping() -> Void) {
        showChangeAlert(vc: vc, title: "Error", message: message, complition: complition )
    }
    
}
