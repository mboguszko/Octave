
A = [16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1]
A(:,1:2)

x=ones(1,10)
v = zeros(10, 1);
for i = 1:10
  for j = 1:10 
    v(i) = v(i) + A(i, j) * x(j);
  end
end

