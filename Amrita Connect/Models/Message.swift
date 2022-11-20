//
//  Message.swift
//  Amrita Connect
//
//  Created by Vaisakhkrishnan K on 08/06/22.
//

import Foundation

struct Message:Identifiable, Codable
{
    var id:String
    var text:String
    var recieved:Bool
    var time:Date
    var user:String
    var secureKey = "QEt63jHhfke_euyfn782bfoih2go_238y764787*&@#947bgdig3"
}
