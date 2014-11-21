
%% Accessing Single Elements
%To reference a particular element in a matrix, specify its row and column number using the following syntax, where A is the matrix variable. Always specify the row first and column second:

%A(row, column)
%For example, for a 4-by-4 magic square A,

A = magic(4)

%you would access the element at row 4, column 2 with

A(4, 2)

%% Linear Indexing
%You can refer to the elements of a MATLAB� matrix with a single subscript, A(k). MATLAB stores matrices and arrays not in the shape that they appear when displayed in the MATLAB Command Window, but as a single column of elements. This single column is composed of all of the columns from the matrix, each appended to the last.
A = [2 6 9; 4 2 8; 3 5 1]

%is actually stored in memory as the sequence
%2, 4, 3, 6, 2, 5, 9, 8, 1
%The element at row 3, column 2 of matrix A (value = 5) can also be identified as element 6 in the actual storage sequence. To access this element, you have a choice of using the standard A(3,2) syntax, or you can use A(6), which is referred to as linear indexing.

%% Accessing Multiple Elements
%For the 4-by-4 matrix A shown below, it is possible to compute the sum of the elements in the fourth column of A by typing
A = magic(4);
A(1,4) + A(2,4) + A(3,4) + A(4,4)

%A(1:m, n)
%refers to the elements in rows 1 through m of column n of matrix A. Using this notation, you can compute the sum of the fourth column of A more succinctly:

sum(A(1:4, 4))

%% Nonconsecutive Elements
%To refer to nonconsecutive elements in a matrix, use the colon operator with a step value. The m:3:n in this expression means to make the assignment to every third element in the matrix. Note that this example uses linear indexing:

B = A;

B(1:3:16) = -10

%Here is an example of value-based indexing where array B indexes into elements 1, 3, 6, 7, and 10 of array A. In this case, the numeric values of array B designate the intended elements of A:

A = 5:5:50
B = [1 3 6 7 10];

A(B)

%If you index into a vector with another vector, the orientation of the indexed vector is honored for the output:

