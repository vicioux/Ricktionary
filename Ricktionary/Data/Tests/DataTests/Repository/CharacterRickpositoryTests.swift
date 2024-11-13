//
//  CharacterRickpositoryTests.swift
//
//
//  Created by Sergio Orozco on 13/11/24.
//

import XCTest
@testable import Repository
@testable import Services
@testable import Entities

final class CharacterRickpositoryTests: XCTestCase {
    var repo: CharacterRickpository!
    
    override func setUp() {
        super.setUp()
        repo = CharacterRickpository()
    }
    
    override func tearDown() {
        repo = nil
        super.tearDown()
    }
    
    func testFetchCharacters() async throws {
        // Just test the basic integration
        do {
            let (pages, characters) = try await repo.fetchCharacters(page: 1)
            XCTAssertGreaterThan(pages, 0)
            XCTAssertFalse(characters.isEmpty)
        } catch {
            XCTFail("Should not throw error: \(error)")
        }
    }
}
