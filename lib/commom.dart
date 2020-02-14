class CustomError implements Exception {
  CustomError(this.message);
  String message;
}

class Result<T> {
  Result._();

  factory Result.success(T data) = Success<T>;
  factory Result.error(CustomError exception) = Error<T>;
  factory Result.formMessage(String formMessage) = FormMessage<T>;
  factory Result.loginError(String formMessage) = LoginError<T>;
  factory Result.loading() = Loading<T>;

  T getSuccessData() {
    return (this as Success).data as T;
  }

  CustomError getErrorData() {
    return (this as Error).cause;
  }

  FormMessage getFormMessage() {
    return (this as FormMessage);
  }

  bool hasSuccessData() {
    try {
      if (this is Success) {
        final success = this as Success;
        return success != null && success.data != null;
      }
      return false;
    } on Exception catch(_) {
      return false;
    }
  }

  bool hasFormMessage() {
    try {
      if (this is FormMessage) {
        final formMessage = this as FormMessage;
        return formMessage != null && formMessage.message != null;
      }
      return false;
    } on Exception catch(_) {
      return false;
    }
  }

  bool hasErrorData() {
    try {
      if (this is Error) {
        final error = this as Error;
        return error != null && error.cause != null;
      }
      return false;
    } on Exception catch(_) {
      return false;
    }
  }

  bool isLoading() {
    try {
      if (this is Loading) {
        final loading = this as Loading;
        return loading != null;
      }

      return false;
    } on Exception catch(_) {
      return false;
    }
  }
}

class Success<T> extends Result<T> {
  Success(this.data): super._();

  final T data;
}

class Error<T> extends Result<T> {
  Error(this.cause): super._();

  final CustomError cause;
}

class FormMessage<T> extends Result<T> {
  FormMessage(this.message): super._();

  final String message;
}

class LoginError<T> extends Result<T> {
  LoginError(this.message): super._();

  final String message;
}

class Loading<T> extends Result<T> {
  Loading(): super._();
}