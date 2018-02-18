data{
  int <lower = 0> N;
  int deg_74[N];
  int cas_74[N];
  int deg_social_eng[N];
}
parameters{
  real b1[4];
  real mu_c;
  real <lower = 0> tau_c;
}
model{
  for(i in 1:N){
    deg_74[i] ~ poisson(b1[cas_74[i]]*deg_social_eng[i]);
  }
  b1 ~ normal(mu_c,tau_c);
  mu_c ~ normal(1,1);
  tau_c ~ cauchy(0,10);
}
generated quantities{
  real y_pred[N];
  for(i in 1:N){
    y_pred[i] = poisson_rng(b1[cas_74[i]]*deg_social_eng[i]);
  }
}

