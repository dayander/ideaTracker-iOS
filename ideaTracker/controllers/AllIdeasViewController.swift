//
//  ViewController.swift
//  ideaTracker
//
//  Created by Anderson Day on 10/24/18.
//  Copyright © 2018 Anderson Day. All rights reserved.
//

import UIKit
     




class AllIdeasViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    

    
    var ideasList: [Idea] = []
    let queryService = QueryService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //tableView.tableFooterView = UIView()
        loadIdeasFromServer()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func loadIdeasFromServer() {
     
        self.queryService.getSearchResults() { results, errorMessage in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let results = results {
                self.ideasList.removeAll()
                self.ideasList    = results
                
                self.tableView.reloadData()
                print("data reloaded")
                self.tableView.setContentOffset(CGPoint.zero, animated: false)
            }
            if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
        }
        
        
    }

    
    @IBAction func addIdeaModalPush(_ sender: Any) {
        
        performSegue(withIdentifier: "addIdea", sender: nil )
    }
}

// MARK: - UITableView

extension AllIdeasViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ideasList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ideaCellUI") as! IdeaCell
//        print("table view two")
//        cell.textLabel!.text = ideasList[indexPath.row].quickTitle
//        print(cell)
        // Delegate cell button tap events to this view controller
        //cell.delegate = self as? IdeaCellDelegate
        
        let idea = ideasList[indexPath.row]
        
        cell.configure(idea: idea)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 62.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //let row = indexPath.row
        
         let idea = ideasList[indexPath.row]
        self.performSegue(withIdentifier: "ideaCellToFullIdea", sender: idea )


    }
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        
        if segue.identifier == "ideaCellToFullIdea"{
        let idea = sender as! Idea
        let detailView = segue.destination as! DetailedIdeaViewController
        detailView.ideaQuickTitle          =   idea.quickTitle
        
        
        detailView.ideaDescription = idea.description
//        detailView!.quickTitleTextEdit = idea.quickTitle
        
        
    }
    }
//        if sender === forgotPasswordButton{
//            segue.destination.navigationItem.title = "Forgot Password"
//
//        }else if sender === forgotUsernameButton{
//            segue.destination.navigationItem.title = "Forgot Username"
//
//        }else{
//            segue.destination.navigationItem.title = userNameField.text
//        }
    
//    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//
//        performSegueWithIdentifier("ideaCellToFullIdea", sender: cell)
//    }
    
    // When user taps cell, play the local file, if it's downloaded
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //let idea = ideasList[indexPath.row]
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
}




// MARK: - TrackCellDelegate
// Called by track cell to identify track for index path row,
// then pass this to download service method.
//extension AllIdeasViewController: IdeaCellDelegate {
//
//    func downloadTapped(_ cell: TrackCell) {
//        if let indexPath = tableView.indexPath(for: cell) {
//            let idea = ideaList[indexPath.row]
//            downloadService.startDownload(track)
//            reload(indexPath.row)
//        }
//    }
//
//    func pauseTapped(_ cell: TrackCell) {
//        if let indexPath = tableView.indexPath(for: cell) {
//            let track = searchResults[indexPath.row]
//            downloadService.pauseDownload(track)
//            reload(indexPath.row)
//        }
//    }
//
//    func resumeTapped(_ cell: TrackCell) {
//        if let indexPath = tableView.indexPath(for: cell) {
//            let track = searchResults[indexPath.row]
//            downloadService.resumeDownload(track)
//            reload(indexPath.row)
//        }
//    }
//
//    func cancelTapped(_ cell: TrackCell) {
//        if let indexPath = tableView.indexPath(for: cell) {
//            let track = searchResults[indexPath.row]
//            downloadService.cancelDownload(track)
//            reload(indexPath.row)
//        }
//    }
//
//    // Update track cell's buttons
//    func reload(_ row: Int) {
//        tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
//    }
//
//}
