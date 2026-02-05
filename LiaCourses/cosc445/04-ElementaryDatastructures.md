
<!--
author:   Sayan Goswami
email:	sgoswami@smcm.edu
version:  0.1.0
language: en
narrator: US English Female

comment: Elementary Datastructures

link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Next:ital,wght@0,200..800;1,200..800&family=Atkinson+Hyperlegible:ital,wght@0,400;0,700;1,400;1,700&display=swap

link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Mono:ital,wght@0,200..800;1,200..800&family=Atkinson+Hyperlegible:ital,wght@0,400;0,700;1,400;1,700&display=swap

link: https://cdn.jsdelivr.net/gh/sayangoswami/Teaching@main/LiaCourses/theme.css

import: https://raw.githubusercontent.com/sayangoswami/lia-annotate/main/README.md

-->

## Question

Prove the following: 
$$
1 + r + r^{2} + \dots r^{n-1} = \frac{1-r^n}{1-r}
$$




# Elementary Datastructures


## Elementary Datastructures


Elementary data structures such as stacks, queues, lists, and heaps are the “off-the-shelf” components we build our algorithm from.

There are two aspects to any data structure:

- The abstract operations which it supports.

- The implementation of these operations.



## Data Abstraction


That we can describe the behavior of our data structures in terms of abstract operations is why we can use them without thinking.

- `Push(x,s)` – Insert item `x` at the top of stack s.

- `Pop(s)` – Return (and remove) the top item of stack `s`.

That there are different implementations of the same abstract operations enables us to optimize performance in difference circumstances.


## Contiguous vs Linked Datastructures


Data structures can be neatly classified as either contiguous or linked depending upon whether they are based on arrays or references:

- Contiguously-allocated structures are composed of single slabs of memory, and include arrays, matrices, heaps, and hash tables.

- Linked data structures are composed of multiple distinct chunks of memory bound together by references/pointers, and include lists, trees, and graph adjacency lists.


## Arrays 


Advantages of contiguously-allocated arrays include:

- Constant-time access given the index.

- Arrays consist purely of data, so no space is wasted with links or other formatting information.

- Physical continuity (memory locality) between successive data accesses helps exploit the high-speed cache memory on modern computer architectures.



## Dynamic Arrays



Unfortunately we cannot adjust the size of simple arrays in the middle of a program’s execution.

Compensating by allocating extremely large arrays can waste a lot of space.

With dynamic arrays we start with an array of size 1, and double its size from m to 2m each time we run out of space. How many times will we double for n elements? 

- Only⌈log2 n⌉.


## How much total work




## Linked Lists



The relative advantages of linked lists over static arrays include:

1. Overflow on linked structures can never occur unless the memory is actually full.

2. Insertions and deletions are simpler than for contiguous (array) lists.

3. With large records, moving pointers is easier and faster than moving the items themselves. 

Dynamic memory allocation provides us with flexibility on how and where we use our limited storage resources.


## Single vs Double Linked Lists


We gain extra flexibility on predecessor queries at a cost of doubling the number of pointers by using doubly-linked lists.

Since the extra big-Oh costs of doubly-linked lists is zero, we will usually assume they are so maintained, although it might not always be necessary.



## Dictionary / Dynamic Set


Perhaps the most important class of data structures maintain a set of items, indexed by keys.

- Search(S, k) – A query that, given a set S and a key value k, returns the index/reference to x to an element in S such that key[x] = k, or nil if no such element belongs to S.

- Insert(S,x) – A modifying operation that augments the set S with the element x.

- Delete(S,x) – Given a pointer x to an element in the set S, remove x from S. Observe we are given a pointer to an element x, not a key value.

- Min(S), Max(S) – Returns the element of the totally ordered set S which has the smallest (largest) key.

- Logical Predecessor(S,x), Successor(S,x) – Given an element x whose key is from a totally ordered set S, returns the next smallest (largest) element in S, or NIL if x is the maximum (minimum) element.

There are a variety of implementations of these dictionary operations, each of which yield different time bounds for various operations.

There is an inherent tradeoff between these operations. We will see that no single implementation will achieve the best time bound for all operations.


## Pause: Arrays and Linked lists as dictionaries


What is the asymptotic worst-case running times for each of the seven fundamental dictionary operations when the data structure is implemented as

- Unsorted array
- Sorted array
- A singly-linked unsorted list,
- A doubly-linked unsorted list,

Bonus
- A singly-linked sorted list, and finally
- A doubly-linked sorted list.


## Binary Search Trees


Binary search trees provide a data structure which efficiently supports all six dictionary operations.

A binary tree is a rooted tree where each node contains at most two children.

Each child can be identified as either a left or right child.

A binary search tree labels each node x in a binary tree such that all nodes in the left subtree of x have keys < x and all nodes in the right subtree of x have keys > x.

The search tree labeling enables us to find where any key is.



## Searching in a Binary Search Tree



## Minimum and Maximum in a Binary Search Tree



## In-order traversal in a Binary Search Tree



## Insertion in a Binary Search Tree



## Deletion in a Binary Search Tree



## Worst-Case and Average-Case Height



## Pause: Binary search tree as a dictionary





## Balanced search trees



When we talk about “balanced” trees, we mean trees whose height is O(lg n), so all dictionary operations (insert, delete, search, min/max, successor/predecessor) take O(lg n) time.

No data structure can be better than Θ(lg n) in the worst case on all these operations.

Extra care must be taken on insertion and deletion to guarantee such performance, by rearranging things when they get too lopsided.

Red-Black trees, AVL trees, 2-3 trees, splay trees, and B-trees are examples of balanced search trees used in practice and discussed in most data structure texts.


