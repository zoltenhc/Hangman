//  Prüfungsarbeit PR_179_01
//  ViewController.swift
//  Programmieraufgaben Apps mit grafischer Oberfläche
//  Aufgabe_03
//
//  Created by Zoltán Gál on 2020. 12. 11..
//  Copyright © 2020. Zoltán Gál. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    
    @IBOutlet weak var auswahl: NSPopUpButton!
    @IBOutlet weak var zahlVersuche: NSTextField!
    @IBOutlet weak var wortZufall: NSTextField!
    let worter = ["Abend","Apfel","Ball","Baum","Blume","Dorf","Erde","Essen","Fahrrad","Flasche","Freund","Geld","Glück","Hand","Haus","Herz","Katze","Land","Licht","Musik","Maus","Nacht","Name","Pferd","Schule","Sommer","Tisch","Uhr","Vater","Vogel","Welt","Wasser","Wetter","Zeitung","Zug"]
    var eintraege = [" ","A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö","P","Q","R","S","T","U","Ü","V","W","X","Y","Z"]
    var wort2 = String()
    var arrayWort2 = Array<Character>()
    var labelWort2 = Array<Character>()
    
        
    @objc func initSpielFeld() {
        let wort = worter.randomElement()!
        var labelWort = Array<Character>()
        let arrayWort = Array(wort.uppercased())
        arrayWort2 = arrayWort
        //print(arrayWort)
        for _ in 1...arrayWort.count {
            labelWort += ["*"]
        }
        labelWort2 = labelWort
        let str = String(labelWort)
            wortZufall.stringValue = str
        wort2 = wort
        zahlVersuche.intValue = 10
        
        zahlVersuche.sizeToFit()
        auswahl.removeAllItems()
        auswahl.addItems(withTitles: eintraege)
    }
   
    @IBAction func wahl(_ sender: Any) {
        if zahlVersuche.intValue > 0 {
        let searchvalue = Character(auswahl.titleOfSelectedItem!)
            if searchvalue == " " {
                return
            }
        let str2 = String(labelWort2)
        for (index,buchstabe) in arrayWort2.enumerated() {
            if buchstabe == searchvalue{
                labelWort2[index] = buchstabe
                }
            }
        let str = String(labelWort2)
        if str2 == str {
            zahlVersuche.intValue -= 1
            }
        else {
            wortZufall.stringValue = str
            wortZufall.sizeToFit()
            }
           
        if let index2 = eintraege.firstIndex(of: String(searchvalue)) {
            eintraege.remove(at: index2)
            auswahl.removeAllItems()
            auswahl.addItems(withTitles: eintraege)
            }
        }
        if zahlVersuche.intValue == 0 {
            zahlVersuche.sizeToFit()
            let meinemeldung : NSAlert = NSAlert()
            meinemeldung.messageText = "Hinweis"
            meinemeldung.informativeText = "Sie haben verloren"
            meinemeldung.runModal()
            NSApplication.shared.terminate(self)
            auswahl.isEnabled = false
            }
        if  !labelWort2.contains("*") {
            let meinemeldung : NSAlert = NSAlert()
            meinemeldung.messageText = "Hinweis"
            meinemeldung.informativeText = "Herzlichen Glückwunsch"
            meinemeldung.runModal()
            NSApplication.shared.terminate(self)
            }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSpielFeld()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

