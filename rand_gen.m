%generate n random x and y data points
function [rand_x, rand_y] = rand_gen(n)
rand_x = zeros(n,3);
rand_y = zeros(n,1);
for i = 1:3
    for j = 1:n
        rand_x(j,i) = rand();
    end
end

for h = 1:n
    rand_y(h,1)= double(rand_x(h,1)*rand_x(h,2) ...
     +rand_x(h,3));
end
end