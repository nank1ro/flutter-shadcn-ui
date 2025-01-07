---
title: OrderPolicy
sidebar:
  order: 5
---

The **OrderPolicy** class handles the order of the items in a list.
It can be very useful to update the order of how items of a shadcn component are rendered.

For example to place the child of a button before the icon you can write:

```diff lang=dart
ShadButton(
  icon: const Icon(
    Icons.mail_outlined,
    size: 16,
  ),
+  orderPolicy: const WidgetOrderPolicy.reverse(),
  child: const Text('Login with Email'),
)
```

## LinearOrderPolicy

The default, keeps the order of the items as they are.

## ReverseOrderPolicy

Reverses the order of the items

## CustomOrderPolicy

A custom order policy, orders the items based on the provided indexes.
For example an indexes value of `2, 0, 1` will order the items as follows:
`last, first, second`
