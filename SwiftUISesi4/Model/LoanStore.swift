//
//  LoanStore.swift
//  SwiftUISesi4
//
//  Created by Hidayat Abisena on 02/12/22.
//

import Foundation

class LoanStore: Decodable, ObservableObject {
    @Published var loans: [Loan] = []
    private static var baseURL = "https://api.kivaws.org/v1/loans/newest.json"
    
    enum CodingKeys: CodingKey {
        case loans
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        loans = try values.decode([Loan].self, forKey: .loans)
    }
    
    func fetchLatestLoans() {
        guard let loanURL = URL(string: LoanStore.baseURL) else { return }
        
        let request = URLRequest(url: loanURL)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    self.loans = self.parseJsonData(data: data)
                    print(self.loans)
                }
            }
        }
        
        task.resume()
    }
    
    func parseJsonData(data: Data) -> [Loan] {
        let decoder = JSONDecoder()
        
        do {
            let loanStore = try decoder.decode(LoanStore.self, from: data)
            self.loans = loanStore.loans
        } catch {
            print(error)
        }
        
        return loans
    }
}
