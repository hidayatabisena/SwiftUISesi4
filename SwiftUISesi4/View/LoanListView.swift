//
//  LoanListView.swift
//  SwiftUISesi4
//
//  Created by Hidayat Abisena on 02/12/22.
//

import SwiftUI

struct LoanListView: View {
    // MARK: - PROPERTIES
    @ObservedObject var loanStore = LoanStore()
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List(loanStore.loans) { loan in
                ListRowView(loan: loan)
            }
            .listStyle(.plain)
            
        }
        .task {
            self.loanStore.fetchLatestLoans()
        }
        
    }
}

// MARK: - PREVIEW
struct LoanListView_Previews: PreviewProvider {
    static var previews: some View {
        LoanListView()
    }
}
