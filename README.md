# Forecasting Soybean Production in Turkey: A Comparative Analysis of Automated and Traditional Methods

This is the English version of the README file.  
For the Turkish version, click [here](README-tr.md).

The full text of the article related to this study can be accessed via the following link: <https://dergipark.org.tr/en/pub/iutbd/issue/85235/1494324>

Please cite this study if you use it in your research as follows:

Duman, H. (2024). Forecasting Soybean Production in Turkey: A Comparative Analysis of Automated and Traditional Methods. Agro Science Journal of Igdir University, 2(1), 90-102.

## Abstract

Turkey’s climate and soil are well-suited for oilseed crops, which are
vital for various industries and human and animal diets. Soybeans, a
legume, hold particular nutritional value among oilseeds. While existing
research covers soybean production in Turkey, this study aims to: a)
evaluate production levels using different forecasting algorithms to
identify the most accurate model, and b) based on the chosen model,
forecast future production and assess the current and future
entrepreneurial potential of the soybean industry in Turkey. Soybean
production data (1990-2022) from TURKSTAT was divided into training
(n=26) and test (n=8) sets for cross-validation. By applying univariate
time series methods, including ARIMA, SES, NNAR, MN, and Naive to the
training dataset, it was found that ARIMA(1,1,1) performed best
according to test set RMSE values. The performance ranking (in terms of
RMSE) was as follows: ARIMA (13019) &lt; SES (13888) &lt; Naive (14240)
&lt; NNAR (58393) &lt; MN (80418). Notably, for this dataset, the
performance of automated processes was relatively worse than that of
manual methods, suggesting that relying solely on automated methods may
lead to suboptimal forecasting results. These findings underscore the
importance of human oversight in the use of automated algorithms for
time series forecasting and highlight the need for caution when
employing automated methods. The ARIMA(1,1,1) model forecasts a flat
trend (2023-2032) with production starting at 154,516 tonnes and
declining slightly to 153,607 tonnes. This predicted stagnation implies
that, with economic and population growth, soybean production will fall
further behind domestic demand, leading to increased import reliance.
These findings are crucial for farmers and policymakers as they can help
inform decisions related to resource allocation, crop planning, and
market strategies. Further analysis of these results is ongoing to gain
deeper insights into the factors influencing soybean production trends
in Turkey. Local producers could potentially benefit from increased
production efficiency, improved competitiveness, and potential revenue
growth by catering to both domestic and export markets. Additionally,
understanding these trade dynamics can help stakeholders identify
opportunities for collaboration or investment within the Turkish soybean
industry.

**Keywords:** Soybean production, Turkey, Time series forecasting, ARIMA
algorithm, NNAR, Auto-ARIMA

## R Packages

