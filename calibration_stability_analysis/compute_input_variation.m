J = J_n_04;

Jpinv = pinv(J);

X_0_idx = find(beam_measured_output(:,1)~=-9999);
X_0 = beam_measured_output(X_0_idx(1),:);
delta_u = Jpinv * ( X_des(1,:) - X_0)';

error = X_des(1,:)'-(X_0'+J*delta_u)
error_norm_4 = norm(error)^2

