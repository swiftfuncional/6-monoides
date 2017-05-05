public func &&<T, E>(
	_ firstValidator: @escaping (T) -> Result<T,E>,
	_ secondValidator: @escaping (T) -> Result<T,E>) -> (T) -> Result<T,E> {

	return { t in
		let result = firstValidator(t)

		switch result {
		case .Failure:
			return result
		case let .Success(t1):
			return secondValidator(t1)
		}
	}
}
