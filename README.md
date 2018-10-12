# iOS-calculator
An iOS command line calculator

- This is a project for [UTS](https://www.uts.edu.au) subject iOS Application Development.
- This project is finished developing, no plan for updates.
- It reads equation from command line and provides basic operation precedence with the [Precedence Climbing](https://eli.thegreenplace.net/2012/08/02/parsing-expressions-by-precedence-climbing) algorithm.
- The equation has to be in certain format, each operand is followed by an operator until the final operand, no equal sign needed.
- Use space to separate operators and operands.


## Detailed instructions as stated in subject requirements:

You are to prepare a macOS command-line tool that will act as a simple calculator. The calculator will be run from the command line and will only work with integer numbers and the following arithmetic operators: `+` `-` `x` `/` `%`. The `%` operator is the modulus operator, not percentage.

For example, if the program is compiled to `calc`, the following demonstrates how it will work

    ./calc 3 + 5 - 7
    1

In the command line, the arguments are a repeated sequence in the form

    number operator

and ending in a

    number

Hitting the enter key will cause the program to evaluate the arguments and print the result. In this case `1`.

The program must follow the usual rules of arithmetic which say:

1. The `x` `/` and `%` operators must all be evaluated before the `+` and `–` operators.
2. Operators must be evaluated from left to right.

For example, using Rule 1

> 2 + 4 x 3 – 6

becomes

> 2 + 12 – 6

which results in

> 8

If we did not use Rule 1 then `2 + 4 x 3 – 6` would become `6 x 3 – 6` and then `18 – 6` and finally `12`. This is an incorrect result.

If we do not use Rule 2 then the following illustrates how it can go wrong

> 4 x 5 % 2

Going from left to right we evaluate the `x` first, which reduces the expression to `20 % 2` which becomes `0`. If we evaluated the `%` first then the expression would reduce to `4 x 1` which becomes `4`. This is an incorrect result.

Remember, we are using integer mathematics when doing our calculations, so we get integer results when doing division. For example

    ./calc 20 / 3
    6

Also note that we can use the unary `+` and `–` operators. For example

    ./calc -5 / +2
    -2
    
    ./calc +2 - -2
    4

Your program must also check to make sure the command line arguments are valid. If not your program must generate an appropriate error message and then terminate with nonzero exit status.

You should also check for division by zero errors and numeric out-of-bounds errors.

As part of your program design, it is expected you will create classes to model the problem domain.
