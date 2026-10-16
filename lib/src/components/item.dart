import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/separator.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/item.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/provider.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';

/// The variant of the [ShadItem].
enum ShadItemVariant { primary, outline, muted }

/// The size of the [ShadItem].
enum ShadItemSize { regular, sm }

/// The variant of the [ShadItemMedia].
enum ShadItemMediaVariant { primary, icon, image }

/// Returns the theme of the closest [ShadItem], or the primary item theme
/// when used outside of an item.
ShadItemTheme _itemTheme(BuildContext context) {
  return context.maybeWatch<ShadItemTheme>() ??
      ShadTheme.of(context).primaryItemTheme;
}

/// {@template ShadItem}
/// A versatile row to display content with media, a title, a description
/// and actions, styled according to the Shadcn UI design system.
///
/// The item expands to the width of its parent, so it must be placed in a
/// widget that provides a bounded width.
/// {@endtemplate}
class ShadItem extends StatefulWidget {
  /// {@macro ShadItem}
  const ShadItem({
    super.key,
    this.header,
    this.media,
    this.title,
    this.description,
    this.child,
    this.actions,
    this.footer,
    this.size,
    this.padding,
    this.gap,
    this.decoration,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.titleStyle,
    this.descriptionStyle,
    this.descriptionMaxLines,
    this.contentSpacing,
    this.cursor,
    this.textDirection,
    this.onPressed,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
  }) : variant = ShadItemVariant.primary;

  /// {@macro ShadItem}
  const ShadItem.outline({
    super.key,
    this.header,
    this.media,
    this.title,
    this.description,
    this.child,
    this.actions,
    this.footer,
    this.size,
    this.padding,
    this.gap,
    this.decoration,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.titleStyle,
    this.descriptionStyle,
    this.descriptionMaxLines,
    this.contentSpacing,
    this.cursor,
    this.textDirection,
    this.onPressed,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
  }) : variant = ShadItemVariant.outline;

  /// {@macro ShadItem}
  const ShadItem.muted({
    super.key,
    this.header,
    this.media,
    this.title,
    this.description,
    this.child,
    this.actions,
    this.footer,
    this.size,
    this.padding,
    this.gap,
    this.decoration,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.titleStyle,
    this.descriptionStyle,
    this.descriptionMaxLines,
    this.contentSpacing,
    this.cursor,
    this.textDirection,
    this.onPressed,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
  }) : variant = ShadItemVariant.muted;

  /// {@macro ShadItem}
  const ShadItem.raw({
    super.key,
    required this.variant,
    this.header,
    this.media,
    this.title,
    this.description,
    this.child,
    this.actions,
    this.footer,
    this.size,
    this.padding,
    this.gap,
    this.decoration,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.titleStyle,
    this.descriptionStyle,
    this.descriptionMaxLines,
    this.contentSpacing,
    this.cursor,
    this.textDirection,
    this.onPressed,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
  });

  /// {@template ShadItem.variant}
  /// The variant of the item, defaults to [ShadItemVariant.primary].
  /// {@endtemplate}
  final ShadItemVariant variant;

  /// {@template ShadItem.header}
  /// The widget displayed above the item content, spanning the full width
  /// of the item, usually a [ShadItemHeader].
  /// {@endtemplate}
  final Widget? header;

  /// {@template ShadItem.media}
  /// The widget displayed at the start of the item, usually a
  /// [ShadItemMedia].
  ///
  /// When a [description] is provided, the media is aligned to the top of
  /// the content, otherwise it is vertically centered.
  /// {@endtemplate}
  final Widget? media;

  /// {@template ShadItem.title}
  /// The title of the item, rendered inside a [ShadItemTitle].
  /// {@endtemplate}
  final Widget? title;

  /// {@template ShadItem.description}
  /// The description of the item, rendered inside a [ShadItemDescription].
  /// {@endtemplate}
  final Widget? description;

  /// {@template ShadItem.child}
  /// Additional content displayed below the [description].
  /// {@endtemplate}
  final Widget? child;

  /// {@template ShadItem.actions}
  /// The widget displayed at the end of the item, usually a
  /// [ShadItemActions].
  /// {@endtemplate}
  final Widget? actions;

  /// {@template ShadItem.footer}
  /// The widget displayed below the item content, spanning the full width
  /// of the item, usually a [ShadItemFooter].
  /// {@endtemplate}
  final Widget? footer;

  /// {@template ShadItem.size}
  /// The size of the item, defaults to [ShadItemSize.regular].
  /// {@endtemplate}
  final ShadItemSize? size;

