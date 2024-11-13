//
//  CharacterListViewModelTests.swift
//  Ricktionary
//
//  Created by Sergio Orozco on 13/11/24.
//


import XCTest
@testable import Ricktionary
@testable import Entities
@testable import DomainMocks
@testable import UseCases

final class CharacterListViewModelTests: XCTestCase {
    var vm: CharacterListViewModel!
    var mockRepository: MockCharacterRepository!
    var mockUseCase: DefaultCharacterUseCase!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockCharacterRepository()
        mockUseCase = DefaultCharacterUseCase(characterRepository: mockRepository)
        vm = CharacterListViewModel(charUseCase: mockUseCase)
    }
    
    override func tearDown() {
        vm = nil
        mockRepository = nil
        mockUseCase = nil
        super.tearDown()
    }
    
    func testLoadCharactersSuccessful() async {
        let mockCharacters = CharacterEntityFactory.createMockCharacters(count: 3)
        mockRepository.characters = mockCharacters
        mockRepository.totalPages = 2
        
        await vm.loadChars(isFirstLoad: true)
        
        XCTAssertEqual(vm.chars.count, 3)
        XCTAssertEqual(vm.loadState, .loaded)
        XCTAssertTrue(vm.hasMorePages)
    }
    
    func testLoadCharsEmptyState() async {
        mockRepository.characters = []
        await vm.loadChars(isFirstLoad: true)
        XCTAssertEqual(vm.loadState, .empty)
        XCTAssertTrue(vm.chars.isEmpty)
    }
    
    func testLoadCharsErrorState() async {
        mockRepository.shouldFail = true
        await vm.loadChars(isFirstLoad: true)
        XCTAssertEqual(vm.loadState, .error)
    }
    
    func testSearchTextFilterCharacters() async {
        let mockCharacters = [
            CharacterEntityFactory.createMockCharacter(id: 1),
            CharacterEntityFactory.createMockCharacter(id: 2)
        ]
        mockRepository.characters = mockCharacters
        await vm.loadChars(isFirstLoad: true)
        
        vm.searchText = "Rick"
        
        XCTAssertEqual(vm.filteredChars.count, 2)
        
        vm.searchText = "NonExistent"
        XCTAssertTrue(vm.filteredChars.isEmpty)
    }
}
