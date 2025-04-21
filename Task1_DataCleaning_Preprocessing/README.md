
---

# 🧹 Task 1: Data Cleaning & Preprocessing  

**Goal**: Use Pandas in a Jupyter Notebook to clean and prepare the raw dataset so it's ready for analysis.

---

## 📁 Folder Overview  
```
Task1_DataCleaning_Preprocessing/
├── README.md
├── Task1_DataCleaning_Preprocessing.csv        # Original dataset (raw)
├── Task1_DataPreprocessing.ipynb               # Notebook with preprocessing steps
```

---

## 📦 Contents Description  

- `Task1_DataCleaning_Preprocessing.csv`  
  • This is the **raw dataset** consisting of 10 records and 5 columns:  
    `CustomerID`, `Gender`, `Age`, `Annual Income (k$)`, and `Spending Score`.

- `Task1_DataPreprocessing.ipynb`  
  • A **Jupyter Notebook** containing Pandas code that performs data cleaning through the following steps:
    1. Reading the CSV file  
    2. Identifying and handling missing data  
    3. Dropping duplicate rows  
    4. Standardizing text (e.g., formatting gender values)  
    5. Renaming columns using snake_case  
    6. Converting data types (e.g., Age to integer)  
    7. (Optional) Detecting and removing outliers using the IQR technique  
    8. Saving the cleaned dataset back to CSV  

---

## 🚀 How to Execute  

1. Launch Jupyter Notebook and open `Task1_DataPreprocessing.ipynb`.  
2. Ensure the CSV file is located in the same directory.  
3. Run all cells sequentially from top to bottom.  
4. Once complete, a cleaned dataset will be saved as `Task1_DataCleaning_Preprocessing.csv`.  
5. Open the file to review and confirm all cleaning operations were successful.

---

## 🔧 Data Cleaning Steps Overview  

1. **Read dataset**  
   `pd.read_csv('Task1_DataCleaning_Preprocessing.csv')`

2. **Check for nulls**  
   `df.isnull().sum()`  
   → Handle using `dropna()` or `fillna()`

3. **Eliminate duplicates**  
   `df.drop_duplicates(inplace=True)`

4. **Standardize text fields**  
   `df['Gender'] = df['Gender'].str.capitalize()`

5. **Rename columns**  
   Example:  
   `df.rename(columns={'Annual Income (k$)': 'annual_income_k', 'Spending Score': 'spending_score'}, inplace=True)`

6. **Data type conversions**  
   `df['Age'] = df['Age'].astype(int)`

7. **(Optional) Remove outliers**  
   Use IQR filtering on numerical columns like `annual_income_k`

8. **Export cleaned data**  
   `df.to_csv('Task1_DataCleaning_Preprocessing.csv', index=False)`

---

## ✅ Output  

At the end of the process, you’ll have a clean, well-structured dataset ready for exploration or modeling.

---
