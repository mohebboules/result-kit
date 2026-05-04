# result_kit

Typed results, async state machines, and a network guard layer for clean-architecture Dart & Flutter apps.

[![pub package](https://img.shields.io/pub/v/result_kit.svg)](https://pub.dev/packages/result_kit)

## Features

- **`Result<T>`** — typed success/failure without exceptions
- **`Failure`** — four semantic variants: `network`, `auth`, `server`, `unknown`
- **`DataState<T>`** — five-state machine for async data-fetching (initial → loading → success / empty / failure)
- **`ActionState<T>`** — four-state machine for async mutations (initial → loading → success / failure)
- **`PaginatedDataState<T>`** — paginated list state with load-more support
- **`ApiGuard`** — network-agnostic error guard with an `ApiAdapter` interface
- **`DioAdapter`** — bundled Dio implementation of `ApiAdapter`
- **Use-case interfaces** — `AsyncUseCase`, `AsyncUseCaseNoParams`, `SyncUseCase`, `SyncUseCaseNoParams`

---

## Installation

```yaml
dependencies:
  result_kit: ^0.1.0
```

---

## Usage

### Result\<T\>

Use `Result<T>` as a return type instead of throwing exceptions. Pattern-match with `when`, or use the
extension helpers.

```dart
Result<User> fetchUser(int id) {
  if (id <= 0) return const Result.err(Failure.unknown('Invalid id'));
  return Result.ok(User(id: id, name: 'Alice'));
}

final result = fetchUser(1);

// Pattern match
result.when(
  ok: (user) => print('Got ${user.name}'),
  err: (failure) => print('Error: ${failure.message}'),
);

// Extension helpers
if (result.isOk) print(result.valueOrNull);
if (result.isErr) print(result.failureOrNull?.message);

// Fold to a value
final label = result.fold(
  ok: (user) => user.name,
  err: (f) => 'Unknown',
);
```

---

### Failure

`Failure` is a sealed type with four variants. Use `FailureX.message` to get the message without
pattern-matching.

```dart
void handle(Failure failure) {
  switch (failure) {
    case NetworkFailure():
      showOfflineBanner();
    case AuthFailure():
      navigateToLogin();
    case ServerFailure():
    case UnknownFailure():
      showErrorSnackbar(failure.message);
  }
}
```

---

### DataState\<T\>

A five-state machine for async data-fetching in a repository or BLoC/Cubit.

```dart
// In your cubit / state notifier
Future<void> loadUsers() async {
  emit(const DataState.loading());

  final result = await _repo.getUsers();
  result.when(
    ok: (users) => emit(
      users.isEmpty ? const DataState.empty() : DataState.success(users),
    ),
    err: (failure) => emit(DataState.failure(failure)),
  );
}

// In your widget
switch (state) {
  case DataInitial() || DataLoading():
    return const CircularProgressIndicator();
  case DataSuccess(:final item):
    return UserList(users: item);
  case DataEmpty():
    return const Text('No users found.');
  case DataError(:final failure):
    return Text(failure.message);
}
```

Extension helpers let you skip pattern-matching for simple checks:

```dart
if (state.isLoading) showSpinner();
if (state.isFailure) showError(state.errorMessage);
final users = state.item; // T? — null when not success
```

---

### ActionState\<T\>

A four-state machine for mutations (create, update, delete). The success state optionally carries a
return value — pass `T = void` for fire-and-forget actions.

```dart
// Fire-and-forget delete
Future<void> deleteUser(int id) async {
  emit(const ActionState<void>.loading());

  final result = await _repo.deleteUser(id);
  result.when(
    ok: (_) => emit(const ActionState<void>.success()),
    err: (failure) => emit(ActionState.failure(failure)),
  );
}

// Action that returns a value
Future<void> createUser(String name) async {
  emit(const ActionState<User>.loading());

  final result = await _repo.createUser(name);
  result.when(
    ok: (user) => emit(ActionState.success(user)),
    err: (failure) => emit(ActionState.failure(failure)),
  );
}
```

Extension helpers:

```dart
if (state.isLoading) showSpinner();
if (state.isFailure) showError(state.errorMessage);
final createdUser = state.data; // T? — null when not success
```

---

### PaginatedDataState\<T\>

A five-state machine for paginated lists. The `success` state carries items, pagination metadata, and
an `isLoadingMore` flag for "load next page" UX.

```dart
Future<void> loadFirstPage() async {
  emit(const PaginatedDataState.loading());

  final result = await _repo.getUsers(page: 1);
  result.when(
    ok: (page) => emit(
      page.items.isEmpty
          ? const PaginatedDataState.empty()
          : PaginatedDataState.success(
              items: page.items,
              metadata: page.metadata,
            ),
    ),
    err: (failure) => emit(PaginatedDataState.failure(failure)),
  );
}

Future<void> loadNextPage() async {
  final current = state;
  if (!current.hasMore || current.isLoadingMore) return;

  // Flag "loading more" while keeping existing items visible
  emit(
    PaginatedDataState.success(
      items: current.items!,
      metadata: current.metadata!,
      isLoadingMore: true,
    ),
  );

  final result = await _repo.getUsers(page: current.metadata!.currentPage + 1);
  result.when(
    ok: (page) => emit(
      PaginatedDataState.success(
        items: [...current.items!, ...page.items],
        metadata: page.metadata,
      ),
    ),
    err: (failure) => emit(PaginatedDataState.failure(failure)),
  );
}
```

Extension helpers:

```dart
state.items         // List<T>? — null when not success
state.metadata      // PaginationMetadata? — null when not success
state.hasMore       // bool — true when metadata.hasNextPage is true
state.isLoadingMore // bool — true while fetching the next page
state.errorMessage  // String? — message when failure
```

---

### PaginationMetadata

Parse pagination metadata from a JSON response. Field names are configurable to match any backend.

```dart
// Default field names: page, limit, totalItems, totalPages
final meta = PaginationMetadata.fromJson(response.data as Map<String, dynamic>);

// Custom field names
final meta = PaginationMetadata.fromJson(
  response.data as Map<String, dynamic>,
  pageKey: 'pageNumber',
  limitKey: 'pageSize',
  totalItemsKey: 'total',
  totalPagesKey: 'pages',
);

meta.currentPage   // int
meta.itemsPerPage  // int
meta.totalItems    // int
meta.totalPages    // int
meta.hasNextPage   // bool
meta.hasPrevPage   // bool
```

---

### Network layer — ApiGuard & ApiAdapter

`ApiGuard.run` wraps any HTTP call, parses the response, and returns a `Result<T>`. It is
network-library agnostic — plug in any client by implementing `ApiAdapter`.

#### With DioAdapter (built-in)

```dart
final result = await ApiGuard.run(
  adapter: DioAdapter(() => dio.get('/users')),
  parser: (res) => (res.data as List)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList(),
);
```

#### Custom ApiAdapter

Implement `ApiAdapter` to connect any HTTP client:

```dart
class HttpAdapter implements ApiAdapter {
  const HttpAdapter(this._request);
  final Future<http.Response> Function() _request;

  @override
  Future<ApiResponse> execute() async {
    try {
      final res = await _request();
      return ApiResponse(statusCode: res.statusCode, data: jsonDecode(res.body));
    } on SocketException {
      throw ApiAdapterException(const Failure.network('No internet connection'));
    }
  }
}

// Usage
final result = await ApiGuard.run(
  adapter: HttpAdapter(() => http.get(Uri.parse('/users'))),
  parser: (res) => User.fromJson(res.data as Map<String, dynamic>),
);
```

---

### Use-case interfaces

Enforce a consistent call-site contract across your feature layer:

```dart
class GetUserUseCase implements AsyncUseCase<User, int> {
  const GetUserUseCase(this._repo);
  final UserRepository _repo;

  @override
  Future<Result<User>> call(int id) => _repo.getUser(id);
}

// Fire without params
class RefreshSessionUseCase implements AsyncUseCaseNoParams<void> {
  @override
  Future<Result<void>> call() => _authService.refresh();
}
```

Synchronous variants follow the same pattern but return `T` directly instead of `Future<Result<T>>`:

```dart
class ValidateEmailUseCase implements SyncUseCase<String?, String> {
  @override
  String? call(String email) {
    if (email.isEmpty) return 'Email is required';
    if (!email.contains('@')) return 'Invalid email';
    return null; // null = valid
  }
}

// No-params sync variant
class GetCachedTokenUseCase implements SyncUseCaseNoParams<String?> {
  @override
  String? call() => TokenStore.token;
}
```

---

## Customisation

### Custom error message extraction (DioAdapter)

Override how the error message is extracted from a non-2xx response body:

```dart
DioAdapter(
  () => dio.post('/login', data: body),
  messageExtractor: (data) {
    if (data is Map) return data['errorMessage'] as String?;
    return null;
  },
)
```

### Custom DioException mapping

Override the entire `DioException → Failure` mapping:

```dart
DioAdapter(
  () => dio.get('/profile'),
  failureMapper: (e) => switch (e.response?.statusCode) {
    401 || 403 => const Failure.auth('Access denied'),
    503 => const Failure.network('Service unavailable'),
    _ => Failure.server(e.message ?? 'Server error'),
  },
)
```

### Custom non-2xx handling (ApiGuard)

Override how non-2xx responses from any adapter are mapped to a `Failure`:

```dart
ApiGuard.run(
  adapter: adapter,
  parser: (res) => ...,
  onNonSuccess: (res) => switch (res.statusCode) {
    403 => const Failure.auth('Forbidden'),
    422 => Failure.server(_parseValidationErrors(res.data)),
    _ => Failure.server('HTTP ${res.statusCode}'),
  },
)
```

---

## Issues & contributions

File bugs and feature requests at the [GitHub issue tracker](https://github.com/mohebboules/result-kit/issues).
