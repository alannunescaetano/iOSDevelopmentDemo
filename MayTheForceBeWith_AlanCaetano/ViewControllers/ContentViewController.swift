//
//  ContentViewController.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 11/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var contentImage: UIImageView!
    
    @IBOutlet weak var contentText: UILabel!
    
    
    var text: String?
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentText.text = text
        downloadImage(from: imageUrl ?? ""){ data, response, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async() {
                self.contentImage.image = UIImage(data: data)
            }
        }
    }
    
    private func downloadImage(from urlString: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        if let url:URL = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
    }
}
