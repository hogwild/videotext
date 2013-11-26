%% This script is to test the correctness of connect

bbs = ...
  [1 1 10 10  1   1;
   1 1 8  8   1   1;
   5 5 20 20  1   1;
   1 1 8  8   1   2;
   2 2 11 11  2   3;
   2 2 11 11  2   4;
   2 2 11 11  2   5;
   2 2 11 11  2   6];
 
x = connect(bbs);
x(:,7)

%% Need more tests

bbs = ...
  [1 1 10 10  1   1;
   1 1 8  8   1   1;
   5 5 20 20  1   1;
   1 1 8  8   1   2;
   2 2 11 11  1   3;
   2 2 11 11  1   4;
   2 2 11 11  1   5;
   10 10 3 3  1   16
   11 10 1 1  1   17;
   11 10 8 1  1   18;
   2 2 11 11  1   19];
 
x = connect(bbs); % [1 2 3 2 1 1 1 4 5 6 7] 
x(:,7)