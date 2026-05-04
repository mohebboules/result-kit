// ignore_for_file: avoid_print
//
// Demonstrates all result_kit primitives using a generic "posts" domain.
//
// Run with: dart run example/result_kit_example.dart

import 'package:result_kit/result_kit.dart';

// ─── Domain model ─────────────────────────────────────────────────────────────

class Post {
  const Post({required this.id, required this.title, required this.body});
  final int id;
  final String title;
  final String body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'] as int,
    title: json['title'] as String,
    body: json['body'] as String,
  );

  @override
  String toString() => 'Post(id: $id, title: "$title")';
}

class CreatePostParams {
  const CreatePostParams({required this.title, required this.body});
  final String title;
  final String body;
}

// ─── Repository interface ──────────────────────────────────────────────────────

abstract interface class PostRepository {
  Future<Result<List<Post>>> getPosts({int page = 1, int limit = 10});
  Future<Result<Post>> getPost(int id);
  Future<Result<Post>> createPost(CreatePostParams params);
  Future<Result<void>> deletePost(int id);
}

// ─── Use cases ────────────────────────────────────────────────────────────────

/// Sync use case — validates a post title before any network call is made.
class ValidatePostTitleUseCase implements SyncUseCase<String?, String> {
  @override
  String? call(String title) {
    if (title.trim().isEmpty) return 'Title is required';
    if (title.length > 120) return 'Title must be 120 characters or fewer';
    return null; // null = valid
  }
}

/// Async use case that guards with client-side validation before calling the repo.
class CreatePostUseCase implements AsyncUseCase<Post, CreatePostParams> {
  const CreatePostUseCase(this._repo);
  final PostRepository _repo;

  @override
  Future<Result<Post>> call(CreatePostParams params) async {
    final titleError = ValidatePostTitleUseCase().call(params.title);
    if (titleError != null) {
      return Result.err(Failure.validation(titleError));
    }
    return _repo.createPost(params);
  }
}

class GetPostsUseCase implements AsyncUseCaseNoParams<List<Post>> {
  const GetPostsUseCase(this._repo);
  final PostRepository _repo;

  @override
  Future<Result<List<Post>>> call() => _repo.getPosts();
}

class GetPostUseCase implements AsyncUseCase<Post, int> {
  const GetPostUseCase(this._repo);
  final PostRepository _repo;

  @override
  Future<Result<Post>> call(int id) => _repo.getPost(id);
}

class DeletePostUseCase implements AsyncUseCase<void, int> {
  const DeletePostUseCase(this._repo);
  final PostRepository _repo;

  @override
  Future<Result<void>> call(int id) => _repo.deletePost(id);
}

// ─── Production repository (ApiGuard + DioAdapter) ───────────────────────────
//
// Replace _StubPostRepository below with this in a real app:
//
// import 'package:dio/dio.dart';
//
// class RemotePostRepository implements PostRepository {
//   const RemotePostRepository(this._dio);
//   final Dio _dio;
//
//   @override
//   Future<Result<List<Post>>> getPosts({int page = 1, int limit = 10}) =>
//       ApiGuard.run(
//         adapter: DioAdapter(
//           () => _dio.get('/posts', queryParameters: {'page': page, 'limit': limit}),
//         ),
//         parser: (res) =>
//             (res.data as List).map((e) => Post.fromJson(e as Map<String, dynamic>)).toList(),
//       );
//
//   @override
//   Future<Result<Post>> getPost(int id) => ApiGuard.run(
//     adapter: DioAdapter(() => _dio.get('/posts/$id')),
//     parser: (res) => Post.fromJson(res.data as Map<String, dynamic>),
//   );
//
//   @override
//   Future<Result<Post>> createPost(CreatePostParams params) => ApiGuard.run(
//     adapter: DioAdapter(
//       () => _dio.post('/posts', data: {'title': params.title, 'body': params.body}),
//     ),
//     parser: (res) => Post.fromJson(res.data as Map<String, dynamic>),
//   );
//
//   @override
//   Future<Result<void>> deletePost(int id) => ApiGuard.run(
//     adapter: DioAdapter(() => _dio.delete('/posts/$id')),
//     parser: (_) {},
//   );
// }

// ─── Stub repository (used by this example) ───────────────────────────────────

class _StubPostRepository implements PostRepository {
  @override
  Future<Result<List<Post>>> getPosts({int page = 1, int limit = 10}) async => const Result.ok([
    Post(id: 1, title: 'Getting started', body: 'Welcome to result_kit.'),
    Post(id: 2, title: 'Typed results', body: 'No more try/catch everywhere.'),
  ]);

