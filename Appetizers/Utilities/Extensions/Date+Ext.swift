//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Yassine EL KEFI on 21/10/2025.
//

import Foundation

extension Date{
    var eighteenYearsAgo: Date{
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date{
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
