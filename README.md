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
##### Ring:
A Ring is a set with two binary operators such that
* under the first binary operator, the set is a abelian group
* under the second binary operator, the set is a monoid
* the second binary operator distributes over the first
examples:
* Trivial Ring: {0} under addition and multiplication is a trivial ring.
* The set of all polynomials is a ring
