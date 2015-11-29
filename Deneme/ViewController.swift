 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var historyLb: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    var operant:String = ""
    var islemFlag:Int = 0 //flag for 2nd operant
    var historyText:String?
    var flagEqualClicked:Bool = false
    
    var resultText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Clear(sender: AnyObject) {
        myLabel.text = ""
        historyLb.text = ""
        islemFlag = 0
        operant = ""
        flagEqualClicked=false
    }
    @IBAction func onClick(sender: AnyObject)
    {
        
        if historyText == nil
        {
            historyText = ""
        }
        resultText = myLabel.text!
        let click:Int = sender.tag
        
        if click >= 0 && click < 10
        {
            //writing numbers
            if flagEqualClicked && islemFlag == 0
            {
                flagEqualClicked=false
                resultText = ""
            }
   
            myLabel.text = "" + resultText + "\(click)"
        }
        else if click == 11 // sum operation
        {
            islemControl("+")
        }
        else if click == 12 // subtraction operation
        {
            islemControl("-")
        }
        else if click == 13 // multiplaction operation
        {
            islemControl("*")

        }
        else if click == 14 // division operation
        {
            islemControl("/")
        }
        else if click == 15 && islemFlag == 1      // for clicking equal button
        {
            flagEqualClicked=true
            historyLb.text = resultText
            let result:Int = parsing(resultText)
            
            historyText = historyText! + resultText + "=" + "\(result) \n"
            
            myLabel.text = "\(result)"
            islemFlag = 0
        }
    }
    func calculater(num1: Int, num2: Int) -> Int
    {
        var result:Int = 0
        
        if operant == "+"
        {
            result = num1 + num2
        }
        
        if operant == "-"
        {
            result = num1 - num2
        }
        
        if operant == "*"
        {
            result = num1 * num2
        }
        
        if operant == "/"
        {
            result = num1 / num2
        }
        
        return result
    }
    func parsing(text: String) -> Int
    {
        
        let numberArr = text.componentsSeparatedByString(operant)
        
        let firstNum: String = numberArr[0]
        let secondNum: String = numberArr[1]
        
        let num1:Int = Int(firstNum)!
        let num2:Int = Int(secondNum)!
        
        let result:Int = calculater(num1,num2: num2)
        islemFlag = 1
        return result
    }
    func islemControl(islem: String)
    {
        if islastCharIsOperant()
        {
            let test:String = myLabel.text!
            let endIndex = test.endIndex.advancedBy(-1)
            let newLabel =  test.substringToIndex(endIndex)
            
            myLabel.text = newLabel
            resultText = myLabel.text!
            islemFlag = 0
        }
        
        islemFlag++
        if islemFlag == 2
        {
            historyLb.text = resultText
            let result:Int = parsing(resultText)
            
            historyText = historyText! + resultText + "=" + "\(result) \n"
            
            myLabel.text = "\(result)"
            resultText = myLabel.text!
        }
        operant = islem
        myLabel.text = "" + resultText + operant
    }
    func islastCharIsOperant() -> Bool
    {
        let test:String = myLabel.text!
        let endIndex = test.endIndex.advancedBy(-1)
        let lastChar =  test.substringFromIndex(endIndex)
        
        if lastChar == "+" || lastChar == "-" || lastChar == "*" || lastChar == "/"
        {
            return true
        }
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let controller = segue.destinationViewController as! ViewController2
        controller.textV2 = historyText
    }
}

