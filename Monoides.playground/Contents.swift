class AddUserUseCase {

	let db = UserDatabase()

	func add(name: String, password: String) throws -> User {
		try validate(name: name)
		try validate(password: password)

		let user = User(name: name, password: password)

		return try db.create(user)
	}

	internal func validate(name: String) throws {
		if name.isEmpty || name.characters.count > 15 {
			throw UserError.UsernameOutOfBounds
		}
	}

	internal func validate(password: String) throws {
		if password.characters.count < 15 {
			throw UserError.PasswordTooShort
		}
	}
}