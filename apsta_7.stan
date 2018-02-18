data{
  int <lower = 0> N;
  int deg_74[N];
  int rel_74[N];
  int deg_social_eng[N];
}
parameters{
  real b1[2];
  real mu_r;
  real <lower = 0> tau_r;
}
model{
  for(i in 1:N){
    deg_74[i] ~ poisson(b1[rel_74[i]]*deg_social_eng[i]);
  }
  b1 ~ normal(mu_r,tau_r);
  mu_r ~ normal(1,1);
  tau_r ~ cauchy(0,10);
}
generated quantities{
  real y_pred[N];
  for(i in 1:N){
    y_pred[i] = poisson_rng(b1[rel_74[i]]*deg_social_eng[i]);
  }
}
