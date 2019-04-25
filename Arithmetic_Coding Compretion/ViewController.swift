//
//  ViewController.swift
//  Arithmetic_Coding Compretion
//
//  Created by SAM on 12/18/18.
//  Copyright © 2018 SAM. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    
    var low = 0.0
    var high = 1.0
    var range = 1.0
    var lowInbox = 0.0
    var highInbox = 0.0
    var lowAns = 0.0
    var highAns = 0.0
    

    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var Botton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Enter(_ sender: Any) {
    
         low = 0.0
         high = 1.0
         range = 1.0
         lowInbox = 0.0
         highInbox = 0.0
         lowAns = 0.0
         highAns = 0.0
        
        
        Mymain()
       
    }
    

    
    func Mymain (){
        
        var input:String = TextField.text!
        var inputArr = Array(input.characters)
        let strNum = input.count
        
        
        
        for i in 0..<strNum{
            if i == 0
            {
                let nn:String = String(inputArr[i])
                
                highInbox = lowInbox + (SpecificWordCount(str: input, word: nn)) / Double(strNum)
                
                lowAns = low + range * lowInbox
                highAns = low + range * highInbox
                range = highAns - lowAns
                lowInbox = highInbox
                
                low = lowAns
                high = highAns
            }
                
            else{
                let nn:String = String(inputArr[i])
                highInbox = lowInbox + (SpecificWordCount(str: input, word: nn)) / Double(strNum)
                
                //print ("\(i) \(lowInbox)  \(highInbox)")
                lowAns = low + range * lowInbox
                highAns = low + range * highInbox
                range = highAns - lowAns
                lowInbox = highInbox
                low = lowAns
                high = highAns
                
            }
            
            
            print("\(lowAns) :  \(highAns) ")
            
            //print ("\(i) \(high)  \(low)")
            
            
        }
        let Final = [lowAns , highAns]
        TextView.text = String(describing: Final)
    }

    
    
    func SpecificWordCount(str:String, word:String) ->Double {
        let words = str; var count = 0.0
        for thing in words {
            if thing == Character(word) {
                count += 1.0
            }
        }
        return count
    }
}

