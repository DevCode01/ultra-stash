# Ultra Stash

**Zig** · **v0.1.0**

_Fibonacci sequence printer with configurable term count_

---

## Features

- Prints N terms of the Fibonacci sequence
- 64-bit arithmetic for large terms
- Zero external dependencies

## Installation

```bash
git clone https://github.com/DevCode01/ultra-stash.git
cd ultra-stash
```

## Usage

```bash
zig build run -- 20
```

## How it works

Prints the first N Fibonacci numbers (u64 arithmetic) using Zig's 0.16 buffered stdout writer. The count defaults to 10.

## Options

- `N` - number of terms (default 10)
- run with `zig build run -- <N>`

## Example

```bash
$ zig build run -- 15
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377
```

## Testing

```bash
bash tests/run.sh
```

Includes a functional check against real captured output, plus the build/syntax check.

## License

MIT
