public typealias Validator<T, E> = (T) -> Result<T, E>

public func &&<T, E>(
	_ firstValidator: @escaping Validator<T, E>,
	_ secondValidator: @escaping Validator<T, E>) -> Validator<T, E> {

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
