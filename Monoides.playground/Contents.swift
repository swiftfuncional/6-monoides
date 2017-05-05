class AddUserUseCase {

	let db = UserDatabase()

	func add(name: String, password: String) throws -> User {
		try validate(name: name)
		try validate(password: password)

		let user = User(name: name, password: password)

		return try db.create(user)
	}

	internal func validate(name: String) -> Bool {
		return !name.isEmpty && name.characters.count <= 15
	}

	internal func validate(password: String) -> Bool {
		return password.characters.count >= 10
	}
}

let useCase = AddUserUseCase()

do {
	try useCase.add(name: "Alex", password: "functional")
} catch UserError.UsernameOutOfBounds {
	print("ERROR: Username out of bounds")
} catch UserError.PasswordTooShort {
	print("ERROR: Password too short")
}