# Apply a Bonferroni correction
p <- c(0.001, 0.01, 0.02, 0.03, 0.06, 0.08)
p_adjusted <- p.adjust(p, method = "bonferroni")

# Apply a Benjamini-Hochberg correction
p <- c(0.001, 0.01, 0.02, 0.03, 0.06, 0.08) 
p_adjusted <- p.adjust(p, method = "BH")

# Apply a two-sample t-test and perform a two-side, left-sided and righ-sided test
X1 <- c(-0.008178497, 0.004405896, -0.010696539, -0.027684961, 0.087134834)
X2 <- c(0.5873832, 0.4127324, 0.5617457, 0.3830783, 0.5128472) 
# two-sided t-test
t.test(X1,X2)
# left-sided t-test
t.test(X1, X2, alternative = "less")
# right-sided t-test
t.test(X1, X2, alternative = "greater")
