%get the gradient of fw
function gradient_f = grad_f(x,w)
%Since φ(x) = e^x-e^-x/e^x+e^-x = tanh(x)
gradient_f = zeros(1,16);
gradient_f(1,1) = tanh(dot(w(1,2:4),x)+w(1,5));
gradient_f(1,2)= x(1,1)*w(1,1)*sech(dot(w(1,2:4),x)+w(1,5)).^2;
gradient_f(1,3)= x(1,2)*w(1,1)*sech(dot(w(1,2:4),x)+w(1,5)).^2;
gradient_f(1,4)=x(1,3)*w(1,1)*sech(dot(w(1,2:4),x)+w(1,5)).^2;
gradient_f(1,5) = w(1,1)*sech(dot(w(1,2:4),x)+w(1,5)).^2;
gradient_f(1,6)=tanh(dot(w(1,7:9),x)+w(1,10));
gradient_f(1,7)=x(1,1)*w(1,6)*sech(dot(w(1,7:9),x)+w(1,10)).^2;
gradient_f(1,8)=x(1,2)*w(1,6)*sech(dot(w(1,7:9),x)+w(1,10)).^2;
gradient_f(1,9)=x(1,3)*w(1,6)*sech(dot(w(1,7:9),x)+w(1,10)).^2;
gradient_f(1,10)=w(1,6)*sech(dot(w(1,7:9),x)+w(1,10)).^2;
gradient_f(1,11)=tanh(dot(w(1,12:14),x)+w(1,15));
gradient_f(1,12)=x(1,1)*w(1,11)*sech(dot(w(1,12:14),x)+w(1,15)).^2;
gradient_f(1,13)=x(1,2)*w(1,11)*sech(dot(w(1,12:14),x)+w(1,15)).^2;
gradient_f(1,14)=x(1,3)*w(1,11)*sech(dot(w(1,12:14),x)+w(1,15)).^2;
gradient_f(1,15)=w(1,11)*sech(dot(w(1,12:14),x)+w(1,15)).^2;
gradient_f(1,16)=1;
end