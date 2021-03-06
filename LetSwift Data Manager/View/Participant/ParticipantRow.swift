//
//  ParticipantRow.swift
//  LetSwift Data Manager
//
//  Created by BumMo Koo on 08/08/2019.
//  Copyright © 2019 Cleanios. All rights reserved.
//

import SwiftUI

struct ParticipantRow: View {
    @ObservedObject var participant: Participant
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 13, style: .continuous)
                .frame(width: 60, height: 60)
                .foregroundColor(.gray)
            VStack(alignment: .leading) {
                Text(participant.profile.preferredName)
                    .font(.headline)
                Text(participant.role.localizedName)
                    .font(.subheadline)
                Text(participant.description)
                    .font(.caption)
            }
        }
    }
}

#if DEBUG
struct ParticipantRow_Previews: PreviewProvider {
    static var previews: some View {
        return ParticipantRow(participant: Participant.dummy)
    }
}
#endif
