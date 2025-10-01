# Kaggle-Titanic-Machine-Learning-From-Disaster-
# Titanic Survival Prediction (R)

This project predicts survival outcomes for passengers on the Titanic using the classic **Kaggle Titanic dataset**. The workflow involves data exploration, feature engineering, and predictive modeling using **linear regression with stepwise selection**.

---

## Project Structure
- `data/` — Training and test datasets  
- `scripts/` — R scripts for analysis, preprocessing, and modeling  
- `output/` — Final CSV file with survival predictions  

---

## Methodology

1. **Exploratory Data Analysis (EDA)**
   - Correlation analysis with the target variable `Survived`
   - Histograms for wealth class distributions
   - Survival rate analysis by embarkment location

2. **Data Preprocessing**
   - Encoded categorical variables (e.g., `male = 1`, `female = 0`)
   - Removed unnecessary columns (`Name`, `Ticket`)
   - Converted features into model-ready format

3. **Modeling**
   - Used **linear regression with stepwise selection** to determine important predictors
   - Built a preprocessing pipeline for test dataset
   - Predicted survival outcomes on test data

4. **Results**
   - Model achieved **61.08% accuracy**
   - Predictions exported to `output/final.csv`

---

## Results & Insights
- Wealth class and gender had strong correlations with survival.
- Linear regression provided insights but limited predictive power compared to classification models like logistic regression or tree-based models.
- Future improvements could involve trying logistic regression, random forests, or gradient boosting.

---

## Getting Started

### Requirements
- R (≥ 4.0.0)

### File descriptions
test.csv - unsupervised testing dataset where the actual survival was not given, they were expected to be predicted by the model
train.csv - training dataset where we were given actual survival.
Titanic_Model.R - the program we designed for analysis and modelling that operated the above tasks
Final.csv - the final prediction to be submitted to test the accuracy.



