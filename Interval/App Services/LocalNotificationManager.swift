//
//  LocalNotificationManager.swift
//  Interval
//
//  Created by Neftali Samarey on 6/2/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import Foundation

struct Notification {
    var id: String
    var title : String
    var dateTime : DateComponents
}

class LocalNotificationManager
{
    var notifications = [Notification]()
    
}
