# Bank Loan Report: Performance Analysis

## Project Overview
This project presents a comprehensive, data-driven analysis of a bank's loan performance. Leveraging SQL for robust data transformation and MS Excel for dynamic visualization and reporting, this report provides key business insights into lending activities, risk assessment and borrower behavior. The primary goal is to aid stakeholders in making informed decisions to optimize lending strategies, manage risk, and enhance profitability.

## Problem Statement & Objectives
The report addresses the critical need to continuously monitor and assess the bank's lending activities to ensure financial health and strategic growth.
The main objectives include:
* Tracking core Key Performance Indicators (KPIs) like total loan applications, funded amounts, amounts received, average interest rates, and Debt-to-Income (DTI) ratios, including Month-to-Date (MTD) and Month-over-Month (MoM) changes.
* Analyzing loan performance by classifying loans as 'Good' (Fully Paid, Current) or 'Bad' (Charged Off).
* Visualizing key trends and distributions across various parameters such as time, geographic region, loan term, employment length, loan purpose, and home ownership status.
* Conducting detailed risk assessments based on loan grades, subgrades, and charged-off loan trends.
* Analyzing loan repayment behavior through recovery ratios and borrower segmentation.

## Data Source
The analysis is based on a `bank_loan_data` dataset, which contains detailed records of individual loan transactions and borrower information.

## Tools Used
* **SQL (MySQL):** Used for data cleaning, transformation, aggregation, and querying to extract all necessary KPIs and detailed analytical insights.
* **MS Excel:** Utilized for creating interactive dashboards, visualizations, and generating the final report.

## Key Features & Analyses
The report is structured into three main dashboards:

1.  **Summary Dashboard:**
    * Displays core lending KPIs (Total Applications, Funded, Received, Avg Interest Rate, Avg DTI) with MTD and MoM changes.
    * Highlights the performance split between 'Good Loans' and 'Bad Loans' through percentages and absolute figures.
    * Provides a detailed Loan Status Grid View for metrics across different loan statuses.

2.  **Overview Dashboard (Visual Trends & Key Distributions):**
    * **Monthly Trends:** Visualizes changes in applications, funded, and received amounts over time.
    * **Regional Analysis:** Maps loan activity by state (e.g., CA leading in funded amounts).
    * **Loan Term Analysis:** Shows the distribution of loans by term length (e.g., 36-month terms dominating).
    * **Employment Length Analysis:** Breaks down lending metrics by borrower employment duration.
    * **Loan Purpose Breakdown:** Illustrates the primary reasons for loans (e.g., Debt Consolidation as the top purpose).
    * **Home Ownership Analysis:** Displays metrics based on borrower's housing status.

3.  **Details Dashboard (Additional Loan Insights & Repayment Behavior):**
    * **Specific Questions & Insights:** Answers targeted questions like Top States by Funded Amount, Average Loan Amount by Purpose, Default Rate by Grade, Highest Risk Subgrades, Bad Loan Trends Over Time, Top Job Titles associated with Charged Off Loans, Average Interest Rate by Home Ownership, and Most Common Loan Purpose among High DTI Borrowers.
    * **Loan Repayment Behavior Analysis:** Delves into actual recovery ratios, segments borrowers into "Fully Repaid," "Partial Repayers," and "Low Repayers," and analyzes recovery across different loan grades and purposes.

## How to View the Report
To view the comprehensive analysis, download the `Bank_Loan_Report.xlsx` file from this repository and open it with Microsoft Excel.

## Author
* **Name:** Shivika Gupta
* **Institution:** Gokhale Institute of Politics and Economics
* **GitHub:** [https://github.com/shivikagupta21](https://github.com/shivikagupta21)
* **LinkedIn:** [https://www.linkedin.com/in/shivika-gupta-6a5ab3217/](https://www.linkedin.com/in/shivika-gupta-6a5ab3217/)
* **Date:** July 2025