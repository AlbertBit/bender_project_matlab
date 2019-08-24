n=sqrt(size(J_array,3));
J_array_2d=zeros(size(J_array,1),size(J_array,2),n,n);

for i=1:n
    for j=1:n
        J_array_2d(:,:,i,j)=J_array(:,:,(i-1)*n+j);
    end
end