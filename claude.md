# Flutter Recruitment Task — Claude Guidelines

## Project Architecture

This project follows **feature-first + clean architecture**.

### Folder structure

```
lib/
├── core/                          # Shared cross-cutting infrastructure
│   ├── di/                        # Dependency injection
│   │   ├── modules/               # @module classes for third-party / abstract deps
│   │   │   └── dio_module.dart    # Registers Dio + MovieApiClient
│   │   ├── injection.dart         # GetIt instance + configureDependencies()
│   │   └── injection.config.dart  # Auto-generated — do not edit
│   ├── error/                     # Shared failure types
│   │   └── failure.dart           # Sealed Failure hierarchy
│   ├── network/                   # Retrofit API client
│   │   └── movie_api_client.dart
│   └── router/                    # App-level routing
│       └── app_router.dart
│
├── shared/                        # Reusable code shared across features
│   ├── widgets/                   # Generic UI widgets (no feature-specific logic)
│   └── utils/                     # Extensions, formatters, helpers
│
└── features/                      # One sub-folder per feature
    ├── <feature>/
    │   ├── data/                  # Data layer
    │   │   ├── data_sources/      # Remote / local data sources
    │   │   ├── models/            # JSON models (with .g.dart in models/generated/)
    │   │   └── repositories/      # Repository implementations
    │   ├── domain/                # Domain layer (pure Dart, no Flutter/external deps)
    │   │   ├── entities/          # Domain entities
    │   │   ├── repositories/      # Abstract repository interfaces
    │   │   └── use_cases/         # Use cases / interactors
    │   └── presentation/          # Presentation layer
    │       ├── pages/             # Full-screen pages / routes
    │       └── widgets/           # Feature-specific widgets
    └── ...
```

### Layer rules

| Layer | Depends on | Must NOT depend on |
|---|---|---|
| `domain` | nothing | `data`, `presentation`, Flutter, external packages |
| `data` | `domain` | `presentation` |
| `presentation` | `domain` (via use cases) | `data` directly |
| `shared` | nothing | `features`, `core` |
| `core` | `shared` | `features` |

---

## Networking — Dio + Retrofit

HTTP is handled by **[Dio](https://pub.dev/packages/dio)** configured in `DioModule` and **[Retrofit](https://pub.dev/packages/retrofit)** for type-safe API definitions.

### Adding a new endpoint

1. Add the method to the appropriate `@RestApi` client in `lib/core/network/` (or create a new one for a different API).
2. Annotate with `@GET`, `@POST`, etc. and `@Query` / `@Path` / `@Body` parameters.
3. Run `dart run build_runner build --delete-conflicting-outputs`.

```dart
@RestApi()
abstract class MovieApiClient {
  factory MovieApiClient(Dio dio, {String baseUrl}) = _MovieApiClient;

  @GET('/3/search/movie')
  Future<MovieListModel> searchMovies(
    @Query('api_key') String apiKey,
    @Query('query') String query,
  );
}
```

Dio base URL and timeouts are configured in `lib/core/di/modules/dio_module.dart`.

---

## Error handling — dartz

Repository methods and use cases return `Future<Either<Failure, T>>` from **[dartz](https://pub.dev/packages/dartz)**.

- `Right(value)` / `right(value)` — success path
- `Left(failure)` / `left(failure)` — error path

### Failure hierarchy

All failures live in `lib/core/error/failure.dart`:

```dart
sealed class Failure { ... }
final class ServerFailure extends Failure { ... }   // DioException
final class UnknownFailure extends Failure { ... }  // catch-all
```

Add new failure subtypes here when needed.

### Repository pattern

```dart
@override
Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
  try {
    final result = await _dataSource.searchMovies(query);
    return right(result.results.map((m) => m.toEntity()).toList());
  } on DioException catch (e) {
    return left(ServerFailure(e.message ?? 'Server error'));
  } catch (e) {
    return left(UnknownFailure(e.toString()));
  }
}
```

### Consuming Either in the presentation layer

Use `.fold()` for exhaustive handling:

```dart
snapshot.data?.fold(
  (failure) => _buildError(failure.message),
  (movies)  => _buildMoviesList(movies),
);
```

> **Note:** `dartz` exports a `State` class that conflicts with Flutter's `State`.
> Always hide it: `import 'package:dartz/dartz.dart' hide State;`

---

## Dependency Injection — get_it + injectable

This project uses [get_it](https://pub.dev/packages/get_it) + [injectable](https://pub.dev/packages/injectable).

### Registering a dependency

| Annotation | Behaviour |
|---|---|
| `@injectable` | New instance on every resolution |
| `@singleton` | Single instance for the app lifetime |
| `@lazySingleton` | Single instance, created on first use |
| `@LazySingleton(as: Abstraction)` | Register impl under its abstract type |

After adding or changing annotations, regenerate:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Modules

When a dependency cannot be annotated directly (e.g. third-party classes), create an `@module` abstract class.

**Convention: all modules must be placed in `lib/core/di/modules/`.**

```dart
@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: 'https://api.example.com'));

  @singleton
  SomeApiClient apiClient(Dio dio) => SomeApiClient(dio);
}
```

### Resolving a dependency

```dart
import 'package:flutter_recruitment_task/core/di/injection.dart';

final myService = getIt<MyService>();
```

---

## Routing

All routes are defined in `lib/core/router/app_router.dart`. Use the named constants (`AppRouter.movieList`, etc.) instead of raw strings.

---

## Shared code

- **`shared/widgets/`** — stateless UI building blocks with no feature-specific logic.
- **`shared/utils/`** — extensions and formatters (e.g. `double.toRatingPercent()`).

Do **not** import from `features/` inside `shared/`.

---

## Code generation

The project uses `build_runner` for three generators. All `.g.dart` files are placed in a `generated/` sub-folder next to the source file (configured in `build.yaml`).

| Generator | Output |
|---|---|
| `json_serializable` | `models/generated/<model>.g.dart` |
| `retrofit_generator` | `network/generated/<client>.g.dart` |
| `injectable_generator` | `core/di/injection.config.dart` |

Use `part 'generated/<file>.g.dart';` in every source file that needs generated code.

Regenerate everything:

```bash
dart run build_runner build --delete-conflicting-outputs
```
