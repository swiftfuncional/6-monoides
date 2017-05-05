public typealias Validator<T, U, E> = (T) -> Result<U,E>

public func &&<T, U, V, E>(
	_ firstValidator: @escaping Validator<T, U, E>,
	_ secondValidator: @escaping Validator<U, V, E>) -> Validator<T, V, E> {

	return { t in
		let result = firstValidator(t)

		switch result {
		case let .Failure(reason):
			return .Failure(reason)
		case let .Success(t1):
			return secondValidator(t1)
		}
	}
}
