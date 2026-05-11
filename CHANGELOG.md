## 0.2.0

### Breaking changes

- Renamed concrete class `DataError<T>` to `DataFailure<T>`. The `DataState.failure()` factory constructor is unchanged, but any code that pattern-matches directly on `DataError` (e.g. `is DataError`, `case DataError()`) must be updated to `DataFailure`.

### New features

- Added `PaginationMetadataX` extension on `PaginationMetadata` with `.skip`, `.limit`, and `.nextPage` convenience getters.

## 0.1.0

- Initial release.
- `Result<T>` sealed type with `Ok` and `Err` variants.
- `Failure` sealed type: `network`, `auth`, `server`, `unknown`, `validation`.
- `DataState<T>`, `ActionState<T>`, `PaginatedDataState<T>` async state machines.
- `PaginationMetadata` for paginated list state.
- `AsyncUseCase`, `AsyncUseCaseNoParams`, `SyncUseCase`, `SyncUseCaseNoParams` interfaces.
- `ApiGuard.run()` with abstract `ApiAdapter` interface.
- `DioAdapter` — bundled Dio implementation of `ApiAdapter`.