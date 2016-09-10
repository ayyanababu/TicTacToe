//
//  TicTacToeController.swift
//  TicTacToe
//
//  Created by Raja Ayyan on 09/09/16.
//  Copyright © 2016 Raja Ayyanababu. All rights reserved.
//

import UIKit

class TicTacToeController: UIViewController {
    
    
    //MARK: iVars for Controller
    
    enum BoardPlayers: Int{
        case Device = 0
        case User = 1
        
    }
    
    //Buttons
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    
    var isUserPlayed = false
    
    var boardButtons = [UIButton]()
    var occupiedButtons = [Int: Int]()
    var gameDone = false
    var isDevicePlaying = false
    
    var gameCounter = 0
    var userwon = 0
    var devicewon = 0
    var drawn = 0
    
    
    //MARK: ControllerMethods
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardButtons = [button1, button2, button3, button4, button5, button6, button7, button8, button9]
        
        self.resultsTableView.backgroundColor = UIColor.clearColor()
        
        self.backgroundView.layer.cornerRadius = 10.0
        self.backgroundView.layer.masksToBounds = false
        self.backgroundView.layer.shadowRadius = 10.0
        self.backgroundView.layer.shadowColor  = UIColor.whiteColor().CGColor
        self.backgroundView.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        
        messageLabel.hidden = false
        messageLabel.text = "Please Start Game"
        self.resultsTableView.layer.cornerRadius = 5.0
        self.resultsTableView.separatorColor = UIColor.clearColor()

        self.resetButton.setTitle("Start", forState: .Normal)

    }
    
    
    
    @IBAction func ButtonClicked(sender: AnyObject) {
        
        if gameDone{
            return
        }
        let buttontapped = sender as? UIButton
        buttontapped?.setTitle("X", forState: .Normal)
        isUserPlayed = true
        messageLabel.text = "Play In Progress"
        self.resetButton.setTitle("Restart", forState: .Normal)
        
        if occupiedButtons[sender.tag] == nil && !isDevicePlaying && !gameDone {
            setPlayerMarkOnBoard(sender.tag, player: .User)
        }
        
        checkForWin()
        nowDeviceToPlay()
        
    }
    
    
    func setPlayerMarkOnBoard(place: Int, player: BoardPlayers){
        
        let markOnButton =  (player == .User) ? "X" : "O"
        let buttonColor = (player == .User) ? UIColor.whiteColor() : UIColor.redColor()
        self.occupiedButtons[place] = player.rawValue
        
        if place > 0{
            let button = self.boardButtons[place - 1]
            button.setTitle(markOnButton, forState: .Normal)
            button.setTitleColor(buttonColor, forState: .Normal)
        }
        
    }
    
    func checkForWin(){
        
        let whoWon = ["User":1,"Device":0]
        for (key,value) in whoWon {
            if ((occupiedButtons[1] == value && occupiedButtons[4] == value && occupiedButtons[7] == value) || //across the bottom
                (occupiedButtons[1] == value && occupiedButtons[5] == value && occupiedButtons[9] == value) || //across the middle
                (occupiedButtons[1] == value && occupiedButtons[2] == value && occupiedButtons[3] == value) || //across the top
                (occupiedButtons[3] == value && occupiedButtons[5] == value && occupiedButtons[7] == value) || //down the left side
                (occupiedButtons[3] == value && occupiedButtons[6] == value && occupiedButtons[9] == value) || //down the middle
                (occupiedButtons[7] == value && occupiedButtons[8] == value && occupiedButtons[9] == value) || //down the right side
                (occupiedButtons[4] == value && occupiedButtons[5] == value && occupiedButtons[6] == value) || //diagonal
                (occupiedButtons[2] == value && occupiedButtons[5] == value && occupiedButtons[8] == value))   //diagonal
            {
                messageLabel.hidden = false
                messageLabel.text = " \(key) has won the game great!"
                
                if key == "User"{
                    userwon = userwon + 1
                }else{
                    devicewon = devicewon + 1
                }
                gameDone = true;
                return
            }
        }
        
        if self.occupiedButtons.count == 9{
            messageLabel.hidden = false
            messageLabel.text = " Its Draw Between Players"
            drawn = drawn + 1
            gameDone = true;
            return
            
        }
        
    }
    
    
    
    
    
    @IBAction func resetButton(sender: AnyObject) {
        self.occupiedButtons = [:]
        
        if gameDone{
            self.gameCounter = gameCounter + 1
            self.resultsTableView.reloadData()
//            print("totalgame \(gameCounter)")
//            print("user won \(userwon)")
//            print("device won \(devicewon)")
//            print("drawn \(drawn)")
        }
       
        
        messageLabel.hidden = false
        messageLabel.text = "Please Start Game"
        gameDone = false
        self.resetButton.setTitle("Start", forState: .Normal)

        
        
        button1.setTitle("+", forState: .Normal)
        button1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        button2.setTitle("+", forState: .Normal)
        button2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        button3.setTitle("+", forState: .Normal)
        button3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        button4.setTitle("+", forState: .Normal)
        button4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        button5.setTitle("+", forState: .Normal)
        button5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        button6.setTitle("+", forState: .Normal)
        button6.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        button7.setTitle("+", forState: .Normal)
        button7.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        button8.setTitle("+", forState: .Normal)
        button8.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        button9.setTitle("+", forState: .Normal)
        button9.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        
        if !isUserPlayed{
            nowDeviceToPlay()
        }
        
    }
    
}




