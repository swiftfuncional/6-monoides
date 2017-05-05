class AddUserUseCase {

	let db = UserDatabase()

	func add(name: String, password: String) throws -> User? {
		if validate(name: name) && validate(password: password) {

			let user = User(name: name, password: password)

			return try db.create(user)
		}

		return nil
	}

	internal func validate(name: String) -> Bool {
		return !name.isEmpty && name.characters.count <= 15
	}

	internal func validate(password: String) -> Bool {
		return password.characters.count >= 10
	}
}

let useCase = AddUserUseCase()

try useCase.add(name: "Alex", password: "functional").map {
	print("SUCCESS: User created - \($0)")
}