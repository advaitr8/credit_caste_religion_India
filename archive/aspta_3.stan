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
    alpha[i] = a0 + a1[cas_74[i]]*deg_social_eng[i]
    beta[i] = b0 + b1[cas_74[i]]*deg_social_eng[i]
  }
  
}
model{
  for(i in 1:N){
  deg_74[i] ~ gamma(alpha[i],beta[i]);
  }
}
generated quantities{
  real y_pred[N];
  for(i in 1:N){
    y_pred[i] = gamma_rng(alpha[i],beta[i]);
  }
}
