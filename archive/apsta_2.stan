data{
  int <lower = 0> N;
  int deg_74[N];
  int rel_74[N];
  int cas_74[N];
  int deg_social_eng[N];
}
parameters{
  real b1[2];
  real b2[4];
  real b3;
  real <lower = 0> sigma;
  real mu_r;
  real mu_c;
  real <lower = 0> tau_r;
  real <lower = 0> tau_c;
}
model{
  for(i in 1:N){
    deg_74[i] ~ normal(b1[rel_74[i]]*rel_74[i] 
                      + b2[cas_74[i]]*cas_74[i] 
                      + b3*deg_social_eng[i], sigma);
  }
  b1 ~ normal(mu_r,tau_r);
  b2 ~ normal(mu_c,tau_c);
  b3 ~ normal(0,2);
  mu_r ~ normal(0,3);
  mu_c ~ normal(0,3);
  tau_r ~ cauchy(0,30);
  tau_c ~ cauchy(0,30);
  sigma ~ cauchy(0,30);
}
generated quantities{
  real y_pred[N];
  for(i in 1:N){
    y_pred[i] = normal_rng(b1[rel_74[i]]*rel_74[i] + b2[cas_74[i]]*cas_74[i],sigma);
  }
}
