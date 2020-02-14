//
//  SecondViewController.swift
//  GCD
//
//  Created by Lucky on 14/02/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit


class SecodViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImage()
        delay(3) {
            self.loginAlert()
        }
    }
    
    
    fileprivate func delay(_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds (delay)) {
            closure ()
        }
    }
    
        
        // Add Alert Controller
    fileprivate func loginAlert() {
        let ac = UIAlertController(title: "Sign up?", message: "Add your login and password", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        ac.addAction(ok)
        ac.addAction(cancelAction)
        
        // Add text fields to the alertController
        ac.addTextField { (usernameTF) in
            usernameTF.placeholder = "Log in"
        }
        
        ac.addTextField { (userPwTF) in
            userPwTF.placeholder = "Enter password"
            userPwTF.isSecureTextEntry = true
            }
        self.present(ac, animated: true, completion: nil)
    }
    
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://www.iguides.ru/upload/medialibrary/e11/e116b83e0de7bb33727067c69b6e27ae.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            
            // Back to main stream
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }
}