This study used the R statistical environment, version 4.2.2, developed
by R Core Team ([2022](#ref-r-2022)). The tidyverse meta-package,
version 2.0.0, created Wickham et al. ([2019](#ref-tidyverse-2019)), was
employed for data manipulation and cleaning. For time series data
extension, the tsibble package (version 1.1.3), developed by Wang, Cook,
and Hyndman ([2020](#ref-tsibble-2020)), was utilized. To build
forecasting models, the fable package (version 0.3.3) created by
O’Hara-Wild, Hyndman, and Wang ([2023a](#ref-fable-2023)) was employed.
For feature extraction and statistical analysis, the feasts package
(version 0.3.1), developed by O’Hara-Wild, Hyndman, and Wang
([2023b](#ref-feasts-2023)), was utilized. To create world maps,
rnaturalearth version 0.3.4 by Massicotte and South
([2023](#ref-rnaturalearth-2023)), rnaturalearthdata version 0.1.0 by
South ([2017](#ref-rnaturalearthdata-2017)),sf package version 1.0.14
and sp package version 2.1.2 with contributions from Pebesma and Bivand
([2005](#ref-rnews-2005)) and Bivand, Pebesma, and Gomez-Rubio
([2013](#ref-asdar-2013)), Pebesma ([2018](#ref-sp-2018)) were employed.

## Acknowledgements

This analysis adapted and modified code from various sources, such as
books, package manuals, vignettes, and GitHub repositories. The sources
are cited as follows:

- Data preparing, manipulation, cleaning, and visualization: Wickham
    et al. ([2019](#ref-tidyverse-2019)), Wang, Cook, and Hyndman
    ([2020](#ref-tsibble-2020)), Wang and contibutors
    ([2024](#ref-tsibble-2024-github)),
- Map Visualization: Massicotte and South
    ([2023](#ref-rnaturalearth-2023)), South
    ([2017](#ref-rnaturalearthdata-2017)), Pebesma and Bivand
    ([2005](#ref-rnews-2005)), Bivand, Pebesma, and Gomez-Rubio
    ([2013](#ref-asdar-2013)), Pebesma and contibutors
    ([2024](#ref-sf-2024-github))
- Forecasting Models, Feature Extraction: Hyndman
    ([2021](#ref-hyndman-2021)), O’Hara-Wild, Hyndman, and Wang
    ([2023a](#ref-fable-2023)), O’Hara-Wild, Hyndman, and Wang
    ([2023b](#ref-feasts-2023)), O’Hara-Wild and contibutors
    ([2024](#ref-fable-2024-github))

## Code References

Bivand, Roger S., Edzer J Pebesma, and Virgilio Gomez-Rubio. 2013.
*Applied Spatial Data Analysis with R, Second Edition*. Springer, NY.
<https://asdar-book.org/>.

Hyndman, R J. 2021. *Forecasting: Principles and Practice*. 3rd ed.
Melbourne, Australia: OTexts.

Massicotte, Philippe, and Andy South. 2023. *Rnaturalearth: World Map
Data from Natural Earth*.
<https://CRAN.R-project.org/package=rnaturalearth>.

O’Hara-Wild, Mitchell, and contibutors. 2024. “Tidyverts/Fable.” 2024.
<https://github.com/tidyverts/fable>.

O’Hara-Wild, Mitchell, Rob Hyndman, and Earo Wang. 2023a. *Fable:
Forecasting Models for Tidy Time Series*.
<https://CRAN.R-project.org/package=fable>.

———. 2023b. *Feasts: Feature Extraction and Statistics for Time Series*.
<https://CRAN.R-project.org/package=feasts>.

Pebesma, Edzer J. 2018. “<span class="nocase">Simple Features for R:
Standardized Support for Spatial Vector Data</span>.” *The R Journal* 10
(1): 439–46. <https://doi.org/10.32614/RJ-2018-009>.

Pebesma, Edzer J, and Roger Bivand. 2005. “Classes and Methods for
Spatial Data in R.” *R News* 5 (2): 9–13.
<https://CRAN.R-project.org/doc/Rnews/>.

Pebesma, Edzer J, and contibutors. 2024. “Simple Features for R.” 2024.
<https://r-spatial.github.io/sf/>.

R Core Team. 2022. *R: A Language and Environment for Statistical
Computing*. Vienna, Austria: R Foundation for Statistical Computing.
<https://www.R-project.org/>.

South, Andy. 2017. *Rnaturalearthdata: World Vector Map Data from
Natural Earth Used in ’Rnaturalearth’*.
<https://CRAN.R-project.org/package=rnaturalearthdata>.

Wang, Earo, and contibutors. 2024. “Tidyverts/Tsibble.” 2024.
<https://github.com/tidyverts/tsibble>.

Wang, Earo, Dianne Cook, and Rob J Hyndman. 2020. “A New Tidy Data
Structure to Support Exploration and Modeling of Temporal Data.”
*Journal of Computational and Graphical Statistics* 29 (3): 466–78.
<https://doi.org/10.1080/10618600.2019.1695624>.

Wickham, Hadley, Mara Averick, Jennifer Bryan, Winston Chang, Lucy
D’Agostino McGowan, Romain François, Garrett Grolemund, et al. 2019.
“Welcome to the <span class="nocase">tidyverse</span>.” *Journal of Open
Source Software* 4 (43): 1686. <https://doi.org/10.21105/joss.01686>.
