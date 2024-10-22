# Forecasting Soybean Production in Turkey: A Comparative Analysis of Automated and Traditional Methods

README  dosyasının Türkçe sürümüdür.  
İngilizce sürüm için [buraya](README.md) tıklayın.

Bu çalışmaya ilişkin makalenin tamamına aşağıdaki bağlantıdan erişebilirsiniz: <https://dergipark.org.tr/en/pub/iutbd/issue/85235/1494324>

Eğer araştırmanızda bu çalışmayı kullanırsanız, lütfen aşağıdaki şekilde atıfta bulununuz:

Duman, H. (2024). Forecasting Soybean Production in Turkey: A Comparative Analysis of Automated and Traditional Methods. Agro Science Journal of Igdir University, 2(1), 90-102.

## Özet

Türkiye'nin iklim ve toprağı, çeşitli endüstriler ve insan-hayvan beslenmesi için hayati önem taşıyan yağlı tohum bitkilerinin yetiştirilmesi için oldukça uygun koşullara sahiptir. Yağlı tohumlar arasında baklagil ailesine mensup soya fasulyesi, kendine özgü bir besin profiline sahiptir. Mevcut araştırmalar Türkiye'deki soya fasulyesi üretimini kapsasa da, bu çalışma: a) en doğru modeli belirlemek için farklı tahmin algoritmaları kullanarak üretim seviyelerini değerlendirmeyi ve b) seçilen modele dayanarak gelecekteki üretimi tahmin etmeyi ve Türkiye'deki soya fasulyesi endüstrisinin mevcut ve gelecekteki girişimcilik potansiyelini değerlendirmeyi amaçlamaktadır.

TUİK'den elde edilen 1990-2022 yılları arasındaki soya fasulyesi üretimi verileri, çapraz doğrulama için eğitim (n=25) ve test (n=8) kümelerine ayrılmıştır. Eğitim veri kümesine ARIMA, SES, NNAR, MN ve Naive gibi tek değişkenli zaman serisi yöntemleri uygulanarak, ARIMA (1,1,1)'in test kümesi RMSE değerlerine göre en iyi performansı gösterdiği bulunmuştur. Performans sıralaması (RMSE'ye göre) şöyledir: ARIMA (13019) < SES (13888) < Naive (14240) < NNAR (58393) < MN (80418). Bu veri kümesi için otomatik süreçlerin performansı, manuel yöntemlere göre nispeten daha kötü olmuştur, bu da yalnızca otomatik yöntemlere güvenmenin suboptimal tahmin sonuçlarına yol açabileceğini göstermektedir. Bu bulgular, zaman serisi tahmini için otomatik algoritmaların kullanımında insan gözetimi önemini vurgulamakta ve otomatik yöntemler kullanılırken dikkatli olunması gerektiğini göstermektedir.

ARIMA (1,1,1) modeli, 2023-2032 yılları arasında üretimde düz bir eğilim tahmin etmekte olup, başlangıç üretim hacmi 154.516 ton ve hafif bir düşüşle 153.607 tona gerilediği görülmüştür. Bu tahmin edilen durgunluk, ekonomik ve nüfus büyümesi bağlamında soya fasulyesi üretiminin yerli talebinin daha da gersinde kalacağını ve ithalata olan bağımlılığın artacağını göstermektedir. Bu bulgular, kaynak tahsisi, ürün planlaması ve pazar stratejileri ile ilgili bilinçli kararlar almalarına yardımcı olabileceğinden, çiftçiler ve politika yapıcılar için ciddi önem taşımaktadır. Yerel üreticiler, hem yerel hem de ihracat pazarlarına hitap ederek üretim verimliliğini artırarak, rekabet gücünü yükselterek ve potansiyel gelir artışı sağlayarak fayda sağlayabilirler. Ayrıca, bu ticaret dinamiklerinin anlaşılması, paydaşların Türk soya fasulyesi endüstrisi içinde işbirliği veya yatırım için potansiyel alanları belirlemelerine yardımcı olabilir. Türkiye'deki soya fasulyesi üretimi eğilimlerini etkileyen faktörler hakkında daha derinlemesine bilgi edinmek için bu sonuçların daha fazla analizi gerekmektedir.

**Keywords:** Soya üretimi, Turkiye, Zaman Serisi Tahmini, ARIMA, NNAR, Auto-ARIMA

## R Paketleri

Bu çalışmada, R Core Team tarafından geliştirilen R istatistik ortamı, sürüm 4.2.2'yi (2022) kullanılmıştır. Veri manipülasyonu ve temizliği için Wickham ve ark. tarafından oluşturulan tidyverse meta paketi, sürüm 2.0.0 (2019), zaman serisi veri uzantısı için Wang, Cook ve Hyndman tarafından geliştirilen tsibble paketi (sürüm 1.1.3) (2020), tahmin modelleri oluşturmak için O'Hara-Wild, Hyndman ve Wang tarafından oluşturulan fable paketi (sürüm 0.3.3) (2023a), özellik çıkarma ve istatistiksel analiz için O'Hara-Wild, Hyndman ve Wang tarafından geliştirilen feasts paketi (sürüm 0.3.1) (2023b), dünya haritaları oluşturmak için Massicotte ve South tarafından geliştirilen rnaturalearth sürüm 0.3.4 (2023), South tarafından geliştirilen rnaturalearthdata sürüm 0.1.0 (2017), sf paketi sürüm 1.0.14 ve sp paketi sürüm 2.1.2 (2005) (Bivand, Pebesma ve Gomez-Rubio, 2013; Pebesma 2018) tercih edilmiştir.

## Teşekkürler

Bu analiz, kitaplar, paket kılavuzları, vignettes ve GitHub depoları gibi çeşitli kaynaklardan uyarlanan ve değiştirilen kodlardan yaralanmıştır. Kaynaklar aşağıdaki gibi atıf yapılmaktadır:

- Veri hazırlama, manipülasyon, temizleme ve görselleştirme: Wickham
    et al. ([2019](#ref-tidyverse-2019)), Wang, Cook, and Hyndman
    ([2020](#ref-tsibble-2020)), Wang and contibutors
    ([2024](#ref-tsibble-2024-github)),
- Harita görselleştirme: Massicotte and South
    ([2023](#ref-rnaturalearth-2023)), South
    ([2017](#ref-rnaturalearthdata-2017)), Pebesma and Bivand
    ([2005](#ref-rnews-2005)), Bivand, Pebesma, and Gomez-Rubio
    ([2013](#ref-asdar-2013)), Pebesma and contibutors
    ([2024](#ref-sf-2024-github))
- Tahmin modelleri oluşturma: O’Hara-Wild, Hyndman
    ([2021](#ref-hyndman-2021)), O’Hara-Wild, Hyndman, and Wang
    ([2023a](#ref-fable-2023)), O’Hara-Wild, Hyndman, and Wang
    ([2023b](#ref-feasts-2023)), O’Hara-Wild and contibutors
    ([2024](#ref-fable-2024-github))

## Kod Kaynakları

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
