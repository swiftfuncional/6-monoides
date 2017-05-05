class AddUserUseCase {

	let db = UserDatabase()

	func add(name: String, password: String) throws -> Bool {
		if validate(name: name) && validate(password: password) {

			let user = User(name: name, password: password)

			try db.create(user)

			return true
		}

		return false
	}

	internal func validate(name: String) -> Bool {
		return !name.isEmpty && name.characters.count <= 15
	}

	internal func validate(password: String) -> Bool {
		return password.characters.count >= 10
	}
}

let useCase = AddUserUseCase()

if try useCase.add(name: "Alex", password: "functional") {
	print("SUCCESS: User created")
} else {
	print("ERROR: Something is wrong")
}