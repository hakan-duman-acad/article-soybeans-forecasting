# THE SOURCE CODE OF THE ANALYSIS
## Required packages installation if not already installed
list.of.packages <- c(
  "tidyverse", "tsibble", "rnaturalearth", "sp", "fable", "feasts",
  "rnaturalearthdata","sf"
)
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[, "Package"])]
if (length(new.packages) > 0) {
  install.packages(new.packages)
}
## Load the required packages
library(tidyverse)
library(tsibble)
library(rnaturalearth)
library(sp)
library(sf)
library(fable)
library(feasts)
library(rnaturalearthdata)
options(scipen = 10000, digits = 2)
## Preparing the world map template
sf_use_s2(use_s2 = FALSE)
world <- ne_countries(scale = "small", returnclass = "sf")
world$adm0_a3_us[world$adm0_a3_us == "SDS"] <- "SSD"
world$adm0_a3_us[world$adm0_a3_us == "IS1"] <- "ISR"
## Loading the soybean production and trade data from FAOSTAT
soybean_trade <- read_delim(file = "./data/FAOSTAT_data_en_trade.csv")
soybeans <- read_delim(file = "./data/FAOSTAT_data_en_production.csv")
soybeans_matrix <- read_delim(file = "./data/FAOSTAT_data_en_trade_matrix.csv")
m49 <- read_delim(file = "./data/m49.csv") # M49 codes
## A function to plot world map
plotMap <- function(item, element, data = soybeans, year = 2022, unit = 1000, labs = "", tmatrix = FALSE) {
    if (tmatrix) {
        tmp <- soybeans_matrix  |> 
        filter( Year == year) |>
        select(Element,Unit,Item,Value,`Partner Country Code (M49)`) |> 
        rename(ac = `Partner Country Code (M49)`)  |>
        mutate(ac = as.numeric(ac))  |>
        left_join(m49  |> select(alpha,code), by = c("ac"="code"))
    } else {
        tmp <- data  |> 
        filter( Year == year) |>
        select(Area,Element,Unit,Item,Value,`Area Code (M49)`) |> 
        rename(ac = `Area Code (M49)`)  |> 
        mutate(ac=as.numeric(ac)) |>
        left_join(m49  |> select(alpha,code), by = c("ac"="code")) 
    }
    tmp$alpha[tmp$ac==158] <- "TWN"
    world_points<- st_centroid(world)
    world_points <- cbind(world, st_coordinates(st_centroid(world$geometry)))   
    ranked <- world  |>  left_join(tmp  |> 
                                filter(Item == item, Element == element,),
                                       by = c("adm0_a3_us"="alpha")) |> 
        as_tibble()  |>
        arrange(desc(Value))  |> 
        select(admin,Value) 
    ranked <- ranked |> 
        add_column(rank = 1:nrow(ranked)) 
    plot <- world  |>  left_join(tmp  |> filter(Item == item, Element == element,),
                     by = c("adm0_a3_us"="alpha"))  |> 
        mutate(Value = Value / unit) |> 
        ggplot()+
        geom_sf(aes(fill = Value))+
        scale_fill_viridis_c(option="D", trans = "log10")+
        geom_text(data= world_points  |> 
                  filter(admin %in% c(ranked$admin[1:15],"Turkey")),
              aes(x=X, y=Y, label=admin ),
             color = "black", size=.95,alpha = .4,  , check_overlap = TRUE)+
        xlab("")+   ylab("")+  theme(legend.position="right")+ 
        theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
        theme(plot.background = element_rect(color = "black"))+
        labs(fill = labs)+
        theme(legend.text=element_text(size=5),legend.title = element_text(size=5)) 
    return(plot)
}
## Preparing world soybean production plot for 2022
plotMap(item = "Soya beans", element = "Production", labs = "Soybean Production(kt)")
## Preparing world soybean imports plot for 2022
plotMap(data = soybean_trade, item = "Soya beans", element = "Import Quantity", labs = "Soybean Imports(kt)")
## Preparing world soybean exports plot for 2022
plotMap(data = soybean_trade,item = "Soya beans", element = "Export Quantity", labs = "Soybean Exports(kt)")
## Preparing soybean exports from Turkey  for 2022
plotMap(data= soybeans_matrix, tmatrix = TRUE, item = "Soya beans", element = "Export Quantity", labs ="Soybeans Exports (kt)")
## Preparing soybean imports to Turkey  for 2022
plotMap(data= soybeans_matrix, tmatrix = TRUE, item = "Soya beans", element = "Import Quantity", labs = "Soybeans Imports (kt)")
## Setting the time series data for soybean production in Turkey (1990-2022)
data <- data.frame(
    value = c(162000, 110000, 95000, 63000, 70000, 75000,
    50000, 40000, 60000, 66000, 44500, 50000,
    75000, 85000, 50000, 29000, 47300, 30666,
    34461, 38442, 86540, 102260, 122114, 180000,
    150000, 161000, 165000, 140000, 140000, 150000,
    155225, 182000, 155000), Index = 1990:2022)
