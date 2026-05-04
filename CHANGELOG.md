## 0.1.0

- Initial release.
- `Result<T>` sealed type with `Ok` and `Err` variants.
- `Failure` sealed type: `network`, `auth`, `server`, `unknown`.
- `DataState<T>`, `ActionState<T>`, `PaginatedDataState<T>` async state machines.
- `PaginationMetadata` for paginated list state.
- `AsyncUseCase`, `AsyncUseCaseNoParams`, `SyncUseCase`, `SyncUseCaseNoParams` interfaces.
- `ApiGuard.run()` with abstract `ApiAdapter` interface.
- `DioAdapter` — bundled Dio implementation of `ApiAdapter`.