# ZK
## 1. Zk-book(Source: https://www.rareskills.io/zk-book)
### Chapter-1 : Set Theory
https://www.rareskills.io/post/set-theory

We will barely scratch the grammar (proofs and theorems) and emphasize the vocabulary of abstract math.
A set is a well-defined collection of objects. Where the abstract power comes from is that these could be anything and the rules we learn from set theory apply to them.
Sets do not contain duplicate items by definition, {a, a, b} is really {a, b}
* Set equality
* Cardinality
* countably infinite(ℤ) vs uncountably infinite(ℝ)
* Ordered pairs
* Cartesian product
* Set relations
* Subsets of the cartesian product form a function
* Valid and invalid subsets of the cartesian product
* Injective(one-one), Surjective(onto), and Bijective functions
* Cartesian product of a set with itself
* A “binary operator” in set theoretic terms : It is a function from A × A → A. Basically, we take every possible pair from A (the cartesian product of A with itself) and map it to A.

  The binary operator: Addition modulo 3.
  Addition modulo 3 means that after performing addition, if the result is greater than or equal to 3, you take the remainder when divided by 3.
  ##### if the binary operator is commutative, then the map from (A x A) to A cannot be injective if the cardinality of the set is 2 or greater.
* Properties of binary operators over sets:
    * Magma
      A magma is a set with a closed binary operator. That’s it.
    * Semi-Group
      A semigroup is a magma where the binary operator must be associative.
    * Monoid
      A monoid is a semigroup with an identity element.
    * Group
      A group is a monoid where each element has an inverse.Groups are very important in our study of cryptography.
    * Abelian Group
      Abelian means the binary operator is commutative.

### Chapter-2 : Group Theory
https://www.rareskills.io/post/group-theory-and-coding

examples:
* The trivial group : 0
* Real numbers are not a group under multiplication
* N × M matrices of real numbers are a group under addition
* The set of 2D points on an euclidean plane under addition is a group
* N x N matrices of non-zero determinant under multiplication are a group
* The set of all polynomials of a fixed upper-bounded degree is a group under addition.
* Addition modulo a prime number is a group
* Multiplication modulo a prime number is not a group
* A fixed based raised to integer powers under multiplication is a group
#### Finite Groups:
A finite group has a finite number of elements in it.
###### The set of all integers under addition is not finite, but addition of integers modulo a prime number is a finite group.
Use Cayley Table.
#### Cyclic Groups:
A cyclic group is a group that has an element such that every element in the group can be “generated” by applying the binary operator repeatedly to that element, or to it’s inverse.
generator is usually denoted with g or G.
###### If a group is cyclic, then it is abelian.
###### The identity element of a group is unique.
#### Group Homomorphisms:
Let A be a group with binary operator □ and B be a group with binary operator △.

Group A is homomorphic to group B if there exists a transformation φ where φ maps elements from A to B, and for all a, a’ in A, 

φ(a □ a’) = φ(a) △ φ(a’).

This relationship also happens to be an isomorphism because it works in both directions, but for the purpose of zero knowledge proofs, we are more interested in homomorphisms than isomorphisms.
If our transformation φ is cryptographically hard to invert, then we have homomorphic encryption. That is, we can apply binary operators to encrypted data and “do valid math” but not know what the original values were
#### Product of Groups:
The product of groups is also a group. We won't go into detail about that right now, but when you deal with bilinear parings, you are going to see notation like G × G → G, and now you can understand what that means.

Let's say we take the product of two non-equal groups G and G' and map a subset of it to G''. That would be G × G' → G''. This is just the same set-theoretic definition of a function we have been using all along.

### Why does group theory matter?
To understand this :
##### Elliptic curve points under addition modulo p are a cyclic finite group and integers under addition are homomorphic to this group. 

### Chapter-3: Rings and Fields
https://www.rareskills.io/post/rings-and-fields

##### Ring:
A Ring is a set with two binary operators such that
* under the first binary operator, the set is a abelian group
* under the second binary operator, the set is a monoid
* the second binary operator distributes over the first
examples:
* Trivial Ring: {0} under addition and multiplication is a trivial ring.
* The set of all polynomials is a ring
* Square matrices of real numbers under addition and multiplication is a ring
##### Field:
A field is a set with two binary operators such that
* under the first binary operator, the set is an abelian group
* under the second binary operator, excluding the zero element, the set is an abelian group
examples:
* There is no trivial field
* Addition and multiplication modulo 2: the smallest possible field {0,1}-GF(2)
* The set of all integers under addition and multiplication is not a field
* The set of all rational numbers is a field
* The set of all real numbers is a field
* Integers modulo a prime number is a field under addition and multiplication
it can be calculates using python using follows:
p = 11 # must be prime
a = 6 # pick any element from [1,p], note that zero is excluded
a_inv = pow(a, -1, p)
assert (a * a_inv) % p == 1
basically Modular multiplicative inverses.
Finite Fields:
Finite fields are used a lot in cryptography. One major advantage of finite fields is that we can do arithmetic on rational numbers of arbitrary precision.
### Chapter-4: Elliptic Curve Point Addition
https://www.rareskills.io/post/elliptic-curve-addition

###### Set theoretic definition of elliptic curves
Elliptic curves are a family of curves which have the formula
y^2 = x^3 + ax + b

Rather than thinking of elliptic curves as a plot on a graph, think of them as an infinite set of points. Points are in the set if and only if they satisfy the elliptic curve equation.
* Elliptic Curves form an abelian group under addition
* the point at infinity
* If a straight line crosses an elliptic curve at exactly two points, then it must be perfectly vertical.
* The inverse of an elliptic curve point is the negative of the y value of the pair.
* The fact that elliptic curve points are a group under our “2 points always result in a 3rd except for the identity” makes it’s abelian nature obvious.
* When we pick two points, there is only one other third point. You can’t get four intersections in an elliptic curve. Since we only have one possible solution, then it is clear that A ⊕ B = B ⊕ A.
  image=href.https://static.wixstatic.com/media/935a00_cffa7b60afd8486f8cc2f97de8b07f17~mv2.png/v1/fill/w_1110,h_609,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/935a00_cffa7b60afd8486f8cc2f97de8b07f17~mv2.png
###### Point Addition:
Just define point addition to be the third point flipped over the y axis.
###### Point Multiplication:

### Chapter-5: Elliptic Curves over Finite Field
https://www.rareskills.io/post/elliptic-curves-finite-fields

##### bn128 is used in ethereum precompilers
