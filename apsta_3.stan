data{
  int <lower = 0> N;
  int deg_74[N];
  int cas_74[N];
  int deg_social_eng[N];
}
parameters{
  real <lower = 0> a0;
  real <lower = 0> a1[4];
  real <lower = 0> b0;
  real <lower = 0> b1[4];
}
transformed parameters{
  real <lower = 0> alpha[4];
  real <lower = 0> beta[4];
  for(i in 1:N){
    alpha[cas_74[i]] = a0 + a1[cas_74[i]]*deg_social_eng[i];
    beta[cas_74[i]] = b0 + b1[cas_74[i]]*deg_social_eng[i];
  }
  
}
model{
  for(i in 1:N){
  deg_74[i] ~ gamma(alpha[cas_74[i]],beta[cas_74[i]]);
  }
  a0 ~ normal(0,5);
  a1 ~ normal(0,5);
  b0 ~ normal(0,5);
  b1 ~ normal(0,5);
}
generated quantities{
  real y_pred[N];
  for(i in 1:N){
    y_pred[i] = gamma_rng(alpha[cas_74[i]],beta[cas_74[i]]);
  }
}
