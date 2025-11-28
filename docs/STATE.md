# State Management Guide (Riverpod)

## Overview

This project uses **Riverpod** with **riverpod_generator** for type-safe, compile-time checked state management.

## Provider Types

### Basic Provider

For computed values or dependency injection:

```dart
@riverpod
ProductRepository productRepository(Ref ref) {
  final api = ref.watch(apiClientProvider);
  final db = ref.watch(appDatabaseProvider);
  return ProductRepositoryImpl(api, db);
}
```

### Future Provider

For async data fetching:

```dart
@riverpod
Future<List<Product>> products(Ref ref) async {
  final repository = ref.watch(productRepositoryProvider);
  final (failure, products) = await repository.getProducts();
  if (failure != null) throw failure;
  return products!;
}
```

### Stream Provider

For reactive data:

```dart
@riverpod
Stream<List<Product>> productsStream(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchProducts();
}
```

### Notifier Provider

For mutable state with methods:

```dart
@riverpod
class Cart extends _$Cart {
  @override
  CartState build() {
    return const CartState(items: [], total: 0);
  }

  void addItem(Product product, {int quantity = 1}) {
    final existingIndex = state.items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex >= 0) {
      final items = [...state.items];
      items[existingIndex] = items[existingIndex].copyWith(
        quantity: items[existingIndex].quantity + quantity,
      );
      state = state.copyWith(items: items);
    } else {
      state = state.copyWith(
        items: [...state.items, CartItem(product: product, quantity: quantity)],
      );
    }
    _updateTotal();
  }

  void removeItem(String productId) {
    state = state.copyWith(
      items: state.items.where((item) => item.product.id != productId).toList(),
    );
    _updateTotal();
  }

  void clear() {
    state = const CartState(items: [], total: 0);
  }

  void _updateTotal() {
    final total = state.items.fold<double>(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
    state = state.copyWith(total: total);
  }
}
```

### Async Notifier

For async mutable state:

```dart
@riverpod
class ProductList extends _$ProductList {
  @override
  Future<List<Product>> build() async {
    return _fetchProducts();
  }

  Future<List<Product>> _fetchProducts() async {
    final repository = ref.watch(productRepositoryProvider);
    final (failure, products) = await repository.getProducts();
    if (failure != null) throw failure;
    return products!;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchProducts());
  }

  Future<void> addProduct(Product product) async {
    final repository = ref.read(productRepositoryProvider);
    final (failure, created) = await repository.createProduct(product);
    
    if (failure != null) {
      // Handle error
      return;
    }
    
    // Update state with new product
    state = AsyncValue.data([...state.value ?? [], created!]);
  }
}
```

## Using Providers in Widgets

### ConsumerWidget

```dart
class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);

    return productsAsync.when(
      data: (products) => ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ProductCard(product: products[index]),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => ErrorWidget(error: error, onRetry: () {
        ref.invalidate(productsProvider);
      }),
    );
  }
}
```

### ConsumerStatefulWidget

```dart
class ProductFormPage extends ConsumerStatefulWidget {
  const ProductFormPage({super.key});

  @override
  ConsumerState<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends ConsumerState<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(controller: _nameController),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(productListProvider.notifier).addProduct(
        Product(
          id: uuid.v4(),
          name: _nameController.text,
          // ...
        ),
      );
    }
  }
}
```

### Hooks (with hooks_riverpod)

```dart
class ProductSearchPage extends HookConsumerWidget {
  const ProductSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState('');

    final products = ref.watch(productsProvider);
    final filteredProducts = products.whenData(
      (list) => list.where((p) => 
        p.name.toLowerCase().contains(searchQuery.value.toLowerCase())
      ).toList(),
    );

    return Column(
      children: [
        TextField(
          controller: searchController,
          onChanged: (value) => searchQuery.value = value,
          decoration: const InputDecoration(hintText: 'Search...'),
        ),
        Expanded(
          child: filteredProducts.when(
            data: (list) => ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) => ProductCard(product: list[i]),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (e, s) => Text('Error: $e'),
          ),
        ),
      ],
    );
  }
}
```

## Provider Modifiers

### Family (Parameterized Providers)

```dart
@riverpod
Future<Product> productById(Ref ref, String id) async {
  final repository = ref.watch(productRepositoryProvider);
  final (failure, product) = await repository.getProductById(id);
  if (failure != null) throw failure;
  return product!;
}

// Usage
final product = ref.watch(productByIdProvider('prod-123'));
```

### AutoDispose

By default, riverpod_generator creates autoDispose providers. To keep alive:

```dart
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}
```

## Ref Methods

### ref.watch

Subscribes to provider and rebuilds on changes:

```dart
final products = ref.watch(productsProvider);
```

### ref.read

One-time read, typically in callbacks:

```dart
onPressed: () {
  ref.read(cartProvider.notifier).addItem(product);
}
```

### ref.listen

Listen for changes and perform side effects:

```dart
ref.listen(authStateProvider, (previous, next) {
  if (next == null) {
    context.go('/login');
  }
});
```

### ref.invalidate

Force provider to refresh:

```dart
ref.invalidate(productsProvider);
```

## State Patterns

### Loading/Error/Data Pattern

```dart
@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.loaded(List<Product> products) = _Loaded;
  const factory ProductsState.error(Failure failure) = _Error;
}
```

### AsyncValue Pattern

```dart
productsAsync.when(
  data: (products) => ProductList(products: products),
  loading: () => const LoadingSpinner(),
  error: (error, stack) => ErrorDisplay(
    error: error,
    onRetry: () => ref.invalidate(productsProvider),
  ),
);
```

### Optimistic Updates

```dart
Future<void> deleteProduct(String id) async {
  // Save current state
  final previousState = state;
  
  // Optimistically update UI
  state = AsyncValue.data(
    state.value!.where((p) => p.id != id).toList(),
  );
  
  // Perform actual delete
  final repository = ref.read(productRepositoryProvider);
  final failure = await repository.deleteProduct(id);
  
  if (failure != null) {
    // Revert on error
    state = previousState;
    // Show error
  }
}
```

## Provider Organization

### Feature-based

```
features/
  product/
    presentation/
      providers/
        product_list_provider.dart
        product_form_provider.dart
        product_search_provider.dart
```

### Shared Providers

```
lib/
  providers/
    auth_provider.dart
    theme_provider.dart
    locale_provider.dart
```

## Code Generation

After creating/modifying providers, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Agent Instructions

When working with state:

1. **Use @riverpod annotation** - Let generator create providers
2. **Watch in build, read in callbacks** - Follow Riverpod rules
3. **Use AsyncValue for async data** - Handles loading/error states
4. **Keep providers focused** - One responsibility per provider
5. **Use families for parameterized data** - Pass IDs, filters, etc.
6. **Invalidate to refresh** - Use ref.invalidate() for manual refresh
7. **Use notifiers for mutable state** - Extend _$ProviderName
