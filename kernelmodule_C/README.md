# Linux kernel module in C

## Quickstart

You will need `make`, `clang` and `lldb` installed. 
These are present by default on macOS, and on Ubuntu can be installed with
`sudo apt install clang lldb`.

```shell
# Clone the repo, download a zip, or run...
; mkdir my-c-project && cd my-c-project
; npx degit neoeno/toy-c-project-template

# Check `make`, `clang` and `lldb` are installed
; make check

# To build and run `src/main.c`
; make run

# To run the tests in `src/test.c`
; make test

# To start `src/main.c` in the debugger
; make debug

# To start `src/test.c` in the debugger
; make debug-test
```

## How to write code
The project is structured as three files:

* `src/main.c`, whose `main` function gets run as the executable, and should probably mostly call functions in `lib.c`.
* `src/lib.c` where most of your implementation code should go.
* `src/test.c`, whose `main` function gets run as the tests.

My suggested workflow is:

* Add functions to `lib.c`, verifying with tests in `test.c`.
* Add code to `main.c` which calls functions in `lib.c`.

## Tests
This project uses a very basic set of C macros to facilitate tests. You can see
examples of this in `src/test.c`.

## Credits
This beautiful [template](https://github.com/neoeno/toy-c-project-template) is from Kay Lack. It prioritises having the fewest elements and easiest setup. As a result, it cuts a few corners that you probably wouldn't want to cut in a professional C project. It kind of works out for this project's needs.
