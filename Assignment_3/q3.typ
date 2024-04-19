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

== Question 3

=== (a)
*Given*: $P("one engine failing") = 0.01$

*To Find*: $P("both engines failing")$

*Solution*:

Since the two engines operate independently, we have
$ P(A and B) = P(A) P(B) $
$ P("both engines failing") = P("one engine failing")^2 $
$ P("both engines failing") = 0.01^2 $
$ P("both engines failing") = 0.0001 = 0.01% $

$therefore 0.01%$ is the chance that the plane will fail to complete a four-hour
flight to Oklohoma due to engine failure.

=== (b)
*To Find*: $P("atlest 2 people having same birthday in 30 people")$

*Solution*:

We know that $ P("atleast 2 people having same birthday") = 1 - P("everyone has unique birthday") $
Now, to find the probability of $30$ people having unique birthdays, we need to
choose 30 unique days from 365 days
$ P("everyone has unique birthday") = mat(365;30)/365^30 $
$ P("everyone has unique birthday") = 0.2936837572807312 $

$ P("atleast 2 people having same birthday") = 1 - 0.2936837572807312 $
$ P("atleast 2 people having same birthday") = 0.7063162427192688 $

$therefore 70.6%$ is the probability that atleast two people have the same
birthday in a room of 30 people.