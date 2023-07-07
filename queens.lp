% Define the size of the board
#const n = 128.

% Define the squares
square(1..n, 1..n).

% Place a queen on each row
1 { queen(I, J) : square(I, J) } 1 :- I = 1..n.

% No two queens on the same row or column
:- queen(I, J), queen(K, J), I != K.
:- queen(I, J), queen(I, K), J != K.

% No two queens on the same diagonal
:- queen(I, J), queen(K, L), I-J = K-L, I != K.
:- queen(I, J), queen(K, L), I+J = K+L, I != K.

% Show the queens
#show queen/2.
