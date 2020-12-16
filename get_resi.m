%get the residual of predicted result and true output
function fi = get_resi(x,y,w)
m = height(y);
fw = zeros(m,1);
fi = zeros(m,1);
for n =1:m
fw(n,1) = w(1,1)*tanh(dot(w(1,2:4),x(n,:))+w(1,5))+w(1,6) ...
    *tanh(dot(w(1,7:9),x(n,:))+w(1,10))+w(1,11)* ... 
    tanh(dot(w(1,12:14),x(n,:)) + w(1,15))+w(1,16);
fi(n,1) = fw(n,1)- y(n,1);%calculate the residual
end
end
