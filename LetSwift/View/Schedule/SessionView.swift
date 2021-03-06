//
//  SessionView.swift
//  LetSwift
//
//  Created by BumMo Koo on 2019/09/24.
//  Copyright © 2019 Cleanios. All rights reserved.
//

import SwiftUI

struct SessionView: View {
    var session: ProtoSession
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                NavigationLink(destination: EmptyView()) {
                    HStack(alignment: .center) {
//                        Circle()
//                            .fill(Color(.secondarySystemBackground))
//                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text(session.speaker)
                                .font(.headline)
                                .multilineTextAlignment(.leading)
//                            Text("@userID")
//                                .font(.subheadline)
//                                .foregroundColor(Color(.secondaryLabel))
                        }
                    }
                }
                Divider()
                VStack(alignment: .leading, spacing: 16) {
                    Text(session.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
//                    VStack(alignment: .leading) {
//                        Text("Location")
//                            .font(.headline)
//                        Text("Integer posuere erat a ante venenatis dapibus posuere velit aliquet.")
//                            .font(.body)
//                            .lineLimit(nil)
//                            .multilineTextAlignment(.leading)
//                    }
//                    Divider()
//                    VStack(alignment: .leading) {
//                        Text("Description")
//                            .font(.headline)
//                        Text("Integer posuere erat a ante venenatis dapibus posuere velit aliquet.")
//                            .font(.body)
//                            .multilineTextAlignment(.leading)
//                            .lineLimit(nil)
//                    }
                }
            }
            .padding()
        }
        .navigationBarTitle("Session", displayMode: .inline)
    }
}

// MARK: - Preview
struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SessionView(session: ProtoSession.sessions.first!)
            }
            NavigationView {
                SessionView(session: ProtoSession.sessions.first!)
            }
            .environment(\.colorScheme, .dark)
            NavigationView {
                SessionView(session: ProtoSession.sessions.first!)
            }
            .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}
