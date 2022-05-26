//
//  TransactionView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionView: View {
    @ObservedObject var viewModel: TransactionViewModel
    var pinned: (Bool) -> Void
    
    init(viewModel: TransactionViewModel, pinnedClosure: @escaping (Bool) -> Void ) {
        self.viewModel = viewModel
        self.pinned = pinnedClosure
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.transaction.category.rawValue)
                    .font(.headline)
                    .foregroundColor(viewModel.transaction.category.color)
                Spacer()
                Button(action: {
                    viewModel.isPinned.toggle()
                    
                    pinned(!viewModel.isPinned)
                    
                }) {
                    Image(systemName: viewModel.isPinned ? "pin.slash.fill" : "pin.fill")
                }
                .accessibilityLabel(Text(viewModel.isPinned ? "Unpin Transaction" : "Pin Transaction"))
                .accessibilityValue(Text(viewModel.isPinned ? "Pinned Transaction" : "Unpinned Transaction"))
            }
            if !viewModel.isPinned {
                HStack {
                    viewModel.transaction.image
                        .resizable()
                        .frame(
                            width: 60.0,
                            height: 60.0,
                            alignment: .top
                        )
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.transaction.name)
                            .secondary()
                        Text(viewModel.transaction.accountName)
                            .tertiary()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        
                        Text("$\(viewModel.transaction.amount.formatted())")
                            .bold()
                            .secondary()
                        Text(viewModel.transaction.date.formatted)
                            .tertiary()
                    }
                }
            }
        }
        .padding(8.0)
        .background(Color.accentColor.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        
    }
}

#if DEBUG
struct TransactionView_Previews: PreviewProvider {
    static var closure: (Bool) -> Void = { _ in }
    static var previews: some View {
        VStack {
            TransactionView(viewModel: TransactionViewModel(transaction: ModelData.sampleTransactions[0]), pinnedClosure: closure)
            TransactionView(viewModel:TransactionViewModel(transaction: ModelData.sampleTransactions[1]), pinnedClosure: closure)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif

