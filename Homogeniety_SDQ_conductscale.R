KMO(SDQ[items_conduct])
# To obtain the measure of sampling adequacy MSA - an index summarizing the correlations on their overall potential to measure something in common - request the KMO index

# Parallel Analysis Scree plot
fa.parallel(SDQ[items_conduct], fa = "pc")

# Communality is the variance in the item due to the common factor, and uniqueness is the unique item variance. In standardised factor solutions (which is what function fa() prints), communality is the proportion of variance in the item due to the factor, and uniqueness is the remaining proportion (1-communality). Looking at the printed values, between 20% and 51% of variance in the items is due to the common factor.
fa(SDQ[items_conduct], nfactors=1)

F_conduct <- fa(SDQ[items_conduct], nfactors = 1)
residuals.psych(F_conduct)
residuals.psych(F_conduct, diag = F)
# The residuals are all quite close to zero. The largest residual is for correlation between “tantrum” and “lies”, approx. 0.09. It is still a small difference between observed and reproduced correlation (normally we ignore any residuals smaller than 0.1), so we conclude that the correlations are reproduced pretty well"

omega(R_conduct, nfactors = 1)

# Omega should provide a better estimate of reliability of a homogeneous scale than alpha because it does not rely on the assumption that all factor loadings are the same as alpha does. Here, alpha (0.72) underestimates the reliability slightly, because not all factor loadings are equal. (alpha can only be lower than omega, and they are equal when all factor loadings are equal).