  /// {@template ShadItem.padding}
  /// The padding of the item, defaults to `EdgeInsets.all(16)` for
  /// [ShadItemSize.regular] and
  /// `EdgeInsets.symmetric(horizontal: 16, vertical: 12)` for
  /// [ShadItemSize.sm].
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadItem.gap}
  /// The gap between the [media], the content and the [actions], and
  /// between the [header], the content and the [footer].
  ///
  /// Defaults to 16 for [ShadItemSize.regular] and 10 for [ShadItemSize.sm].
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadItem.decoration}
  /// The decoration of the item, merged with the theme decoration.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadItem.backgroundColor}
  /// The background color of the item.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadItem.hoverBackgroundColor}
  /// The background color of the item when hovered, only used when
  /// [onPressed] is not null.
  ///
  /// Defaults to `ShadColorScheme.accent` with 50% opacity.
  /// {@endtemplate}
  final Color? hoverBackgroundColor;

  /// {@macro ShadItemTitle.style}
  final TextStyle? titleStyle;

  /// {@macro ShadItemDescription.style}
  final TextStyle? descriptionStyle;

  /// {@macro ShadItemDescription.maxLines}
  final int? descriptionMaxLines;

  /// {@macro ShadItemContent.spacing}
  final double? contentSpacing;

  /// {@template ShadItem.cursor}
  /// The mouse cursor of the item when [onPressed] is not null, defaults to
  /// [SystemMouseCursors.click].
  /// {@endtemplate}
  final MouseCursor? cursor;

  /// {@template ShadItem.textDirection}
  /// The text direction of the item, defaults to the ambient
  /// [Directionality].
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template ShadItem.onPressed}
  /// Called when the item is tapped or activated with the keyboard.
  ///
  /// When null, the item is not interactive: it can't be focused and has no
  /// hover style.
  /// {@endtemplate}
  final VoidCallback? onPressed;

  /// {@template ShadItem.enabled}
  /// Whether the item is enabled, defaults to true.
  ///
  /// Only used when [onPressed] is not null.
  /// {@endtemplate}
  final bool enabled;

  /// {@macro ShadButton.focusNode}
  final FocusNode? focusNode;

  /// {@macro ShadButton.autofocus}
  final bool autofocus;

  /// {@macro ShadButton.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro ShadButton.onHoverChange}
  final ValueChanged<bool>? onHoverChange;

  /// {@macro ShadButton.statesController}
  final ShadStatesController? statesController;

  @override
  State<ShadItem> createState() => _ShadItemState();
}

class _ShadItemState extends State<ShadItem> {
  ShadStatesController? _statesController;
  FocusNode? _focusNode;

