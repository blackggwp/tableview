//
//  ViewController.swift
//  tableview
//
//  Created by sukishiMAC on 3/30/2560 BE.
//  Copyright © 2560 code2exit. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var data: [AnyObject] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
       // tableView.delegate = self;
        //tableView.dataSource = self;
        
        loadjson()
    }
    
    func  loadjson(){
        
   DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
    
      self.data = self.getjson("http://223.27.210.251/getjson.php")
    
     self.tableView.reloadData()
    
      //self.showdilog(String(describing: self.data))
    
    })
        
    
    }
    func strurl(_ s:String)->URL {
        
        
        
        let surl : NSString = s.addingPercentEscapes(using: String.Encoding.utf8)! as NSString
        let url : URL = URL(string: surl as String)!
        return url
    }
    func getjson(_ urlcall:String)->[AnyObject] {
        
        
        var url:URL=strurl(urlcall)
        var data:[AnyObject] = []
        //let allContactsData=NSData(contentsOfURL:NSURL(string:g.share.urlq)!)
        let allContactsData=try? Data(contentsOf: url)
        do {
            if let json = try JSONSerialization.jsonObject(with: allContactsData!, options: []) as? AnyObject {
             
               
               // showdilog(String(describing: json))
                
                
                if let json = json["d"] as? Array<AnyObject> {
                    for index in 0...json.count-1 {
                        data.append(json[index])
                    }
                }
            }
            
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return data
        
    }
    
    func showdilog(_ msg:String){
        
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.data.count
        
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
       
        
        
       
           let row  = self.data[indexPath.row]

         //   let  r:NSMutableDictionary = self.data[indexPath.row] as! NSMutableDictionary

        
        var url = URL(string:  row["defimg"] as! String)
        var data = try? Data(contentsOf: url!)
        c.defimg.image = UIImage(data: data!)
        
         url = URL(string:  row["uimg"] as! String)
         data = try? Data(contentsOf: url!)
        c.uimg.image = UIImage(data: data!)
        
         

        c.fname.text = row["fname"] as! String
        
        
        // Configure the cell...

        return c
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