extension TicTacToeController{
    
    //MARK: Device Playing Algorithm
    func nowDeviceToPlay(){
        
        if gameDone{
            return
        }
        
        isDevicePlaying = true
        isUserPlayed = false
        messageLabel.text = "Play In Progress"
        self.resetButton.setTitle("Restart", forState: .Normal)

        
        
        if let result = rowCheck(0){
            let whereToPlayResult = whereToPlay(result.location, pattern: result.pattern)
            if !isOccupied(whereToPlayResult + 1){
                setPlayerMarkOnBoard(whereToPlayResult + 1, player: .Device)
                isDevicePlaying = false
                checkForWin()
                return
            }
        }
        
        if let result = rowCheck(1){
            let whereToPlayResult = whereToPlay(result.location, pattern: result.pattern)
            if !isOccupied(whereToPlayResult + 1){
                setPlayerMarkOnBoard(whereToPlayResult + 1, player: .Device)
                
                isDevicePlaying = false
                checkForWin()
                return
            }
        }
        
        if !isOccupied(5){
            setPlayerMarkOnBoard(5, player: .Device)
            isDevicePlaying = false
            checkForWin()
            return
        }
        
        if let isCornerAvailable = firstAvailable(true){
            setPlayerMarkOnBoard(isCornerAvailable, player: .Device)
            isDevicePlaying = false
            checkForWin()
            return
        }
        
        
        if let isSideAvailable = firstAvailable(false){
            setPlayerMarkOnBoard(isSideAvailable, player: .Device)
            isDevicePlaying = false
            checkForWin()
            return
        }
        
        
        
        messageLabel.hidden = false
        messageLabel.text = "Its a Draw Between Players"
        drawn = drawn + 1
        isDevicePlaying = false
        gameDone = true
        
        
        
    }
    
    func rowCheck(value:Int) -> (location: String, pattern: String)?{
        let acceptableFinds = ["011","110","101"]
        let findFunctions = [checkTop, checkBottom, checkLeft, checkRight, checkMiddleAcross, checkMiddleDown, checkDiagonalLeftRight, checkDiagonalRightLeft]
        
        for algo in findFunctions{
            let result = algo(value)
            for pattrn in acceptableFinds{
                if pattrn == result.pattern{
                    return result
                }
            }
        }
        
        return nil
        
    }
    