  ShadStatesController get statesController =>
      widget.statesController ?? _statesController!;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.statesController == null) {
      _statesController = ShadStatesController();
    }
    if (widget.focusNode == null) _focusNode = FocusNode();
    statesController.update(ShadState.disabled, !widget.enabled);
    focusNode.addListener(onFocusChange);
  }

  @override
  void didUpdateWidget(covariant ShadItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) {
      statesController.update(ShadState.disabled, !widget.enabled);
    }
    if (oldWidget.focusNode != null && widget.focusNode == null) {
      oldWidget.focusNode!.removeListener(onFocusChange);
      _focusNode?.dispose();
      _focusNode = FocusNode();
      focusNode.addListener(onFocusChange);
    }
    // The gesture detector is removed when the item stops being
    // interactive, so it can't report the pointer leaving anymore.
    if (oldWidget.onPressed != null && widget.onPressed == null) {
      statesController
        ..update(ShadState.hovered, false)
        ..update(ShadState.pressed, false);
    }
  }

  @override
  void dispose() {
    _statesController?.dispose();
    focusNode.removeListener(onFocusChange);
    _focusNode?.dispose();
    super.dispose();
  }

  void onFocusChange() {
    statesController.update(ShadState.focused, focusNode.hasFocus);
  }

  ShadItemTheme variantTheme(ShadThemeData theme) {
    return switch (widget.variant) {
      ShadItemVariant.primary => theme.primaryItemTheme,
      ShadItemVariant.outline => theme.outlineItemTheme,
      ShadItemVariant.muted => theme.mutedItemTheme,
    };
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);

    // Widget parameters are applied to the provided theme, so that the
    // building blocks (title, description, ...) can read them too.
    final itemTheme = variantTheme(theme).copyWith(
      titleStyle: widget.titleStyle,
      descriptionStyle: widget.descriptionStyle,
      descriptionMaxLines: widget.descriptionMaxLines,
      contentSpacing: widget.contentSpacing,
    );

    final effectiveSize = widget.size ?? itemTheme.size ?? ShadItemSize.regular;
    final effectivePadding =
        widget.padding ??
        itemTheme.padding ??
        switch (effectiveSize) {
          ShadItemSize.regular => const EdgeInsets.all(16),
          ShadItemSize.sm => const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        };
    final effectiveGap =
        widget.gap ??
        itemTheme.gap ??
        switch (effectiveSize) {
          ShadItemSize.regular => 16.0,
          ShadItemSize.sm => 10.0,
        };

    final effectiveDecoration = (itemTheme.decoration ?? const ShadDecoration())
        .merge(widget.decoration);
    final effectiveBackgroundColor =
        widget.backgroundColor ?? itemTheme.backgroundColor;
    final effectiveHoverBackgroundColor =
        widget.hoverBackgroundColor ??
        itemTheme.hoverBackgroundColor ??
        effectiveBackgroundColor;

    final hasDescription = widget.description != null;

    var media = widget.media;
    if (media != null && hasDescription) {
      // Like the web version, the media is aligned to the top of the content
      // and nudged down to line up with the title when there is a
      // description.
      media = Transform.translate(offset: const Offset(0, 2), child: media);
    }

    final hasContent =
        widget.title != null || hasDescription || widget.child != null;

    Widget? content;
    if (hasContent) {
      content = ShadItemContent(
        children: [
          if (widget.title != null) ShadItemTitle(child: widget.title!),
          if (hasDescription) ShadItemDescription(child: widget.description!),
          ?widget.child,
        ],
      );
    }

    // The media and the content are grouped, so that the media can be top
    // aligned to the content while the actions stay vertically centered.
    final main = Row(
      crossAxisAlignment: hasDescription
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      spacing: effectiveGap,
      children: [
        ?media,
        if (content != null) Expanded(child: content),
      ],
    );

    Widget item = Padding(
      padding: effectivePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: effectiveGap,
        children: [
          ?widget.header,
          Row(
            spacing: effectiveGap,
            children: [
              Expanded(child: main),
              ?widget.actions,
            ],
          ),
          ?widget.footer,
        ],
      ),
    );

    item = ShadProvider<ShadItemTheme>(
      data: itemTheme,
      notifyUpdate: (oldWidget) => oldWidget.data != itemTheme,
      child: item,
    );

    if (widget.textDirection != null) {
      item = Directionality(textDirection: widget.textDirection!, child: item);
    }

    if (widget.onPressed == null) {
      return ShadDecorator(
        decoration: effectiveDecoration.copyWith(
          color: effectiveBackgroundColor,
        ),
        child: item,
      );
    }

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.enter): onPressed,
        const SingleActivator(LogicalKeyboardKey.space): onPressed,
      },
      child: ValueListenableBuilder(
        valueListenable: statesController,
        builder: (context, states, child) {
          final hovered = states.contains(ShadState.hovered);
          final enabled = !states.contains(ShadState.disabled);

          return Semantics(
            container: true,
            button: true,
            focusable: enabled,
            enabled: enabled,
            child: ShadDisabled(
              disabled: !enabled,
              child: ShadFocusable(
                canRequestFocus: enabled,
                autofocus: widget.autofocus,
                focusNode: focusNode,
                onFocusChange: widget.onFocusChange,
                builder: (context, focused, child) => ShadDecorator(
                  decoration: effectiveDecoration.copyWith(
                    color: hovered
                        ? effectiveHoverBackgroundColor
                        : effectiveBackgroundColor,
                  ),
                  focused: focused,
                  child: child,
                ),
                child: child,
              ),
            ),
          );
        },
        child: ShadGestureDetector(
          behavior: HitTestBehavior.opaque,
          cursor: widget.cursor ?? itemTheme.cursor ?? SystemMouseCursors.click,
          onHoverChange: (value) {
            statesController.update(ShadState.hovered, value);
            widget.onHoverChange?.call(value);
          },
          onTap: onPressed,
          onTapDown: (_) => statesController.update(ShadState.pressed, true),
          onTapUp: (_) => statesController.update(ShadState.pressed, false),
          onTapCancel: () => statesController.update(ShadState.pressed, false),
          child: item,
        ),
      ),
    );
  }

  void onPressed() {
    if (!widget.enabled) return;
    widget.onPressed?.call();
  }
}

/// {@template ShadItemMedia}
/// The media of a [ShadItem], like an icon, an avatar or an image.
/// {@endtemplate}
class ShadItemMedia extends StatelessWidget {
  /// {@macro ShadItemMedia}
  const ShadItemMedia({
    super.key,
    required this.child,
  }) : variant = ShadItemMediaVariant.primary,
       size = null,
       iconSize = null,
       radius = null,
       backgroundColor = null,
       borderColor = null;

