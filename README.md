# Pewlett-Hackard-Analysis
using PostgreSQL to explore employee database

## 1. Overview
In this analysis, we are using PostgreSQL to better understand the employee demographic of Pewlett Hackard. Specifically, we want to determine the number of retiring employees per title, so that we can gauge the size of the "silver tsunami" and the company can reflect this in hiring needs and will be adequately prepared. Additionally, we want to identify the employees who are eligible to participate in the mentorship program. Here is an ERD of the preliminary datasets we were working with.

![ERD](Images/EmployeeDB.png)

## 2. Results
First, we created a new dataframe called retirement_titles.csv which held *employee number*, *first name*, *last name*, *title*, *from date* (first day at the firm), and *to date* (last day at the firm). We combined two dataframes to achieve this and filtered the result to only employees who's birth date was between January 1, 1952 and December 31, 1955.
Next, we created a new dataframe called unique_titles.csv to account for the fact that some employees held mulitple titles during their career at Pewlett Hackard and should't be counted twice. To achieve the new dataframe, we used the DISTINCT ON command to further specify our selection.
Lastly, we counted the number of employee numbers in unique_titles.csv and grouped by what those titles were. Here is the result:

![ERD](Images/retiringtitles.png)


In order to determine mentorship eligibility we had to combine data from 3 datasets to get mentorship_eligibility.csv, which contained *employee number*, *first name*, *last name*, *birth date*, *from date*, *to date*, and *title*. We filtered on the people born in the year 1965 and and who haven't left the company yet do determine who is eligible to be a mentor.


 
 
## 3. Conclusion
### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
90,398 roles need to be filled. It is clear that most of the people retiring (almost 60,000) are senior employees (both engineers and staff). There are 2 managers retiring. Hopefully this can better inform the hiring team of the company's needs.

With these retirees, Pewlett Hackard will save an annual total amount of $4,782,884,264. Now, the company determine not only which positions need filling but also how many new hires they can afford.

![](Images/money.png)


### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

There are 1,549 retirement-ready employees qualified for the mentorship. Of those, 417 are in the Development department, 356 are in the Production Department, and 247 are in Sales. Departments like Finance and Quality Management may need more mentors.

![ERD](Images/mentorshipdepartmentcounts.png)



