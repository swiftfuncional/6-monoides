class AddUserUseCase {

	let db = UserDatabase()

	func add(name: String, password: String) -> Result<User, UserError> {
		let user = User(name: name, password: password)

		let validator = validateName && validatePassword

		return validator(user).map(db.create)
	}

	internal func validateName(of user: User) -> Result<User, UserError> {
		if !user.name.isEmpty && user.name.characters.count <= 15 {
			return .Success(user)
		}

		return .Failure(.UsernameOutOfBounds)
	}

	internal func validatePassword(of user: User) -> Result<User, UserError> {
		if user.password.characters.count >= 10 {
			return .Success(user)
		}

		return .Failure(.PasswordTooShort)
	}
}

let useCase = AddUserUseCase()

useCase.add(name: "Alex", password: "functional").map {
	print("SUCCESS: User created - \($0)")
}

/* Another example */
enum FormatError {
	case MustBeInt
}

func mustBeInt(_ string: String) -> Result<Int, FormatError> {
	return Int(string).flatMap { .Success($0) } ?? .Failure(.MustBeInt)
}

mustBeInt("30")
mustBeInt("1aa0")
