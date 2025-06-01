# Exploratory Factor Analysis of polytomous responses to the Experience of Service Questionnaire

CHI_ESQ <- read.table(file = "~/RStudio Projects/Psychometrics Exercises ebook/CHI_ESQ Exploratory Factor Analysis/Data CHI-ESQ/CHI_ESQ.txt")
View(CHI_ESQ)
lowerCor(CHI_ESQ, use="pairwise")
KMO(CHI_ESQ)
fa.parallel(CHI_ESQ, fa="pc")
# Scree plot suggest one predominant factor but also a second significant factor, indicated by the fact that it is above the simulated/resampled data line

# Explore fit of 1-factor model and assess fit
fit1 <- fa(CHI_ESQ, nfactors=1)
# print short summary with model fit
summary.psych(fit1)
# Reject model according to chi-square test
# obtain residuals
residuals.psych(fit1, diag=FALSE)
# 1 factor model offers sufficient explanation for all items except 8, 9, and 10; cluster between .21 & .28
# So 1 factor model is clearly a bad fit

# Fit 2-factor model
fit2 <- fa(CHI_ESQ, nfactors=2)
# print short summary with model fit
summary.psych(fit2)
# Examine the 2-factor model residuals.
residuals.psych(fit2, diag=FALSE)
# No residuals very far above 0.1 (except barely), thus causing no particular concern
fit2.u <- fa(CHI_ESQ, nfactors=2, rotate="none")
fit2.u$loadings
# Looks like all items strongly correlate with factor 1 (MR1) except 8, 9, 10. 
# plot factor loadings
plot.psych(fit2.u, xlim=c(-0.5,1), ylim=c(-0.5,1))

# Interpret the 2-factor solution through an orthogonal lens
fit2.v <- fa(CHI_ESQ, nfactors=2, rotate="varimax")
fit2.v$loadings

# Now trying obliquely rotated solution. ORTHOGONAL assumes factors are uncorrelated, while OBLIQUE (not quite perpendicular) allows for correlation
fit2.o <- fa(CHI_ESQ, nfactors=2, rotate="oblimin")
fit2.o$loadings
plot.psych(fit2.o, xlim=c(-0.5,1), ylim=c(-0.5,1))
# Now asking for "Phi" -corrrelation matrix of latent factors
fit2.o$Phi
# Factors 1 and 2 correlate moderately at .39. Makes sense given that domains of satisfaction, sat with care & sat with environment, are expected to correlate.
