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

Now, we find the gradient of the cost function $J$ with respect to $m$ and $c$
$ (diff J)/(diff m) =  1/n sum_i (2(y_i - (m x_i + c))(-x_i)) $
$ (diff J)/(diff m) = -2/n sum_i x_i (y_i - (m x_i + c)) $
$ (diff J)/(diff c) = 1/n sum_i (2(y_i - (m x_i + c))(-1))  $
$ (diff J)/(diff c) = -2/n sum_i (y_i - (m x_i + c)) $

Let us define $L$ to be the learning rate. It determines the step size in each iteration. A small value would increase accuracy but require more iterations, while a high value would decrease accuracy but require less iterations. Now, we update $m$ and $c$ in the opposite direction of the gradient, with the step size $L$
$ m = m - L times (diff J)/(diff m) $
$ c = c - L times (diff J)/(diff c) $

We continue this process until our loss function reaches an almost constant value. After we get our final $m$ and $c$, we have our fitted model.