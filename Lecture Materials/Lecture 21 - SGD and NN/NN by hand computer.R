rm(list = ls())
y1 = 0.5
x11 = 10
x12 = -5

y2 = 0.6 
x21 = 3
x22 = 2

b1_1 = b1_2 = b2_1 = 1
w1_11 = 0.2
w1_12 = 0.9

w1_21 = 0.7
w1_22 = 0.5

w2_11 = 0.1
w2_12 = 0.5
sigma = function(x){1/(1+exp(-x))}
######################
# Calculating the Zs #
######################

# First hidden layer
z11_1 = x11*w1_11 + x12*w1_12 + b1_1
z12_1 = x22*w1_11 + x22*w1_12 + b1_1

# Second hidden layer
z11_2 = x11*w1_21 + x12*w1_22 + b1_1
z12_2 = x22*w1_21 + x22*w1_22 + b1_1

# output layer
z21_1 = w2_11*sigma(z11_1) + w2_12*sigma(z11_2) + b2_1
z22_1 = w2_11*sigma(z12_1) + w2_12*sigma(z12_2) + b2_1

# predicted value
yhat_1 = sigma(z21_1)
yhat_2 = sigma(z22_1)



# Derivative with respect to b2_1
2*(yhat_1 - y1)*(yhat_1*(1 - yhat_1))*1
2*(yhat_2 - y2)*(yhat_2*(1 - yhat_2))*1
mean(c(2*(yhat_1 - y1)*(yhat_1*(1 - yhat_1))*1,
       2*(yhat_2 - y2)*(yhat_2*(1 - yhat_2))*1))

# Derivative with respect to w1_21
2*(yhat_1 - y1)*(yhat_1*(1 - yhat_1))*w2_12*sigma(z11_2)*(1-sigma(z11_2))*x11
2*(yhat_2 - y2)*(yhat_2*(1 - yhat_2))*w2_12*sigma(z12_2)*(1-sigma(z12_2))*x21

mean(c(2*(yhat_1 - y1)*(yhat_1*(1 - yhat_1))*w2_12*sigma(z11_2)*(1-sigma(z11_2))*x11,
     2*(yhat_2 - y2)*(yhat_2*(1 - yhat_2))*w2_12*sigma(z12_2)*(1-sigma(z12_2))*x21))

