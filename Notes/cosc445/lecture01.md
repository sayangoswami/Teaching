---
title: "Introduction to Algorithms"
lang: en
---

# Introduction to Algorithms


Algorithms are the ideas behind computer programs.

An algorithm is the thing which stays the same whether the program is in assembly language running on a supercomputer in New York or running on a cell phone in Kathmandu in Python!

To be interesting, an algorithm has to solve a general, specified problem.

An algorithmic problem is specified by describing the set of instances it must work on, and what desired properties the output must have.

  

Input: A sequence of $N$ numbers $a_{1} \dots a_{n}$

Output: the permutation (reordering) of the input sequence such as $a_{1} \leq a_{2} \leq a_{3} \dots \leq a_{n}$.

  

We seek algorithms which are _correct_ and _efficient_.

A faster algorithm running on a slower computer will _always_ win for sufficiently large instances, as we shall see.

Usually, problems don’t have to get that large before the faster algorithm wins.

  

For any algorithm, we must prove that it _always_ returns the desired output for all legal instances of the problem.

For sorting, this means even if (1) the input is already sorted, or (2) it contains repeated elements.

Algorithm correctness is not obvious in many optimization problems!

Algorithms _problems_ must be carefully specified to allow a provably correct algorithm to exist. We can find the “shortest tour” but not the “best tour”.

  

We need some way to express the sequence of steps comprising an algorithm.

In order of increasing precision, we have English, pseudocode, and real programming languages. Unfortunately, ease of expression moves in the reverse order.

I prefer to describe the _ideas_ of an algorithm in English, moving to pseudocode to clarify sufficiently tricky details of the algorithm.

  

  

  

Suppose you have a robot arm equipped with a tool, say a soldering iron. To enable the robot arm to do a soldering job, we must construct an ordering of the contact points, so the robot visits (and solders) the points in order.

We seek the order which minimizes the testing time (i.e. travel distance) it takes to assemble the circuit board.

![A bunch of dots arranged haphazardly]()

![A tour that connects the dots from the image above]()
  
You are given the job to program the robot arm. Give me an algorithm to find the most efficient tour!

  

A popular solution starts at some point $p_{0}$ and then walks to its nearest neighbor $p_{1}$ first, then repeats from $p_{1}$, etc. until done.

Pick and visit an initial point _p_0 
_p_ = _p_0
_i_ = 0
While there are still unvisited points
_i_ = _i_ + 1
Let _pi_ be the closest unvisited point to _pi__−_1
Visit _pi_
Return to _p_0 from _pi_

![A bunch of points arranged linearly and a tour that starts from the mid point]()

![A bunch of points arranged linearly and a tour that starts from the leftmost point]()

Starting from the leftmost point will not fix the problem.

  

Another idea is to repeatedly connect the closest pair of points whose connection will not cause a cycle or a three-way branch, until all points are in one tour.

Let _n_ be the number of points in the set For _i_ = 1 to _n_ _−_ 1 do
_d_ = _∞_
For each pair of endpoints (_x, y_) of partial paths If _dist_(_x, y_) _≤_ _d_ then
_xm_ = _x_, _ym_ = _y_, _d_ = _dist_(_x, y_)
Connect (_xm, ym_) by an edge Connect the two endpoints by an edge.
  

Although it works correctly on the previous example, other data causes trouble:

1 + e                                                                            1 + e

  

1 - e

  

1 - e

  

1 - e

  

1 - e

  

  

1 + e

  

(l)

  

1 + e

  

(r)

  

We could try all possible orderings of the points, then select the one which minimizes the total length:

_d_ = _∞_

For each of the _n_! permutations Π_i_ of the _n_ points If (_cost_(Π_i_) _≤_ _d_) then

_d_ = _cost_(Π_i_) and _Pmin_ = Π_i_

Return _Pmin_

Since all possible orderings are considered, we are guaranteed to end up with the shortest possible tour.

  

Because it tries all _n_! permutations, it is much too slow to use when there are more than 10-20 points.

No   efficient,   correct   algorithm   exists   for   the   _traveling salesman problem_, as we will see later.

  

  

  

A movie star wants to the select the maximum number of staring roles such that no two jobs require his presence at the same time.

  

Tarjan of the Jungle

The President’s Algorist             Steiner’s Tree

  

The Four Volume Problem

Process Terminated

  

"Discrete" Mathematics

  

Halting State                Programming Challenges

  

Calculated Bets

  

  

Input: A set _I_ of _n_ intervals on the line.

Output:     What   is   the   largest   subset   of   mutually   non-overlapping intervals which can be selected from _I_?

Give an algorithm to solve the problem!

  

![](file:////Users/sgoswami/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image009.jpg)Start working as soon as there is work available: EarliestJobFirst(I)

Accept the earlest starting job _j_ from _I_ which does not overlap any previously accepted job, and repeat until no more such jobs remain.

  

The first job might be so long (War and Peace) that it prevents us from taking any other job.

|   |
|---|
||
||![](file:////Users/sgoswami/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image010.jpg)|

  

  

Always take the shortest possible job, so you spend the least time working (and thus unavailable).

ShortestJobFirst(I)

While (_I_ _/_= _∅_) do

Accept the shortest possible job _j_ from _I_.

Delete _j_, and intervals which intersect _j_ from _I_.

  

Taking the shortest job can prevent us from taking two longer jobs which barely overlap it.

|   |
|---|
||
||![](file:////Users/sgoswami/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image012.jpg)|

  

  

![](file:////Users/sgoswami/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image009.jpg)Take the job with the earliest completion date: OptimalScheduling(I)

While (_I_ _/_= _∅_) do

Accept job _j_ with the earliest completion date.

Delete _j_, and whatever intersects _j_ from _I_.

  

Proof: Other jobs may well have started before the first to complete (say, _x_), but all must at least partially overlap both _x_ and each other.

Thus we can select at most one from the group.

The first these jobs to complete is _x_, so selecting any job but

_x_ would only block out more opportunties after _x_.

  

  

  

Searching for counterexamples is the best way to disprove the correctness of a heuristic.

•   Think about all small examples.

•   Think about examples with ties on your decision criteria (e.g. pick the nearest point)

•   Think about examples with extremes of big and small. . .

  

Failure to find a counterexample to a given algorithm does not mean “it is obvious” that the algorithm is correct.

Mathematical induction is a very useful method for proving the correctness of recursive algorithms.

Recursion and induction are the same basic idea: (1) basis case, (2) general assumption, (3) general case.

  

L_n_

_i_=1

  

_i_ = _n_(_n_ + 1)_/_2