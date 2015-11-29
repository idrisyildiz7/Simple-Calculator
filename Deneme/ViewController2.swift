 

import UIKit

class ViewController2: UIViewController {
    
    var textV2: String!

    @IBOutlet weak var historyText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyText.editable = false
        historyText.scrollEnabled = true
        
        historyText.text = textV2
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let controller = segue.destinationViewController as! ViewController
        controller.historyText = textV2
    }


}
