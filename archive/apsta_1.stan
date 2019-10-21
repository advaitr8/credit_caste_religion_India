data{
  int <lower = 0> N;
  int deg_74[N];
  int rel_74[N];
  int cas_74[N];
}
parameters{
  real b1[2];
  real b2[4];
}
model{
  for(i in 1:N){
    deg_74[i] ~ poisson(exp(b1[rel_74[i]]*rel_74[i] + b2[cas_74[i]]*cas_74[i]));
  }
  b1 ~ normal(0,3);
  b2 ~ normal(0,3);
}
generated quantities{
  real y_pred[N];
  for(i in 1:N){
    y_pred[i] = poisson_rng(exp(b1[rel_74[i]]*rel_74[i] + b2[cas_74[i]]*cas_74[i]));
  }
}
