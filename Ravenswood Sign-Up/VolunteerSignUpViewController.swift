//
//  ViewController.swift
//  Ravenswood Sign-Up
//
//  Created by Mischa Nee on 1/28/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit
// ADDED-Imports
import Firebase
import FirebaseDatabase

class VolunteerSignUpViewController: UIViewController, UITextFieldDelegate {
    
    var NameOfEvent: String?
    var NoofEvent: String?
    @IBOutlet weak var EventName: UILabel! {
        didSet {
            EventName.text=NameOfEvent
        }
    }
    
    @IBOutlet weak var NameField: UITextField! {
        didSet { NameField.placeholder="Name"
            
        }
        
    }
    @IBAction func NameTyped(_ sender: UITextField) {
        if let Name = sender.text {
            print(Name)
            
        }
        
    }
    @IBOutlet weak var DateField: UITextField! {
        didSet { DateField.placeholder="Date"}}
    
    
    
    @IBOutlet weak var TimeSlotField: UITextField! {
        didSet {
            TimeSlotField.placeholder="Look Down For Time Slots"
            TimeSlotField.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var PhoneNumberField: UITextField!{
        didSet { PhoneNumberField.placeholder = "Phone Number - Optional"}
    }
   
    @IBOutlet weak var EmailField: UITextField!{
        didSet { EmailField.placeholder = "Email Address - Optional"}}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextfield = textField.superview?.viewWithTag(textField.tag + 1 ) as? UITextField{
            nextfield.becomeFirstResponder()
        
        } else { textField.resignFirstResponder()}
        
        return false
    }

    @IBAction func Submit(_ sender: UIButton) {
        
        // ADDED - Example write data
        
        
        if let Name = NameField.text {
            if let TimeSlot = TimeSlotField.text {
                let PhoneNumber = PhoneNumberField.text
                let Email = EmailField.text
                self.ref?.child("Events").child(NoofEvent!).child("Sign-Ups").child("User2").setValue(["Name": Name, "Email":Email, "Phone":PhoneNumber, "Time Slot":TimeSlot])
            }
        }
        
     
        
    }
    
    // ADDED - reference vars
    var ref: DatabaseReference?
    var refHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameField.delegate=self
        DateField.delegate=self
        TimeSlotField.delegate=self
        PhoneNumberField.delegate=self
        EmailField.delegate=self
        
        NameField.tag=1
        DateField.tag=2
        TimeSlotField.tag=3
        PhoneNumberField.tag=4
        EmailField.tag=5
        
        // ADDED - init reference
        ref = Database.database().reference()
        
        // ADDED - template code for data listener
        refHandle = ref?.child("users").observe(.childAdded, with: { (snapshot) in
            //let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            // ...
        })
    }
    @IBAction func Button4Action(_ sender: UIButton) {
    }
    @IBAction func Button3Action(_ sender: UIButton) {
    }
    @IBAction func Button2Action(_ sender: UIButton) {
    }
    @IBAction func Button1Action(_ sender: UIButton) {
    }
    @IBOutlet weak var TimeButton1: UIButton!
    @IBOutlet weak var TimeButton2: UIButton!
    @IBOutlet weak var TimeButton3: UIButton!
    @IBOutlet weak var TimeButton4: UIButton!
}

