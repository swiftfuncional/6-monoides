public struct User {
	public let name: String
	public let password: String

	public init(name: String, password: String) {
		self.name = name
		self.password = password
	}
}

public enum UserError {
	case UsernameOutOfBounds
	case PasswordTooShort
}

public class UserValidator {

	public class var Name: Validator<User, UserError> {
		return validate(.UsernameOutOfBounds) {
			!$0.name.isEmpty && $0.name.characters.count <= 15
		}
	}

	public class var Password: Validator<User, UserError> {
		return validate(.PasswordTooShort) {
			$0.password.characters.count >= 10
		}
	}
}
