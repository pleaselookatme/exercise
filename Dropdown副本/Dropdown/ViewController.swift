

import Foundation
import UIKit

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var choose: UITableView!
    
    var arr = ["一年级","二年级","三年级","四年级","五年级","六年级"]
    var gradeChoose = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView:UITableView!,numberOfRowsInSection section:Int)->Int{
        return arr.count
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "channel")
        cell.textLabel.text = arr[indexPath.row]
        return cell
    }
 
func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    var dc=DisplayViewController()
        dc.gradeChoose = arr[indexPath.row]
    println("\(dc.gradeChoose)")
        self.presentViewController(dc, animated: true, completion: nil)
    
    }
    
}
