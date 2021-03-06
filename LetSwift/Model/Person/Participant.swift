//
//  Participant.swift
//  LetSwift
//
//  Created by BumMo Koo on 28/07/2019.
//  Copyright © 2019 Cleanios. All rights reserved.
//

import Foundation
import Combine

// MARK: - Participant
/// A person participating in an `Conference` with a specific `Role`.
/// A `Profile` may be referenced in multiple `Participant` when a person attends multiple `Conference`.
class Participant: Identifiable, Codable, ObservableObject {
    let id = UUID()
    var profile: Profile { willSet { objectWillChange.send() } }
    var role: Participant.Role { willSet { objectWillChange.send() } }
    var description: String { willSet { objectWillChange.send() } }
    var imageURLString: String { willSet { objectWillChange.send() } }
    var socialAccounts: [SocialAccount] { willSet { objectWillChange.send() } }
    
    var imageURL: URL? {
        URL(string: imageURLString)
    }
    
    // MARK: - Initialization
    init(profile: Profile,
         role: Participant.Role,
         description: String,
         imageURLString: String,
         socialAccounts: [SocialAccount]) {
        self.profile = profile
        self.role = role
        self.description = description
        self.imageURLString = imageURLString
        self.socialAccounts = socialAccounts
    }
    
    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case id, profile, role, description, imageURLString, socialAccounts
    }
    
    // MARK: - Observable Object
    let objectWillChange = ObservableObjectPublisher()
}

// MARK: - Equatable & Hashable
extension Participant: Hashable {
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Role
extension Participant {
    enum Role: String, Identifiable, Codable, CaseIterable {
        case unspecified
        case organizer
        case speaker
        case staff
        case sponsor
        
        var id: String {
            return rawValue
        }
        
        var localizedName: String {
            switch self {
            case .unspecified: return "Unspecified"
            case .organizer: return "Organizer"
            case .speaker: return "Speaker"
            case .staff: return "Staff"
            case .sponsor: return "Sponsor"
            }
        }
    }
}

// MARK: - Dummy
extension Participant {
    static var dummy: Participant {
        return Participant(profile: Profile.dummy,
                           role: .unspecified,
                           description: "",
                           imageURLString: "",
                           socialAccounts: [])
    }
}
