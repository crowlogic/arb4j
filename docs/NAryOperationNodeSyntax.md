| Form | Operand binder (`name➔`) | Range spec | Example | Current implementation accepts? | Uniquely defined? | Parser rule / constraint |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| Operator (Π) | optional | named + braces | `Πk➔f(k){k=1…n}` | Yes (documented in `ProductNode`) | Yes | Range is parsed by `parseLimitSpecification()` as `{name=lower…upper}` (requires `=` and `…`). |
| Operator (Π) | optional | named + braces | `Πf(k){k=1…n}` | Yes (arrow is optional) | Yes | If arrow binder is absent, index name must come from the range name. |
| Operator (Π) | optional | named + no braces | `Πf(k)k=1…n` | **No (design spec)** | Yes | Even though `parseLimitSpecification()` can read without `{}`, the design spec forbids this form; operator form uses `{...}` for disambiguation. |
| Function form (`prod`) | present | **unnamed** range | `prod(k➔f(k),1…n)` | **No (today)**; **Must support (spec)** | Yes | Spec: allow range as `lower…upper` with no `name=`; index name is taken from arrow binder when present. |
| Function form (`prod`) | absent | **unnamed** range | `prod(f(k),1…n)` | **No (today)**; **Must support (spec)** | Yes | Spec: when no arrow binder is present, the index variable is inferred by the “first variable encountered becomes the independent variable” rule during operand compilation. |
| Function form (`prod`) | present | named range | `prod(k➔f(k),k=1…n)` | Yes (existing `functionForm` path expects comma before `parseLimitSpecification`) | Yes | Current: if `functionForm` is true, parser requires `,` then parses `name=lower…upper`; arrow name (if present) must match `name`. |
| Function form (`prod`) | absent | named range | `prod(f(k),k=1…n)` | Yes (range supplies the index name) | Yes | Current: index name is taken from the range name when arrow binder is absent. |

