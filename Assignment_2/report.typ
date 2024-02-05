#set text(font: "Fira Sans")

#align(center, text(17pt)[*Machine Data and Learning*])
#align(center, text(16pt)[Assignment-2: Bias-Variance Trade-off])
#align(center, text(13pt)[Moida Praneeth Jain, 2022101093])

= Task 1: Gradient Descent
== (a)
Gradient descent is an optimization algorithm used to fit a model to its training data.

Assume we have a dataset of the form
$ X = [x_1, x_2, dots, x_n] $
$ Y = [y_1, y_2, dots, y_n] $
Where $x_i$ are the independent variables and $y_i$ are the dependent variables

To find the line of best fit ($m$ is the slope and $c$ is the signed y-intercept) $ y = m x + c $
We first define a cost function such as Mean-Squared Error (MSE)
$ J = "cost" = "MSE" = 1/n sum_i (y_i - (m x_i + c))^2 $

We randomly choose initial values for $m$ and $c$, and iteratively move towards the correct values as follows: 

First, find the gradient of the cost function $J$ with respect to $m$ and $c$
$ (diff J)/(diff m) =  1/n sum_i (2(y_i - (m x_i + c))(-x_i)) $
$ (diff J)/(diff m) = -2/n sum_i x_i (y_i - (m x_i + c)) $
$ (diff J)/(diff c) = 1/n sum_i (2(y_i - (m x_i + c))(-1))  $
$ (diff J)/(diff c) = -2/n sum_i (y_i - (m x_i + c)) $

Let us define $L$ to be the learning rate. It determines the step size in each iteration. A small value would increase accuracy but require more iterations, while a high value would decrease accuracy but require less iterations. Now, we update $m$ and $c$ in the opposite direction of the gradient, with the step size $L$
$ m = m - L times (diff J)/(diff m) $
$ c = c - L times (diff J)/(diff c) $

We continue this process until our loss function reaches an almost constant value. After we get our final $m$ and $c$, we have our fitted model.

== (b)
For a mutivariable model with q independent and one dependent variable, we have
$ y = mat(x_1, x_2, x_3, dots, x_q) mat(beta_1; beta_2; beta_3; dots.v; beta_q) + c $
$ y = beta_1 x_1 + beta_2 x_2 + dots + beta_q x_q + c $

The cost function is
$ J = 1/n sum_i (y_i - (sum_(j=1)^q (beta_i x_i)+c))^2 $

The coefficients $(beta)$ can be found simply by extending the single variable case. 
$ beta_i = beta_i - L (diff J)/(diff beta_i) $
$ c = c - L (diff J)/(diff c) $
We iteratively update all $beta_i$ and $c$ until the cost function converges, and then we get our fitted model.

= Task 2: Numerical on Bias and Variance
Given
$ x = [-2, -1, 0, 1, 2, 3] $
$ y = f(x) =  [5, 0, 1, 4, 11, 22] $

$ f_1(x) = 2x^2 + 3x + 1 $
$ f_2(x) = x^2 + 3x $
$ f_3(x) = 2x^2 + 2x + 1 $

We need to find the bias squared, variance and MSE

First, we apply the model the input values
$ hat(f_1)(x) = [3, 0, 1, 6, 15, 28] $
$ hat(f_2)(x) = [-2, -2, 0, 4, 10, 18] $
$ hat(f_3)(x) = [5, 1, 1, 5, 13, 25] $
To get bias
$ "Bias" = E_i [hat(f_i)(x)] - f(x) $
$ "Bias" = 1/3 sum_i hat(f_i)(x) - f(x) $
$ "Bias" = 1/3 [6, -1, 2, 15, 38, 71]-[5, 0, 1, 4, 11, 22] $
$ "Bias" = [-3, -0.33, -0.33, 1, 1.67, 1.67] $
$ "Bias"^2 = [9, 0.11, 0.11, 1, 2.77, 2.77] $

To get variance
$ "Variance" = E_i [(hat(f_i)(x)- E_i [hat(f_i)(x)])^2] $
$ "Variance" = E_i [(hat(f_i)(x)- [2, -0.3, 0.67, 5, 12.67, 23.67])^2] $
$ "Variance" = 1/3 (([3, 0, 1, 6, 15, 28] - [2, -0.3, 0.67, 5, 12.67, 23.67])^2 + \ ([-2, -2, 0, 4, 10, 18] - [2, -0.3, 0.67, 5, 12.67, 23.67])^2 + \ ([9, 0.11, 0.11, 1, 2.77, 2.77] - [2, -0.3, 0.67, 5, 12.67, 23.67])^2) $
$ "Variance" = [8.67, 1.56, 0.22, 0.67, 4.22, 17.56] $

To get MSE
$ "MSE" = E_i [(f(x) - hat(f_i)(x))^2] $
$ "MSE" = 1/3 (([5, 0, 1, 4, 11, 22] - [3, 0, 1, 6, 15, 28])^2 +\ ([5, 0, 1, 4, 11, 22] - [-2, -2, 0, 4, 10, 18])^2 + \ ([5, 0, 1, 4, 11, 22] - [5, 1, 1, 5, 13, 25])^2) $
$ "MSE" = [17.67, 1.67, 0.33, 1.67, 7, 20.33] $

Note that
$ "Bias"^2 + "Variance" = [9, 0.11, 0.11, 1, 2.77, 2.77] + [8.67, 1.56, 0.22, 0.67, 4.22, 17.56] $
$ "Bias"^2 + "Variance" = [17.67, 1.67, 0.33, 1.67, 7, 20.33] $
$ "Bias"^2 + "Variance" = "MSE" $
Thus, the formula has been verified.