  /// Displays the [child] icon inside a bordered, muted square.
  const ShadItemMedia.icon({
    super.key,
    required this.child,
    this.size,
    this.iconSize,
    this.radius,
    this.backgroundColor,
    this.borderColor,
  }) : variant = ShadItemMediaVariant.icon;

  /// Displays the [child] image clipped inside a square.
  ///
  /// The [child] is sized to fill the square, so use `BoxFit.cover` on images
  /// to keep their aspect ratio.
  const ShadItemMedia.image({
    super.key,
    required this.child,
    this.size,
    this.radius,
  }) : variant = ShadItemMediaVariant.image,
       iconSize = null,
       backgroundColor = null,
       borderColor = null;

  /// {@macro ShadItemMedia}
  const ShadItemMedia.raw({
    super.key,
    required this.variant,
    required this.child,
    this.size,
    this.iconSize,
    this.radius,
    this.backgroundColor,
    this.borderColor,
  });

  /// {@template ShadItemMedia.variant}
  /// The variant of the media, defaults to [ShadItemMediaVariant.primary].
  /// {@endtemplate}
  final ShadItemMediaVariant variant;

  /// {@template ShadItemMedia.child}
  /// The content of the media.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadItemMedia.size}
  /// The size of the media square, defaults to 32 for
  /// [ShadItemMediaVariant.icon] and 40 for [ShadItemMediaVariant.image].
  /// {@endtemplate}
  final double? size;

  /// {@template ShadItemMedia.iconSize}
  /// The size of the icon of a [ShadItemMediaVariant.icon] media, defaults
  /// to 16.
  /// {@endtemplate}
  final double? iconSize;

  /// {@template ShadItemMedia.radius}
  /// The border radius of the media square, defaults to 4.
  /// {@endtemplate}
  final BorderRadius? radius;

  /// {@template ShadItemMedia.backgroundColor}
  /// The background color of a [ShadItemMediaVariant.icon] media.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadItemMedia.borderColor}
  /// The border color of a [ShadItemMediaVariant.icon] media.
  /// {@endtemplate}
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final itemTheme = _itemTheme(context);

    final effectiveRadius =
        radius ??
        itemTheme.mediaRadius ??
        const BorderRadius.all(Radius.circular(4));

    switch (variant) {
      case ShadItemMediaVariant.primary:
        return child;
      case ShadItemMediaVariant.icon:
        final effectiveSize = size ?? itemTheme.mediaIconContainerSize ?? 32;
        return SizedBox.square(
          dimension: effectiveSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color:
                  backgroundColor ??
                  itemTheme.mediaBackgroundColor ??
                  theme.colorScheme.muted,
              border: Border.all(
                color:
                    borderColor ??
                    itemTheme.mediaBorderColor ??
                    theme.colorScheme.border,
              ),
              borderRadius: effectiveRadius,
            ),
            child: Center(
              child: IconTheme.merge(
                data: IconThemeData(
                  size: iconSize ?? itemTheme.mediaIconSize ?? 16,
                ),
                child: child,
              ),
            ),
          ),
        );
      case ShadItemMediaVariant.image:
        final effectiveSize = size ?? itemTheme.mediaImageSize ?? 40;
        return SizedBox.square(
          dimension: effectiveSize,
          child: ClipRRect(
            borderRadius: effectiveRadius,
            child: child,
          ),
        );
    }
  }
}

/// {@template ShadItemContent}
/// Stacks the title, the description and any other content of a
/// [ShadItem] vertically.
/// {@endtemplate}
class ShadItemContent extends StatelessWidget {
  /// {@macro ShadItemContent}
  const ShadItemContent({
    super.key,
    required this.children,
    this.spacing,
  });

  /// {@template ShadItemContent.children}
  /// The widgets to stack vertically.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadItemContent.spacing}
  /// The vertical spacing between the title, the description and the rest of
  /// the content, defaults to 4.
  /// {@endtemplate}
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacing ?? _itemTheme(context).contentSpacing ?? 4,
      children: children,
    );
  }
}

/// {@template ShadItemTitle}
/// The title of a [ShadItem].
/// {@endtemplate}
class ShadItemTitle extends StatelessWidget {
  /// {@macro ShadItemTitle}
  const ShadItemTitle({
    super.key,
    required this.child,
    this.style,
  });