data <- tsibble(data, index = Index)
## Plotting the time series data
data |> autoplot(value) +
    xlab("")+ ylab("Production Quantity (tonnes)")
## Performing the KPSS test for level and first difference
data |>
    features(value, feasts::unitroot_kpss)
data |>
    mutate(diff_value = difference(value)) |>
    features(diff_value, feasts::unitroot_kpss)
## Splitting data into training and testing sets
dTrain <- data |> filter(Index <= 2014)
dTest <- data |> filter(Index > 2014)
## Fitting and evaluating ARIMA models
fit <- dTrain |>
    model(
    AUTOARIMA = ARIMA(value,stepwise = FALSE),
    ARIMA010 = ARIMA(value ~pdq(0,1,0)),
    ARIMA111 = ARIMA(value ~pdq(1,1,1)),
    ARIMA110 = ARIMA(value ~pdq(1,1,0)),
    ARIMA011 = ARIMA(value ~pdq(0,1,1)),
    )
fc <- fit |>
    forecast(h = nrow(dTest))
accuracy(fc, dTest) |> arrange(RMSE) |>
    select(-MASE,-RMSSE,-MPE,-ACF1,-ME,-.type)
## Fitting and evaluating SE models
fit <- dTrain |>
    model(SES = ETS(value),
    HLT = ETS(value ~ error("A") + trend("A")+
    season("N") ),
    DHLT = ETS(value ~ error("A") + trend("Ad")+
    season("N")))
fc <- fit |>
    forecast(h = nrow(dTest))
accuracy(fc, dTest) |> arrange(RMSE) |> 
    select(-MASE,-RMSSE,-MPE,-ACF1,-ME,-.type)
## Fitting and evaluating NNAR models
set.seed(2024)
fit <- dTrain |>
    model(NNAR_5 = NNETAR(value,n_nodes = 5, n_networks= 30, scale_inputs =TRUE),
    NNAR_10 = NNETAR(value,n_nodes = 10, n_networks= 30, scale_inputs =TRUE),
    NNAR_25 = NNETAR(value,n_nodes = 20, n_networks= 30, scale_inputs =TRUE),
    NNAR_50 = NNETAR(value,n_nodes = 20, n_networks= 30, scale_inputs =TRUE))
fc <- fit |> 
    forecast(h = nrow(dTest))
accuracy(fc, dTest) |> arrange(RMSE) |>
    select(-MASE,-RMSSE,-MPE,-ACF1,-ME,-.type) 
## Fitting all models
set.seed(2024)
fit <- dTrain |>
    model(Mean = MEAN(value),
    `Naïve` = NAIVE(value),
    SES = ETS(value),
    NNAR_5 = NNETAR(value,n_nodes = 5, n_networks= 30, scale_inputs =TRUE),
    ARIMA111 = ARIMA(value ~pdq(1,1,1)))
fc <- fit |>
    forecast(h = nrow(dTest))
    fabletools::accuracy(fc, dTest) %>% arrange(RMSE) %>%
    select(-MASE,-RMSSE,-MPE,-ACF1,-ME,-.type) 
## Evaluating all models visually
fc |> autoplot(dTest,level = NULL) +
    guides(colour = guide_legend(title = "Forecast Models"))
## Fitting and reporting the best model
fitLast <- data |>
    model(ARIMA = ARIMA(value ~ pdq(1,1,1)))
report(fitLast)
## Mean of the residuals
aug <- augment(fitLast)
cat("Mean of the residuals", mean(aug$.innov),"\n")
## Performing the Ljung-Box test on the residuals
aug |>  features(.innov, ljung_box, lag = 10)
## Performing the Shapiro-Wilk test on the residuals for normality check
shapiro.test(aug$.innov)
## Prepare forecasts and upper/lower intervals for the next decade
fc <- fitLast |> forecast(h = 10, bootstrap = TRUE)
fc |> hilo() |> transmute(Mean = .mean,
    `Lower(80%)` = `80%`$lower, `Upper(80%)` =`80%`$upper,
    `Lower(95%)` = `95%`$lower, `Upper(95%)` =`95%`$upper)
## # Plotting the forecasts and intervals for the next decade
fc |> autoplot(data)+ 
    xlab("") + ylab("Soybean Production (tonnes)")

