//
//  LogsTableViewCell.swift
//  ScreenLogger
//
//  Created by Eren Erten on 2.03.2023.
//

import UIKit

class LogsTableViewCell: UITableViewCell {

    @IBOutlet weak var logTime: UILabel!
    @IBOutlet weak var logMessage: UILabel!
    override func awakeFromNib() {
        logTime.textColor = .blue
        super.awakeFromNib()
    }
    func configureCell(_ logModel: LogModel){
        logTime.text = parseDateToString(date: logModel.logTime!)
        logMessage.text = logModel.logString
        
    }
    
    func parseDateToString( date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}
