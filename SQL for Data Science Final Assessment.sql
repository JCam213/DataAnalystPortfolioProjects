
---This is my final assessment for UC Davis SQL for Data Science course

Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = ID: 10000
ii. Hours = business_id: 1562
iii. Category = business_id: 2643
iv. Attribute = business_id: 1115
v. Review = id: 10000, business_id: 8090, user_id: 9581
vi. Checkin = business_id: 493
vii. Photo = id: 10000, business_id: 6493
viii. Tip = user_id: 537, business_id: 3979
ix. User = ID: 10000
x. Friend = user_id: 11
xi. Elite_years = user_id: 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: “NO”
	
	
	SQL code used to arrive at answer: 
Select *
From User
Where id IS NULL AND
    review_count IS NULL AND
    yelping_since IS NULL AND
    name IS NULL AND
    useful IS NULL AND
    funny IS NULL AND
    cool IS NULL AND
    fans IS NULL AND
    average_stars IS NULL AND
    compliment_hot IS NULL AND
    compliment_more IS NULL AND
    compliment_profile IS NULL AND
    compliment_cute IS NULL AND
    compliment_note IS NULL AND
    compliment_plain IS NULL AND
    compliment_cool IS NULL AND
    compliment_funny IS NULL AND
    compliment_writer IS NULL AND
    compliment_photos IS NULL 

	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min: 1		max: 5		avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000	avg: 24.2995

5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
Select city, SUM(review_count) as reviews
from business
group by city
order by reviews desc

	
	Copy and Paste the Result Below:
| city            | reviews |
+-----------------+---------+
| Las Vegas       |   82854 |
| Phoenix         |   34503 |
| Toronto         |   24113 |
| Scottsdale      |   20614 |
| Charlotte       |   12523 |
| Henderson       |   10871 |
| Tempe           |   10504 |
| Pittsburgh      |    9798 |
| Montréal        |    9448 |
| Chandler        |    8112 |
| Mesa            |    6875 |
| Gilbert         |    6380 |
| Cleveland       |    5593 |
| Madison         |    5265 |
| Glendale        |    4406 |
| Mississauga     |    3814 |
| Edinburgh       |    2792 |
| Peoria          |    2624 |
| North Las Vegas |    2438 |
| Markham         |    2352 |
| Champaign       |    2029 |
| Stuttgart       |    1849 |
| Surprise        |    1520 |
| Lakewood        |    1465 |
| Goodyear        |    1155 |
+-----------------+---------+
	

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:
select city, stars, sum(Review_count) as count
from business
Where city = 'Avon'
group by stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+------+-------+-------+
| city | stars | count |
+------+-------+-------+
| Avon |   1.5 |    10 |
| Avon |   2.5 |     6 |
| Avon |   3.5 |    88 |
| Avon |   4.0 |    21 |
| Avon |   4.5 |    31 |
| Avon |   5.0 |     3 |
+------+-------+-------+


ii. Beachwood

SQL code used to arrive at answer:
select city, stars, sum(Review_count) as count
from business
Where city = 'Beachwood'
group by stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):	
+-----------+-------+-------+
| city      | stars | count |
+-----------+-------+-------+
| Beachwood |   2.0 |     8 |
| Beachwood |   2.5 |     3 |
| Beachwood |   3.0 |    11 |
| Beachwood |   3.5 |     6 |
| Beachwood |   4.0 |    69 |
| Beachwood |   4.5 |    17 |
| Beachwood |   5.0 |    23 |

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
select name, sum(review_count) as total_reviews
from user
Group by name 
Order by total_reviews DESC
Limit 3

		
	Copy and Paste the Result Below:
		
+--------+---------------+
| name   | total_reviews |
+--------+---------------+
| Nicole |          2397 |
| Sara   |          2253 |
| Gerald |          2034 |

8. Does posing more reviews correlate with more fans?
Not necessarily, having more review count doesn’t mean they have more fans.

	Please explain your findings and interpretation of the results:
