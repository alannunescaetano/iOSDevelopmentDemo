//
//  MasterViewController.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 09/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UISearchResultsUpdating {

    var detailViewController: DetailViewController? = nil
    let searchController = UISearchController(searchResultsController: nil)
    var tempPersons = Array<Person>()
    var allPersons = Array<Person>()
    var service:PersonService?
    
    private var fetchingMorePersons = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = PersonService()
        allPersons = service?.getPersons(startIndex: 0, numbersOfElements: 10) ?? Array<Person>()
        tempPersons = allPersons
        
        tableView.accessibilityIdentifier = "masterTableView"
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search person"
        
        if #available(iOS 11.0, *) {
           navigationItem.searchController = searchController
        } else {
           tableView.tableHeaderView = searchController.searchBar
        }
        
        definesPresentationContext = true
    }
    
    // MARK: - Search
    func updateSearchResults(for searchController: UISearchController) {
        let searchQuery = searchController.searchBar.text!
        if(searchQuery.isEmpty){
            tempPersons = allPersons
        }else{
            tempPersons = allPersons.filter { $0.name.contains(searchQuery) || $0.homeworld.contains(searchQuery) || $0.species.contains(searchQuery) }
        }
        tableView.reloadData()
 

    }
    
    private func emptySearchBar() {
        searchController.searchBar.text = ""
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPersonDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let person = tempPersons[indexPath.row]
                let controller = segue.destination as! DetailViewController
                controller.person = person
                controller.service = service
                detailViewController = controller
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(fetchingMorePersons){
            return tempPersons.count + 1
        }
        
        return tempPersons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == tempPersons.count){
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingCell
            cell.activityIndicator.startAnimating()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PersonCell
        cell.accessibilityIdentifier = "masterCell_\(indexPath.row)"
        
        cell.profileImage.image = UIImage(named: "generic_person")
        self.roundImage(imageView:cell.profileImage)
        
        let person = tempPersons[indexPath.row]
        
        cell.name!.text = person.name
        
        downloadProfileImage(from: person.imageURL, to: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (contentHeight != 0 && offsetY > contentHeight - scrollView.frame.height && !fetchingMorePersons) {
            emptySearchBar()
            fetchMorePersons { hasMoreToFetch in
                if(hasMoreToFetch){
                    DispatchQueue.main.async() {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    private func fetchMorePersons(completion: @escaping (Bool) -> ()) {
        fetchingMorePersons = true
        
        DispatchQueue.main.async() {
            self.tableView.reloadData()
        }
        
        DispatchQueue.global().async() {
            let persons = self.service?.getPersons(startIndex: self.allPersons.count, numbersOfElements: 10) ?? Array<Person>()
    //      to simulate a request time
            sleep(1)
                    
            self.allPersons.append(contentsOf: persons)
            self.tempPersons = self.allPersons
                    
            self.fetchingMorePersons = false
                    
            completion(persons.count > 0)
        }
    }
    
    private func downloadProfileImage(from urlString: String, to cellAt: IndexPath) {
        
        if let url:URL = URL(string: urlString) {
            URLSession.shared.dataTask(with: url){ data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async() {
                    if let cell = self.tableView.cellForRow(at: cellAt) as? PersonCell{
                        
                        cell.profileImage.image = UIImage(data: data)
                        self.roundImage(imageView: cell.profileImage)
                    }
                }
            }.resume()
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