A(B')

A1 = A'; A1(B)

%% The end Keyword
%MATLAB provides the keyword end to designate the last element in a particular dimension of an array. This keyword can be useful in instances where your program does not know how many rows or columns there are in a matrix. You can replace the expression in the previous example with

B(1:3:end) = -10

%% Specifying All Elements of a Row or Column
%The colon by itself refers to all the elements in a row or column of a matrix. Using the following syntax, you can compute the sum of all elements in the second column of a 4-by-4 magic square A:

sum(A(:, 2))

%By using the colon with linear indexing, you can refer to all elements in the entire matrix. This example displays all the elements of matrix A, returning them in a column-wise order:

A(:)

%% Using Logicals in Array Indexing
%A logical array index designates the elements of an array A based on their position in the indexing array, B, not their value. In this masking type of operation, every true element in the indexing array is treated as a positional index into the array being accessed.

%In the following example, B is a matrix of logical ones and zeros. The position of these elements in B determines which elements of A are designated by the expression A(B):

A = [1 2 3; 4 5 6; 7 8 9]
B = logical([0 1 0; 1 0 1; 0 0 1]);

A(B) 

%The find function can be useful with logical arrays as it returns the linear indices of nonzero elements in B, and thus helps to interpret A(B):

find(B)

%% Logical Indexing ? Example 1
%This example creates logical array B that satisfies the condition A > 0.5, and uses the positions of ones in B to index into A:

A = rand(5);
B = A > 0.5;
A(B) = 0

%A simpler way to express this is

A(A > 0.5) = 0

%% Logical Indexing ? Example 2
%The next example highlights the location of the prime numbers in a magic square using logical indexing to set the nonprimes to 0:

A = magic(4)
B = isprime(A)

A(~B) = 0;                       % Logical indexing

A

find(B)



%% Indexing Vectors
Let's start with the simple case of a vector and a single subscript. The vector is:

  v = [16 5 9 4 2 11 7 14];
The subscript can be a single value:

  v(3)     % Extract the third element
  ans =
        9
Or the subscript can itself be another vector:

  v([1 5 6])      % Extract the first, fifth, and sixth elements
  ans =
        16   2   11
The colon notation in MATLAB provides an easy way to extract a range of elements from v:

  v(3:7)     % Extract the third through the seventh elements
  ans =
        9   4   2   11   7
Swap the two halves of v to make a new vector:

  v2 = v([5:8 1:4])     % Extract and swap the halves of v
  v2 =
        2   11   7   14   16   5   9   4
The special end operator is an easy shorthand way to refer to the last element of v:

  v(end)     % Extract the last element
  ans =
        14
The end operator can be used in a range:

  v(5:end)     % Extract the fifth through the last elements   
  ans =
        2   11   7   14
You can even do arithmetic using end:

  v(2:end-1)     % Extract the second through the next-to-last elements
  ans =
        5   9   4   2   11   7
Combine the colon operator and end to achieve a variety of effects, such as extracting every k-th element or flipping the entire vector:

  v(1:2:end)   % Extract all the odd elements
  ans =
      16   9   2   7
  v(end:-1:1)   % Reverse the order of elements
  ans =
      14   7   11   2   4   9   5   16
By using an indexing expression on the left side of the equal sign, you can replace certain elements of the vector:

  v([2 3 4]) = [10 15 20]   % Replace some elements of v
  v =
      16   10   15   20   2   11   7   14
Usually the number of elements on the right must be the same as the number of elements referred to by the indexing expression on the left. You can always, however, use a scalar on the right side:

  v([2 3]) = 30   % Replace second and third elements by 30
  v =
      16   30   30   20   2   11   7   14
This form of indexed assignment is called scalar expansion.

Indexing Matrices with Two Subscripts
Now consider indexing into a matrix. We'll use a magic square for our experiments:

  A = magic(4)
  A =
          16           2           3          13
           5          11          10           8
           9           7           6          12
           4          14          15           1
Most often, indexing in matrices is done using two subscripts?one for the rows and one for the columns. The simplest form just picks out a single element:

  A(2,4)   % Extract the element in row 2, column 4
  ans =
           8
More generally, one or both of the row and column subscripts can be vectors:

  A(2:4,1:2)
  ans =
           5          11
           9           7
           4          14
A single : in a subscript position is shorthand notation for 1:end and is often used to select entire rows or columns:

  A(3,:)   % Extract third row
  ans =
     9   7   6   12
  A(:,end)   % Extract last column
  ans =
          13
           8
          12
           1
There is often confusion over how to select scattered elements from a matrix. For example, suppose you want to extract the (2,1), (3,2), and (4,4) elements from A. The expression A([2 3 4], [1 2 4]) won't do what you want. This diagram illustrates how two-subscript indexing works:

two_subscript_indexing.gif
Extracting scattered elements from a matrix requires a different style of indexing, and that brings us to our next topic.

Linear Indexing
What does this expression A(14) do?

When you index into the matrix A using only one subscript, MATLAB treats A as if its elements were strung out in a long column vector, by going down the columns consecutively, as in:

          16
           5
           9
         ...
           8
          12
           1
The expression A(14) simply extracts the 14th element of the implicit column vector. Indexing into a matrix with a single subscript in this way is often called linear indexing.

Here are the elements of the matrix A along with their linear indices:

matrix_with_linear_indices.gif
The linear index of each element is shown in the upper left.

From the diagram you can see that A(14) is the same as A(2,4).

The single subscript can be a vector containing more than one linear index, as in:

  A([6 12 15])
  ans =
      11   15   12
Consider again the problem of extracting just the (2,1), (3,2), and (4,4) elements of A. You can use linear indexing to extract those elements:

  A([2 7 16])
  ans =
      5   7   1
That's easy to see for this example, but how do you compute linear indices in general? MATLAB provides a function called sub2ind that converts from row and column subscripts to linear indices. You can use it to extract the desired elements this way:

  idx = sub2ind(size(A), [2 3 4], [1 2 4])
  ans =
      2   7   16
  A(idx)
  ans =
      5   7   1
Advanced Examples Using Linear Indexing
Example 1: Shifting the Rows of a Matrix
A MATLAB user recently posed this question in the comp.soft-sys.matlab newsgroup: If I want to shift the rows of an m-by-n matrix A by k places, I use A(:,[n-k+1:n 1:n-k]). But what if k is a function of the row number? That is, what if k is a vector of length m? Is there a quick and easy way to do this?

Regular newsgroup contributor Peter Acklam posted this solution that uses sub2ind and linear indexing:

  % index vectors for rows and columns
  p = 1:m;
  q = 1:n;
  % index matrices for rows and columns
  [P, Q] = ndgrid(p, q);
  % create a matrix with the shift values
  K = repmat(k(:), [1 n]);
  % update the matrix with the column indexes
  Q = 1 + mod(Q+K, n);
  % create matrix of linear indexes
  ind = sub2ind([m n], P, Q);
  % finally, create the output matrix
  B = A(ind);
Example 2: Setting Some Matrix Elements to Zero
Another MATLAB user posted this question: I want to get the maximum of each row, which isn't really a problem, but afterwards I want to set all the other elements to zero. For example, this matrix:

             1           2           3           4
             5           5           6           5
             7           9           8           3
should become:

             0           0           0           4
             0           0           6           0
             0           9           0           0
Another regular newsgroup contributor, Brett Shoelson, provided this compact solution.

  [Y,I] = max(A, [], 2);
  B = zeros(size(A));
  B(sub2ind(size(A), 1:length(I), I')) = Y;
Logical Indexing
Another indexing variation, logical indexing, has proven to be both useful and expressive. In logical indexing, you use a single, logical array for the matrix subscript. MATLAB extracts the matrix elements corresponding to the nonzero values of the logical array. The output is always in the form of a column vector. For example, A(A > 12) extracts all the elements of A that are greater than 12.

  A(A > 12)
  ans =
        16
        14
        15
        13
Many MATLAB functions that start with is return logical arrays and are very useful for logical indexing. For example, you could replace all the NaN elements in an array with another value by using a combination of isnan, logical indexing, and scalar expansion. To replace all NaN elements of the matrix B with zero, use

  B(isnan(B)) = 0
Or you could replace all the spaces in a string matrix str with underscores.

  str(isspace(str)) = '_'
Logical indexing is closely related to the find function. The expression A(A > 5) is equivalent to A(find(A > 5)). Which form you use is mostly a matter of style and your sense of the readability of your code, but it also depends on whether or not you need the actual index values for something else in the computation. For example, suppose you want to temporarily replace NaN values with zeros, perform some computation, and then put the NaN values back in their original locations. In this example, the computation is two-dimensional filtering using filter2. You do it like this:

  nan_locations = find(isnan(A));
  A(nan_locations) = 0;
  A = filter2(ones(3,3), A);
  A(nan_locations) = NaN;