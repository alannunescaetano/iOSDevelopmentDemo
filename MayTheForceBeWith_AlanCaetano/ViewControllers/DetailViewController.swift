//
//  DetailViewController.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 09/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var person: Person?
    
    var service: PersonService?

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func shareProfile(_ sender: Any) {
        ShareProfileToWebHookService().shareProfile(person: person!, completion: {success in
            var message:String
            var title: String
            
            if(success){
                title = "Person sent"
                message = "Person data sent successfully."
            }else{
                title = "Error sending person"
                message = "Error while sending person data."
            }
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert )
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            DispatchQueue.main.async{
                self.present( alert, animated: true, completion: nil)
            }
        })
    }

    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        
        navigationItem.title = person?.name
        
        tableView.accessibilityIdentifier = "detailTable"
    }
    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showContentDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ContentViewController
                
                if(indexPath.section == 1 && indexPath.row == 1){
                    let service = HomeworldService()
                    if let homeworld = service.getHomeworld(id: person!.idHomeWorld){
                        controller.navigationItem.title = homeworld.name
                        controller.text = homeworld.text
                        controller.imageUrl = homeworld.imageUrl
                    }
                } else  if(indexPath.section == 1 && indexPath.row == 2){
                    let service = SpaceshipService()
                    if let spaceship = service.getSpaceship(id: person!.idSpaceship){
                        controller.navigationItem.title = spaceship.name
                        controller.text = spaceship.text
                        controller.imageUrl = spaceship.imageUrl
                    }
                }
            }
        }
    }
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0 && indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "personImageCell", for: indexPath) as! PersonImageCell
            
            cell.accessibilityIdentifier = "personImageCell"
            cell.personName.accessibilityIdentifier = "labelPersonName"
            
            cell.personName.text = person?.name
            downloadImage(from: person!.imageURL) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async() {
                    cell.personImage.image = UIImage(data: data)
                    self.roundImage(imageView: cell.personImage)
                }
            }
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.isUserInteractionEnabled = false
            return cell
        } else if (indexPath.section == 1 && indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "personDetailCell", for: indexPath) as! PersonDetailCell
            cell.descriptionText.text = "Species"
            cell.valueText.text = person?.species
            cell.valueText.textColor = UIColor.gray
            cell.accessoryType = UITableViewCell.AccessoryType.none
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.isUserInteractionEnabled = false
            return cell
        } else if (indexPath.section == 1 && indexPath.row == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "personDetailCell", for: indexPath) as! PersonDetailCell
            cell.descriptionText.text = "Homeworld"
            cell.valueText.text = person?.homeworld
            return cell
        } else if (indexPath.section == 1 && indexPath.row == 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "personDetailCell", for: indexPath) as! PersonDetailCell
            cell.descriptionText.text = "Spaceship"
            cell.valueText.text = person?.spaceship
            return cell
        } else if (indexPath.section == 2 && indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addToFavoriteCell", for: indexPath)
            
            if(!person!.favorite){
                cell.textLabel?.text = "Add as favourite"
                cell.textLabel?.textColor = UIColor.green
            }else{
                cell.textLabel?.text = "Remove favourite"
                cell.textLabel?.textColor = UIColor.red
            }

            return cell
        }

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 2 && (indexPath.row == 0)){
            person!.favorite.toggle()
            service?.setPersonAsFavorite(id: person!.id, isFavorite: person!.favorite)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 10
        } else if (section == 1) {
            return 10
        }
        
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0 && indexPath.row == 0) {
            return 260
        }
        
        return 80
    }
    
    private func downloadImage(from urlString: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        if let url:URL = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
    }
    
    private func roundImage(imageView: UIImageView){
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.backgroundColor = UIColor.clear
    }

}

