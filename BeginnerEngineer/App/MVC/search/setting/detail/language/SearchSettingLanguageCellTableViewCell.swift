//
//  SearchSettingLanguageCellTableViewCell.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/15.
//

import UIKit

class SearchSettingLanguageCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var langlabel: UILabel!
    @IBOutlet weak var checkMarkImage: UIImageView!
    
    public func setupCell(langLabelText: String, isHiddenCheckMarkImage: Bool) {
        self.langlabel.text = langLabelText
        self.checkMarkImage.isHidden = isHiddenCheckMarkImage
    }
    
    public func updateCell(langLabelText: String) {
        self.langlabel.text = langLabelText
        let isHiddenCheckMarkImage: Bool = self.checkMarkImage.isHidden
        if isHiddenCheckMarkImage {
            self.checkMarkImage.isHidden = false
        } else {
            self.checkMarkImage.isHidden = true
        }
    }
}
