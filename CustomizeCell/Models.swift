//
//  Models.swift
//  CustomizeCell
//
//  Created by Cesar  Perez Catalan on 10/12/22.
//

import Foundation

struct CountryModel : Codable{
    
    let idNationalTeam: Int?
    let nameNationalTeam : String?
    let imgNationalTeam : String?
}

struct TeamModel : Codable{
    
    let idPlayer: Int?
    let namePlayer : String?
    let positionPlayer : String?
    let imgPlayer : String?
}

struct PlayerModel : Codable{
    
    let idPlayer: Int?
    let namePlayer : String?
    let valuePlayer : Double?
    let positionPlayer : String?
    let rangePlayer : String?
    let imgPlayer : String?
}

struct FIFAModel : Codable{
    
    let country : String?
    let playerId: String?
    let position : String?
    let name : String?
    let playerImg : String?
    let countryLogo : String?
    let countryFlag : String?
    
}
