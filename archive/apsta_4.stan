data{
  int <lower = 0> N;
  real deg_74[N];
  int cas_74[N];
  real deg_social_eng[N];
}
parameters{
  real b0;
  real b1[4];
  real <lower = 0> sigma;
  real mu_c;
  real <lower = 0> tau_c;
}
model{
  for(i in 1:N){
    deg_74[i] ~ normal(b0 
                      + b1[cas_74[i]]*deg_social_eng[i], sigma);
  }
  b0 ~ normal(0,1);
  b1 ~ normal(mu_c,tau_c);
  mu_c ~ normal(0,0.5);
  tau_c ~ cauchy(0,10);
  sigma ~ cauchy(0,10);
}
generated quantities{
  real y_pred[N];
  for(i in 1:N){
    y_pred[i] = normal_rng(b0
                      + b1[cas_74[i]]*deg_social_eng[i], sigma);
  }
}