    func whereToPlay(location: String, pattern: String) -> Int{
        
        let leftPattern = "011"
        let rightPattern = "110"
        // let middlePattern = "101"
        
        switch location {
        case "top":
            if pattern == leftPattern {
                return 0
            }else if pattern == rightPattern{
                return 2
            }else{
                return 1
            }
        case "bottom":
            if pattern == leftPattern {
                return 6
            }else if pattern == rightPattern{
                return 8
            }else{
                return 7
            }
        case "left":
            if pattern == leftPattern {
                return 0
            }else if pattern == rightPattern{
                return 6
            }else{
                return 3
            }
        case "right":
            if pattern == leftPattern {
                return 2
            }else if pattern == rightPattern{
                return 8
            }else{
                return 5
            }
        case "middleVert":
            if pattern == leftPattern {
                return 1
            }else if pattern == rightPattern{
                return 7
            }else{
                return 4
            }
        case "middleHorz":
            if pattern == leftPattern {
                return 3
            }else if pattern == rightPattern{
                return 5
            }else{
                return 4
            }
        case "diagLeftRight":
            if pattern == leftPattern {
                return 0
            }else if pattern == rightPattern{
                return 8
            }else{
                return 4
            }
        case "diagRightLeft":
            if pattern == leftPattern {
                return 2
            }else if pattern == rightPattern{
                return 6
            }else{
                return 4
            }
            
        default:
            return 4
        }
        
        
    }
    
    
    func firstAvailable(isCorner:Bool) -> Int? {
        let places = isCorner ? [1,3,7,9] : [2,4,6,8]
        for place in places {
            if !isOccupied(place) {
                return place
            }
        }
        return nil
    }
    
    
    func isOccupied(place: Int) -> Bool
    {
        if occupiedButtons[place] != nil {
            return true
        }
        return false
    }
    
    
    
    
    
    func checkForPattern(value: Int, inList: [Int]) -> String{
        var pattern = ""
        for cell in inList{
            if occupiedButtons[cell] == value{
                pattern = pattern + "1"
            }else{
                pattern = pattern + "0"
            }
        }
        
        return pattern
    }
    
    func checkBottom(value: Int) -> (location: String, pattern: String){
        return ("bottom", checkForPattern(value, inList: [7,8,9]))
    }
    
    func checkTop(value: Int) -> (location: String, pattern: String){
        return ("top", checkForPattern(value, inList: [1,2,3]))
    }
    
    func checkLeft(value: Int) -> (location: String, pattern: String){
        return ("left", checkForPattern(value, inList: [1,4,7]))
    }
    
    func checkRight(value: Int) -> (location: String, pattern: String){
        return ("right", checkForPattern(value, inList: [3,6,9]))
    }
    
    func checkMiddleAcross(value: Int) -> (location: String, pattern: String){
        return ("middleHorz", checkForPattern(value, inList: [4,5,6]))
    }
    
    func checkMiddleDown(value: Int) -> (location: String, pattern: String){
        return ("middleVert", checkForPattern(value, inList: [2,5,8]))
    }
    func checkDiagonalLeftRight(value: Int) -> (location: String, pattern: String){
        return ("diagRightLeft", checkForPattern(value, inList: [3,5,7]))
    }
    func checkDiagonalRightLeft(value: Int) -> (location: String, pattern: String){
        return ("diagLeftRight", checkForPattern(value, inList: [1,5,9]))
    }
    
    
    
    
}

//MARK: ResultsController
extension TicTacToeController: UITableViewDelegate, UITableViewDataSource{
    
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? ResultsCell
        
        switch indexPath.row {
        case 0:
            cell?.configureCell("Total Games", number: gameCounter)
        case 1:
            cell?.configureCell("user Won", number: userwon)
        case 2:
            cell?.configureCell("Device Won", number: devicewon)
        case 3:
            cell?.configureCell("Drawn", number: drawn)
        default:
            cell?.configureCell("No Data:", number: 0)
        }
        
        
        
        
        
        return cell!
    }
    
    
}
