/// Interface for user data in the sidebar.
///
/// Represents user information that can be displayed in the sidebar footer
/// or header sections.
class ShadSidebarUser {
  /// Creates user data for display in the sidebar.
  ///
  /// Both [name] and [email] are required.
  /// [avatar] is an optional avatar image URL or path.
  const ShadSidebarUser({
    required this.name,
    required this.email,
    this.avatar,
  });

  /// The user's display name.
  final String name;

  /// The user's email address.
  final String email;

  /// Optional avatar image URL or path.
  final String? avatar;
}
