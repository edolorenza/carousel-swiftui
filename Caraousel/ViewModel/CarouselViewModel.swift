//
//  CarouselViewModel.swift
//  Caraousel
//
//  Created by Edo Lorenza on 17/03/24.
//

import Combine
import Foundation

final class CarouselViewModel: ObservableObject {
    
    @Published private(set) var stateModel: UIStateModel = UIStateModel()
    @Published private(set) var activeCard: Int = 0
    private var cancellables: [AnyCancellable] = []
    
    init() {
        self.stateModel.$activeCard.sink { completion in
            switch completion {
            case let .failure(error):
                print("finished with error: ", error.localizedDescription)
            case .finished:
                print("finished")
            }
        } receiveValue: { [weak self] activeCard in
            self?.carouselChange(for: activeCard)
        }.store(in: &cancellables)
    }
    
    private func carouselChange(for activeCard: Int) {
        self.activeCard = activeCard
    }
}

