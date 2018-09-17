primecount 4.4
May 9, 2018
Kim Walisch, <kim.walisch@gmail.com>

About primecount
================

  primecount is a command-line program that counts the number of
  primes below an integer x <= 10^31 using fast implementations of the
  prime counting function pi(x).

  Homepage: https://github.com/kimwalisch/primecount

Usage examples
==============

  Open a Command Prompt and run:

  # Count the primes below 10^14
  > primecount 1e14

  # Print progress and status information during computation
  > primecount 1e20 --status

  # Count primes using Meissel's algorithm
  > primecount 2**32 --meissel

  # Find the 10^14th prime using 4 threads
  > primecount 1e14 --nthprime --threads=4 --time

Command-line options
====================

  Usage: primecount x [OPTION]...
  Count the primes below x <= 10^31 using fast implementations of the
  combinatorial prime counting function.

  Options:

    -d,    --deleglise_rivat  Count primes using Deleglise-Rivat algorithm
           --legendre         Count primes using Legendre's formula
           --lehmer           Count primes using Lehmer's formula
    -l,    --lmo              Count primes using Lagarias-Miller-Odlyzko
    -m,    --meissel          Count primes using Meissel's formula
           --Li               Approximate pi(x) using the logarithmic integral
           --Li_inverse       Approximate the nth prime using Li^-1(x)
    -n,    --nthprime         Calculate the nth prime
    -p,    --primesieve       Count primes using the sieve of Eratosthenes
           --phi=<a>          phi(x, a) counts the numbers <= x that are
                              not divisible by any of the first a primes
           --Ri               Approximate pi(x) using Riemann R
           --Ri_inverse       Approximate the nth prime using Ri^-1(x)
    -s[N], --status[=N]       Show computation progress 1%, 2%, 3%, ...
                              [N] digits after decimal point e.g. N=1, 99.9%
           --test             Run various correctness tests and exit
           --time             Print the time elapsed in seconds
    -t<N>, --threads=<N>      Set the number of threads, 1 <= N <= CPU cores
    -v,    --version          Print version and license information
    -h,    --help             Print this help menu

  Advanced Deleglise-Rivat options:

    -a<N>, --alpha=<N>        Tuning factor, 1 <= alpha <= x^(1/6)
           --P2               Only compute the 2nd partial sieve function
           --S1               Only compute the ordinary leaves
           --S2_trivial       Only compute the trivial special leaves
           --S2_easy          Only compute the easy special leaves
           --S2_hard          Only compute the hard special leaves
