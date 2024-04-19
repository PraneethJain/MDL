#set text(font: "Roboto")
#show link: set text(rgb(0, 0, 255))

#set page(
  header: [Moida Praneeth Jain #h(1fr) 2022101093 #line(start: (-10%, 0%), end: (110%, 0%))], footer: [#line(start: (-10%, 0%), end: (110%, 0%))
    Machine, Data and Learning
    #h(1fr)
    #counter(page).display("1 of 1", both: true)
    #h(1fr)
    Assignment 3 ], margin: (x: 1.5cm),
)

== Question 2
*Given*:
- Heads probability $p$
- Tails probability $1-p$
- Even number of heads after n tosses probability $q_n$

*To Find*: $q_n$

*Solution*

If after $n-1$ tosses we get even number of heads, we require a tail for even
number of heads after $n$ tosses. If we get an odd number of heads, we require a
head for even number of heads. Thus, we get the recurrence relation

$ q_n = (1-p)q_(n-1) + p(1-q_(n-1)), "with" q_1 = 1 - p $
Now, we solve this recurrence relation
$ q_n = (1-2p)q_(n-1) + p $
$ (1-2p)q_(n-1) = (1-2p)^2q_(n-2) + (1-2p)p $
$ (1-2p)^2 q_(n-2) = (1-2p)^3q_(n-3) + (1-2p)^2 p $
$ dots.v $
$ (1-2p)^(n-2) q_2 = (1-2p)^(n-1)q_1 + (1-2p)^(n-2)p $

On adding the above equations, we get
$ q_n = (1-2p)^(n-1)q_1 + p(1 + (1-2p) + (1-2p)^2 + dots + (1-2p)^(n-2)) $
$ q_n = (1-2p)^(n-1)(1-p) + p((1-2p)^(n-1)-1)/(1-2p - 1) $
$ q_n = (1-2p)^(n-1) - (1-2p)^(n-1) p + 1/2 - (1-2p)^(n-1)/2 $
$ q_n = (1-2p)^(n-1)/2 - (1-2p)^(n-1)p + 1/2 $
$ q_n = (1-2p)^(n-1)(1-2p)/2 + 1/2 $
$ q_n = (1+(1-2p)^n)/2 $

This is the required formula.