Select name, review_count, fans, yelping_since
from user
order by review_count DESC
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: more love (1780) than hate (232)

	
	SQL code used to arrive at answer:
SELECT count(*)
FROM review
WHERE text LIKE ‘%love/hate%’	
	















10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
select name, fans
from user
Order by fans DESC
Limit 10

	
	Copy and Paste the Result Below:
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours? 
Yes, it appears the later the place opens and closes, the more stars the place will get.


ii. Do the two groups you chose to analyze have a different number of reviews?
         Yes, the higher the star rating, the more reviews the place had. 
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

For now, it seems the later the places open/close the higher the rating. This is only from small sample.









SQL code used for analysis:
Select b.name, b.city, b.id, b.review_count, h.hours, b.stars,
    CASE
        When b.stars BETWEEN 2 AND 3.5 THEN '2-3.5_rating'
        When b.stars BETWEEN 3.6 AND 5 THEN '3.6-5_rating'
    END AS Rating
FROM business b 
inner join hours h 
on b.id = h.business_id
inner join category c 
ON c.business_id = b.id
WHERE b.city == 'Toronto'
AND c.category == 'Food'
group By b.stars
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
         The closed restaurants had an avg star rating of 3.52 while open restaurants had an avg rating of 3.68.
         
ii. Difference 2:
         closed restaurants had avg of 23.20 reviews, while open restaurants had an avg of 31.75 reviews.
         
         
SQL code used for analysis:
select is_open, Count(Distinct(id)), AVG(stars), AVG(review_count)
from business
group by is_open

	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         
         I chose to do an analysis of the type of businesses in Las Vegas. If I wanted to start a business, I would like to know what is already established and what is lacking.

ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

The analysis requires the type of business, location, stars, category, and if they’re open or not. This is to identify what type of businesses are already established and open/closed.
                           
                  
iii. Output of your finished dataset:
         +--------------------------------------+---------------------------------+-------+---------+
| name                                 | category                        | stars | is_open |
+--------------------------------------+---------------------------------+-------+---------+
| Motors & More                        | Home Services                   |   5.0 |       1 |
| Motors & More                        | Solar Installation              |   5.0 |       1 |
| Motors & More                        | Heating & Air Conditioning/HVAC |   5.0 |       1 |
| WorldMark Las Vegas - Spencer Street | Hotels & Travel                 |   3.5 |       1 |
| WorldMark Las Vegas - Spencer Street | Resorts                         |   3.5 |       1 |
| WorldMark Las Vegas - Spencer Street | Vacation Rentals                |   3.5 |       1 |
| WorldMark Las Vegas - Spencer Street | Event Planning & Services       |   3.5 |       1 |
| WorldMark Las Vegas - Spencer Street | Hotels                          |   3.5 |       1 |
| Hi Scores - Blue Diamond             | Arts & Entertainment            |   3.5 |       1 |
| Hi Scores - Blue Diamond             | Nightlife                       |   3.5 |       1 |
| Hi Scores - Blue Diamond             | Arcades                         |   3.5 |       1 |
| Hi Scores - Blue Diamond             | Bars                            |   3.5 |       1 |
| Red Rock Canyon Visitor Center       | Education                       |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Visitor Centers                 |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Professional Services           |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Special Education               |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Local Services                  |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Community Service/Non-Profit    |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Hotels & Travel                 |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Travel Services                 |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Gift Shops                      |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Shopping                        |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Parks                           |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Hiking                          |   4.5 |       1 |
| Red Rock Canyon Visitor Center       | Flowers & Gifts                 |   4.5 |       1 |
+--------------------------------------+---------------------------------+-------+---------+
(Output limit exceeded, 25 of 78 total rows shown)
         
iv. Provide the SQL code you used to create your final dataset:

select b.name, c.category, b.stars, b.is_open
from business b
inner join category c 
on b.id = c.business_id
Where city = 'Las Vegas'
order by b.is_open DESC

