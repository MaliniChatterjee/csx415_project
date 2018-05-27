#' Plot EDA
#' This creates all the plots and saves them under "graphs"
#' which are used for initial exploratory data analysis.
#'
#' @param  train
#' @keywords
#' @export
#' @examples
#'
#'
#' plot_eda(train)

plot_eda <- function(train){
# plot the relationship between Age and the Subscription y (Bar Graph)
p<- train %>%
  ggplot() +
  geom_bar(aes(x = age, y = y), stat = 'identity') +
  labs(x="Age", y="Subscription") +
  theme_bw()
  savePlot("graphs/AgeVsY.pdf",p)

# plot the relationship between Marital and the Subscription y (Bar Graph)
q<- train %>%
  ggplot() +
  geom_bar(aes(x = marital, y = y), stat = 'identity') +
  labs(x="marital", y="Subscription") +
  theme_bw()
  savePlot("graphs/MaritalVsY.pdf",q)

# plot the relationship between Education and the Subscription y (Bar Graph)
r <- train %>%
  ggplot() +
  geom_bar(aes(x = education, y = y), stat = 'identity') +
  labs(x="Education", y="Subscription") +
  theme_bw()
  savePlot("graphs/EducationVsY.pdf",r)

# plot the relationship between Balance and the Subscription y (Bar Graph)
#train %>%
#ggplot() +
#geom_bar(aes(x = balance, y = y), stat = 'identity') +
#labs(x="balance", y="Subscription") +
#theme_bw()

# plot the relationship between Balance and the Subscription (Box Plot)
s <- train %>%
  ggplot(aes(x = y, y = balance), group=age) +
  geom_boxplot() +
  labs(x="Subscription", y="Balance") +
  theme_bw()
  savePlot("graphs/YVsBalance.pdf",s)

# plot the relationship between Job and the Subscription y (Bar Graph)
t <- train %>%
  ggplot() +
  geom_bar(aes(x = job, y = y), stat = 'identity') +
  labs(x="job", y="Subscription") +
  theme_bw()
  savePlot("graphs/JobVsY.pdf",t)

# plot the relationship between default and the Subscription y (Bar Graph)
u <- train %>%
  ggplot() +
  geom_bar(aes(x = default, y = y), stat = 'identity') +
  labs(x="default", y="Subscription") +
  theme_bw()
  savePlot("graphs/DefaultVsY.pdf",u)

# plot the relationship between housing and the Subscription y (Bar Graph)
v <- train %>%
  ggplot() +
  geom_bar(aes(x = housing, y = y), stat = 'identity') +
  labs(x="housing", y="Subscription") +
  theme_bw()
  savePlot("graphs/HousingVsY.pdf",v)
# plot the relationship between loan and the Subscription y (Bar Graph)
w <- train %>%
  ggplot() +
  geom_bar(aes(x = loan, y = y), stat = 'identity') +
  labs(x="loan", y="Subscription") +
  theme_bw()
  savePlot("graphs/LoansY.pdf",w)

}
