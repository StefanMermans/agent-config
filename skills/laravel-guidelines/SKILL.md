---
name: laravel-guidelines
description: When dealing with a Laravel project, these guidelines must always be followed.
---

# Laravel Guidelines

This document outlines best practices for building robust, maintainable, and modern Laravel applications. Focus is placed on clean architecture, efficient database usage, and reliable testing strategies.

## 1. General Principles

-   **Correctness > Clarity > Consistency > Performance > Cleverness**.
-   **KISS**: Keep It Simple, Stupid. Avoid over-engineering.
-   **DRY (Don't Repeat Yourself)**: Extract shared logic but be pragmatic. Duplication is cheaper than the wrong abstraction.
-   **SOLID**: Adhere to SOLID principles, with particular emphasis on **Single Responsibility (SRP)** in classes and methods.

## 2. Modern PHP Features

Leverage modern PHP features (8.1/8.2+) for cleaner, more expressive code:

-   **Constructor Property Promotion**: Reduce boilerplate in DTOs and Services.
-   **Readonly Properties**: Ensure immutability for value objects and DTOs.
-   **Enums**: Use backed Enums for status fields and categories instead of constants or magic strings.
-   **Match Expressions**: Use `match` instead of complex `switch` or `if/else` chains.
-   **Named Arguments**: improve readability for functions with many parameters (though prefer refactoring to parameter objects/DTOs if too many).

## 3. Architecture

### Controllers
-   **Keep Thin**: Controllers should only handle HTTP concerns (validation, request parsing, response formatting).
-   **Delegate Logic**: Business logic differs from HTTP logic. Delegate complex operations to **Services** or **Actions**.
-   **Response Consistency**: Ensure successful responses and error responses follow a consistent structural pattern across the API.

### Services (Actions)
-   **Single Responsibility (SRP)**: A Service or Action should typically do **one thing well**. avoid "Manager" classes that become god-objects.
    -   *Good*: `CreateUserAction`, `ProcessPaymentService`.
    -   *Bad*: `UserService` (handling creation, deletion, reporting, notification, etc.).
-   **Stateless**: Services should generally be stateless. Pass data via method arguments.
-   **Dependency Injection**: Inject dependencies via the constructor.

### Validation (Form Requests)
-   **Always use Form Requests**: Do not validate in the controller.
-   **Type Hinting**: Type-hint the Form Request in the controller method.
-   **Business Rules**: Simple business rules (e.g., "email must be unique") belong in Form Requests. Complex state-dependent rules belong in the Service/Action.
-   **Authorization**: Use the `authorize()` method in Form Requests for basic request authorization.

## 4. Eloquent & Database (Deep Dive)

### Queries & Performance
-   **Strict Mode**: Enable Eloquent Strict Mode in non-production environments to prevent lazy loading, unfillable attribute assignments, and accessing missing attributes.
    ```php
    // AppServiceProvider.php
    Model::shouldBeStrict(!app()->isProduction());
    ```
-   **Eager Loading**: Prevent N+1 problems by eager loading relationships using `with()`.
    ```php
    // Bad
    $users = User::all();
    foreach ($users as $user) { echo $user->profile->name; } // N+1 query
    
    // Good
    $users = User::with('profile')->get();
    ```
-   **Select Specific Columns**: When querying large tables, select only necessary columns to reduce memory usage.
    ```php
    User::select('id', 'name', 'email')->get();
    ```
-   **Chunking**: Use `chunk()` or `cursor()` for initializing heavy processing on large datasets to keep memory usage low.

### Scopes
-   **Local Scopes**: Encapsulate common query logic into reusable local scopes. Naming should be readable and expressive.
    ```php
    // Model
    public function scopeActive(Builder $query): void {
        $query->where('is_active', true);
    }
    
    // Usage
    User::active()->get();
    ```
-   **Global Scopes**: Use sparingly. They apply to *all* queries on the model and can lead to unexpected behavior if hidden implementation details are forgotten.

### Observers
-   **Use with Caution**: Observers are "magic" and hidden from the code flow, making debugging difficult.
-   **Explicit Registration**: Prefer using the `#[ObservedBy(UserObserver::class)]` attribute on the Model to make the connection explicit and less "magic".
-   **Single Responsibility**: Observers should adhere to SRP. Do not create a single Observer for all events; separate them if the logic is distinct.
-   **Prefer explicit calls**: For critical logic, explicit calls (e.g., firing an Event from a Service) are often better than Observers.
-   **Appropriate Use Cases**: Cache clearing, simple logging, or generating slugs/metadata where the operation is strictly tied to the database record lifecycle and not complex business logic.

### Fillable vs. Guarded
-   **Use `$fillable`**: Explicitly strictly define which attributes can be mass-assigned. This is a security feature.
-   **Avoid `$guarded = []`**: While convenient, unguarding models globally opens up Mass Assignment Vulnerabilities if `all()` is passed from requests.

### Updating Patterns
-   **Atomic Updates**: Use `update()` for simple updates based on validated data.
    ```php
    $user->update($validatedData);
    ```
-   **Explicit Property Setting**: For complex logic, set properties explicitly then call `save()`. This makes changes tracked and explicit.
    ```php
    $user->status = UserStatus::Active;
    $user->activated_at = now();
    $user->save();
    ```
-   **Mass Updates**: Use `update()` on a query builder relative to a scope for efficient bulk updates.
    -   *Warning*: This will **not** trigger Eloquent events or Observers. If you need side effects, you must trigger them manually or iterate (which is slower).
    ```php
    User::active()->where('last_login', '<', now()->subYear())->update(['status' => 'archived']);
    ```

### Enums & Casting
-   **Cast Enums**: Use native PHP Backed Enums for attribute casting.
    ```php
    protected $casts = [
        'status' => UserStatus::class,
    ];
    ```
-   This ensures type safety and prevents invalid states from entering the application logic.

### Pruning
-   **Prunable Trait**: Use the `Prunable` or `MassPrunable` trait for models that need periodic cleanup (e.g., logs, tokens). Define the `prunable()` query builder method to automate deletion logic.

## 5. Security (Authorization)

-   **Policies**: Use Policies for all resource-based authorization.
    -   Create one policy per Model (e.g., `UserPolicy`, `PostPolicy`).
    -   Register them in `AuthServiceProvider` (usually auto-discovered).
-   **Gates**: Use Gates for simple, non-resource-specific actions (e.g., `Gate::define('access-dashboard', ...)`).
-   **Controller Authorization**: Use `$this->authorize()` (or `Gate::authorize()`) in controller methods, or middleware for route groups. Do **not** rely solely on UI hiding; backend verification is mandatory.

## 6. Testing

-   **AAA Pattern**: Structure all tests using **Arrange, Act, Assert**.
    ```php
    public function test_user_can_register() {
        // Arrange
        $data = ['name' => 'John', 'email' => 'john@example.com', 'password' => 'secret'];
        
        // Act
        $response = $this->post('/register', $data);
        
        // Assert
        $response->assertStatus(201);
        $this->assertDatabaseHas('users', ['email' => 'john@example.com']);
    }
    ```
-   **Factories**: Use specific factories for setting up strict state.
    -   Use `state()` methods for variations (e.g., `User::factory()->admin()->create()`).
    -   Avoid massive manual creation of dependencies.
-   **Faking**: Use Laravel's fakes for external services to keep tests fast and deterministic.
    -   `Mail::fake()`, `Event::fake()`, `Notification::fake()`, `Queue::fake()`.
    -   Assert against the fakes to verify interaction.
-   **Runner Agnostic**: Write tests that run compatibly with standard PHPUnit configuration.

---
**Note**: This guideline is a living document. Evolve it as the project matures and team patterns stabilize.
