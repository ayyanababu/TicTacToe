//
//  ResultsCell.swift
//  TicTacToe
//
//  Created by Raja Ayyan on 10/09/16.
//  Copyright © 2016 Raja Ayyanababu. All rights reserved.
//

import UIKit

class ResultsCell: UITableViewCell {

    @IBOutlet weak var numberText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    
    func configureCell(title: String, number: Int){
        
        //self.backgroundColor = UIColor.redColor()
        self.titleText.text = title
        
        self.numberText.text = " : " + String(number)
    }

   

}