  @override
  Future<Result<Post>> getPost(int id) async {
    if (id == 99) return const Result.err(Failure.server('Post not found'));
    return Result.ok(Post(id: id, title: 'Post $id', body: 'Body of post $id'));
  }

  @override
  Future<Result<Post>> createPost(CreatePostParams params) async =>
      Result.ok(Post(id: 42, title: params.title, body: params.body));

  @override
  Future<Result<void>> deletePost(int id) async => const Result.ok(null);
}

// ─── Example flows ────────────────────────────────────────────────────────────

void _showResult(Result<Post> result) {
  result.when(
    ok: (post) => print('  ok: $post'),
    err: (failure) => print('  err: ${failure.message}'),
  );
}

Future<void> _demoResult(PostRepository repo) async {
  print('\n=== Result<T> ===');

  final ok = await GetPostUseCase(repo).call(1);
  _showResult(ok);

  final err = await GetPostUseCase(repo).call(99);
  _showResult(err);

  // Extension helpers
  print('  isOk=${ok.isOk}  valueOrNull=${ok.valueOrNull}');
  print('  isErr=${err.isErr}  failureOrNull=${err.failureOrNull?.message}');

  // fold to a value
  final label = ok.fold(ok: (p) => p.title, err: (f) => 'error: ${f.message}');
  print('  fold → "$label"');
}

Future<void> _demoDataState(PostRepository repo) async {
  print('\n=== DataState<T> ===');

  // In a Cubit / StateNotifier:  emit(const DataState.loading());
  var state = const DataState<List<Post>>.loading();
  print('  loading: isLoading=${state.isLoading}');

  final result = await GetPostsUseCase(repo).call();
  result.when(
    ok: (posts) {
      state = posts.isEmpty ? const DataState.empty() : DataState.success(posts);
    },
    err: (f) {
      state = DataState.failure(f);
    },
  );

  print('  success: isSuccess=${state.isSuccess}  items=${state.item?.length}');
  print('  errorMessage=${state.errorMessage}');
}

Future<void> _demoActionState(PostRepository repo) async {
  print('\n=== ActionState<T> ===');

  // Validation failure — produced before the network call
  var createState = const ActionState<Post>.loading();
  final invalidResult = await CreatePostUseCase(repo).call(
    const CreatePostParams(title: '', body: 'Some body'),
  );
  invalidResult.when(
    ok: (post) => createState = ActionState.success(post),
    err: (failure) => createState = ActionState.failure(failure),
  );

  print('  createState after empty title: isFailure=${createState.isFailure}');
  final f = createState.failure!;
  switch (f) {
    case ValidationFailure():
      print('  validation error → ${f.message}');
    case NetworkFailure():
      print('  offline');
    case AuthFailure():
      print('  not authenticated');
    case ServerFailure():
    case UnknownFailure():
      print('  server/unknown → ${f.message}');
  }

  // Success — returns a value
  final validResult = await CreatePostUseCase(repo).call(
    const CreatePostParams(title: 'My new post', body: 'Hello world'),
  );
  validResult.when(
    ok: (post) => createState = ActionState.success(post),
    err: (failure) => createState = ActionState.failure(failure),
  );
  print('  createState after valid input: isSuccess=${createState.isSuccess}');
  print('  created post: ${createState.data}');

  // Fire-and-forget delete (T = void)
  var deleteState = const ActionState<void>.loading();
  final deleteResult = await DeletePostUseCase(repo).call(1);
  deleteResult.when(
    ok: (_) => deleteState = const ActionState<void>.success(),
    err: (failure) => deleteState = ActionState.failure(failure),
  );
  print('  delete isSuccess=${deleteState.isSuccess}');
}

void _demoPaginationMetadata() {
  print('\n=== PaginationMetadata ===');

  final meta = PaginationMetadata.fromJson({
    'page': 2,
    'limit': 10,
    'totalItems': 55,
    'totalPages': 6,
  });

  print(
    '  page=${meta.currentPage}/${meta.totalPages}  '
    'hasNext=${meta.hasNextPage}  hasPrev=${meta.hasPrevPage}',
  );

  // Custom field names
  final customMeta = PaginationMetadata.fromJson(
    {'pageNumber': 1, 'pageSize': 20, 'total': 40, 'pages': 2},
    pageKey: 'pageNumber',
    limitKey: 'pageSize',
    totalItemsKey: 'total',
    totalPagesKey: 'pages',
  );
  print('  custom keys → page=${customMeta.currentPage}  totalItems=${customMeta.totalItems}');
}

// ─── Main ──────────────────────────────────────────────────────────────────────

Future<void> main() async {
  final repo = _StubPostRepository();

  await _demoResult(repo);
  await _demoDataState(repo);
  await _demoActionState(repo);
  _demoPaginationMetadata();
}
