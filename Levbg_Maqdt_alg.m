function w = Levbg_Maqdt_alg(x,y)
m = height(y);

lemda_k = 1;
lemda = 1;
vec_w = zeros(10,16);
vec_l = zeros(10,30);
vec_l_one = zeros(1,30);
for j = 1:10%multiple run
%initialize w,lemda
for i = 1:16
    w(1,i) = 0.1*rand();
end
fi = get_resi(x,y,w);
l_w_norm = norm(fi)^2 + lemda*(norm(w))^2;
i = 0;
%l_w_norm >0.01 && 
while i < 30
    i = i +1;
    fi = get_resi(x,y,w);
    l_w_norm = norm(fi)^2 + lemda*(norm(w))^2;
    A1 = Jacob_f(x,w);
    A2 = eye(16);
    A3 = eye(16);
    b1 = Jacob_f(x,w)*(w.')-fi;
    b2 = zeros(16,1);
    b3 = w.';
    A = [A1;sqrt(lemda)*A2;sqrt(lemda_k)*A3];
    b = [b1;sqrt(lemda)*b2;sqrt(lemda_k)*b3];
    w_new = lsqlin(A,b);
    w_new = w_new.';
    fi_new = get_resi(x,y,w_new);
    l_w_norm_new = norm(fi_new)^2 + lemda*(norm(w_new))^2;
    if l_w_norm_new < l_w_norm
        w = w_new;
        fi = fi_new;
        lemda_k = 0.8*lemda_k;
        l_w_norm = l_w_norm_new;
    else
        lemda_k = 2*lemda_k;
    end
    vec_l_one(1,i) = l_w_norm;
    %vec_err(1,i) = l_w_norm/m;
end

vec_l(j,:) = vec_l_one(1,:);
vec_w(j,:) = w(1,:);
end
%choose the w with smallest loss
[M,I] = min(vec_l(:,end));
fprintf('final loss=%f\n',M);
opt_l = vec_l(I,:);
opt_w = vec_w(I,:);
fprintf('error=%f',M/m);
%x = 1:i;
%plot(x,opt_l,'b-x');
%title('loss');

end