  /// {@template ShadItemTitle.child}
  /// The title widget, usually a [Text].
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadItemTitle.style}
  /// The text style of the title, defaults to `ShadTextTheme.small`.
  /// {@endtemplate}
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);

    return DefaultTextStyle.merge(
      style: style ?? _itemTheme(context).titleStyle ?? theme.textTheme.small,
      child: child,
    );
  }
}

/// {@template ShadItemDescription}
/// The description of a [ShadItem].
/// {@endtemplate}
class ShadItemDescription extends StatelessWidget {
  /// {@macro ShadItemDescription}
  const ShadItemDescription({
    super.key,
    required this.child,
    this.style,
    this.maxLines,
  });

  /// {@template ShadItemDescription.child}
  /// The description widget, usually a [Text].
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadItemDescription.style}
  /// The text style of the description, defaults to `ShadTextTheme.muted`.
  /// {@endtemplate}
  final TextStyle? style;

  /// {@template ShadItemDescription.maxLines}
  /// The maximum number of lines of the description, defaults to 2.
  /// {@endtemplate}
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final itemTheme = _itemTheme(context);

    return DefaultTextStyle.merge(
      style: style ?? itemTheme.descriptionStyle ?? theme.textTheme.muted,
      maxLines: maxLines ?? itemTheme.descriptionMaxLines ?? 2,
      overflow: TextOverflow.ellipsis,
      child: child,
    );
  }
}

/// {@template ShadItemActions}
/// The actions of a [ShadItem], like buttons, displayed in a row.
/// {@endtemplate}
class ShadItemActions extends StatelessWidget {
  /// {@macro ShadItemActions}
  const ShadItemActions({
    super.key,
    required this.children,
    this.spacing,
  });

  /// {@template ShadItemActions.children}
  /// The actions to display.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadItemActions.spacing}
  /// The spacing between the actions, defaults to 8.
  /// {@endtemplate}
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing ?? _itemTheme(context).actionsSpacing ?? 8,
      children: children,
    );
  }
}

/// {@template ShadItemHeader}
/// The header of a [ShadItem], displayed above the item content.
///
/// The children are spread across the full width of the item.
/// {@endtemplate}
class ShadItemHeader extends StatelessWidget {
  /// {@macro ShadItemHeader}
  const ShadItemHeader({
    super.key,
    required this.children,
    this.spacing,
  });

  /// {@template ShadItemHeader.children}
  /// The widgets to display in the header.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadItemHeader.spacing}
  /// The spacing between the children, defaults to 8.
  /// {@endtemplate}
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: spacing ?? _itemTheme(context).headerSpacing ?? 8,
      children: children,
    );
  }
}

/// {@template ShadItemFooter}
/// The footer of a [ShadItem], displayed below the item content.
///
/// The children are spread across the full width of the item.
/// {@endtemplate}
class ShadItemFooter extends StatelessWidget {
  /// {@macro ShadItemFooter}
  const ShadItemFooter({
    super.key,
    required this.children,
    this.spacing,
  });

  /// {@template ShadItemFooter.children}
  /// The widgets to display in the footer.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadItemFooter.spacing}
  /// The spacing between the children, defaults to 8.
  /// {@endtemplate}
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: spacing ?? _itemTheme(context).footerSpacing ?? 8,
      children: children,
    );
  }
}

/// {@template ShadItemGroup}
/// Groups multiple [ShadItem]s in a vertical list, optionally separated by
/// [ShadItemSeparator]s.
/// {@endtemplate}
class ShadItemGroup extends StatelessWidget {
  /// {@macro ShadItemGroup}
  const ShadItemGroup({
    super.key,
    required this.children,
    this.spacing,
  });

  /// {@template ShadItemGroup.children}
  /// The items of the group.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadItemGroup.spacing}
  /// The spacing between the items, defaults to 0.
  /// {@endtemplate}
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: spacing ?? 0,
      children: children,
    );
  }
}

/// {@template ShadItemSeparator}
/// A horizontal separator between the items of a [ShadItemGroup].
/// {@endtemplate}
class ShadItemSeparator extends StatelessWidget {
  /// {@macro ShadItemSeparator}
  const ShadItemSeparator({
    super.key,
    this.margin,
    this.thickness,
    this.color,
  });

  /// {@template ShadItemSeparator.margin}
  /// The margin of the separator, defaults to [EdgeInsets.zero].
  /// {@endtemplate}
  final EdgeInsetsGeometry? margin;

  /// {@macro ShadSeparator.thickness}
  final double? thickness;

  /// {@macro ShadSeparator.color}
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ShadSeparator.horizontal(
      margin: margin ?? EdgeInsets.zero,
      thickness: thickness,
      color: color,
    );
  }
}
