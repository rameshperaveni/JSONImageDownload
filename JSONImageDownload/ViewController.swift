//
//  ViewController.swift
//  JSONImageDownload
//
//  Created by brn.developers on 6/14/18.
//  Copyright © 2018 brn.developers. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    var array = [Herostates]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        download()
            print("succes json")
        
        tableview.delegate = self
        tableview.dataSource = self
        
        
            }

    @IBOutlet weak var tableview: UITableView!
    
    func download( )
       // completed: @escaping () -> ()
    {
        let url = URL(string : "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil
            {
                do
                {
                   self.array = try JSONDecoder().decode([Herostates].self , from: data!)
                    print(self.array)
                
                  DispatchQueue.main.async {
                       self.tableview.reloadData()
                   }
                }
                catch
                {
                    print("Json error")
                }
                
            }
           
        }.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = array[indexPath.row].localized_name.capitalized
        
        return cell
        
    }

}

