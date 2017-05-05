class AddUserUseCase {

	let db = UserDatabase()

	func add(name: String, password: String) throws -> User? {
		if validate(name: name) && validate(password: password) {

			let user = User(name: name, password: password)

			return try db.create(user)
		}

		return nil
	}

	internal func validate(name: String) -> UserError? {
		if !name.isEmpty && name.characters.count <= 15 {
			return nil
		}

		return .UsernameOutOfBounds
	}

	internal func validate(password: String) -> UserError? {
		if password.characters.count >= 10 {
			return nil
		}

		return .PasswordTooShort
	}
}

let useCase = AddUserUseCase()

try useCase.add(name: "Alex", password: "functional").map {
	print("SUCCESS: User created - \($0)")
}