# StreamVerse
This **SQL project** simulates the data analysis work required for a digital media streaming service (Streamverse).

## 💾 StreamVerse Database Setup (DDL)

The script first creates the StreamVerse database and defines four key tables with relationships to simulate the core data structure of a streaming service.

## Tables Created
Table Name,	Primary Key, Columns & Notes
Users,	User_id	Join_date, Subscription_tier, Region
Producers,	Producer_id, Name, Headquarters_City,
Content, Content_id, Title, Genre, Duration_minutes, Release_Year. Foreign Key to Producers (Producer_id).
Watch_History, Watch_id, Watch_date, Watch_time_minutes. Foreign Keys to Users (User_id) and Content (Content_id).

**All foreign keys are defined with on delete cascade.**

## 📈 Data Population (DML)

The script populates the four tables with sample data:
Sample Data Summary
    Users: 5 users (U001 - U005) with a mix of 'Basic' and 'Premium' tiers across four regions.
    Producers: 4 producers (P001 - P004), including an UPDATE statement that changes the name of P004 from 'Japhet' to 'Nora'.
    Content: 6 pieces of content (C001 - C006) spanning diverse genres like 'Culinary', 'Non-Fiction', 'Sci-fi', and 'Fantasy'.
    Watch_History: 10 watch records (W001 - W010) linking users to content with specific watch times and dates.
    
## 🔍 Query Challenge (Data Analysis)

The final section presents ten analytical SQL queries designed to extract insights from the simulated StreamVerse data.
Query #	Purpose	Key Concepts

1	Find the Top 3 Genres by total watch time.	JOIN, GROUP BY, SUM, ORDER BY, TOP 3 (or equivalent).

2	Identify Producers whose content has been watched by fewer than 3 distinct users.	JOIN, GROUP BY, HAVING, COUNT(DISTINCT).

3	Find the Users who have never watched any content.	LEFT JOIN, WHERE IS NULL (finding unmatched records).

4	Calculate the average duration of content watched by 'Premium' tier users.	JOIN (3 tables), AVG, WHERE.

5	List Content Titles and Genres with a duration greater than the overall average content duration.	Subquery (WHERE Duration_minutes > (SELECT AVG(...))).

6	Count the total number of unique titles produced by each producer.	JOIN, GROUP BY, COUNT(DISTINCT).

7	Calculate the sum of watch minutes for watch records where the individual watch time was greater than 10 minutes.	GROUP BY, SUM, HAVING.

8	List all Producers and the Titles they produced (including content without a known producer if an outer join is required).	RIGHT JOIN.

9	Find the User ID and Region of all users who have watched 'Sci-fi' content.	JOIN (4 tables), WHERE.

10	Identify Content with a view count greater than the average view count across all content.	Complex Subquery used within a HAVING clause to compare a content's view count to the average view count of all content.

    
## Author
**Japhet Ujile**
📧 [assistant.rawlings@gmail.com](mailto:assistant.rawlings@gmail.com)
🌐 [GitHub](https://github.com/assistantrawlings-lgtm) | [LinkedIn](https://www.linkedin.com/in/japhet-ujile-838442148?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app])
