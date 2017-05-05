class AddUserUseCase {

	let db = UserDatabase()

	func add(name: String, password: String) -> Result<User, UserError> {
		let user = User(name: name, password: password)

		let validator = validateName && validatePassword

		if let reason = validator(user) {
			return .Failure(reason)
		}

		return .Success(db.create(user))
	}

	internal func validateName(of user: User) -> UserError? {
		if !user.name.isEmpty && user.name.characters.count <= 15 {
			return nil
		}

		return .UsernameOutOfBounds
	}

	internal func validatePassword(of user: User) -> UserError? {
		if user.password.characters.count >= 10 {
			return nil
		}

		return .PasswordTooShort
	}
}

let useCase = AddUserUseCase()

useCase.add(name: "Alex", password: "functional").map {
	print("SUCCESS: User created - \($0)")
}
