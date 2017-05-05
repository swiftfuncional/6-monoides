class AddUserUseCase {

	let db = UserDatabase()

	func add(name: String, password: String) throws -> Result<User, UserError> {
		if let reason = validate(name: name) {
			return .Failure(reason)
		}

		if let reason = validate(password: password) {
			return .Failure(reason)
		}

		let user = User(name: name, password: password)

		return .Success(db.create(user))
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

useCase.add(name: "Alex", password: "functional").map {
	print("SUCCESS: User created - \($0)")
}
