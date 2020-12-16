%get the jacobian of fw
%input x size is 500*3
function Jacobian_f = Jacob_f(x,w)
m = height(x);
Jacobian_f = zeros(m,16);
for i = 1:m
    Jacobian_f(i,:) = grad_f(x(i,:),w);
end
end
