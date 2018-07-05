# VA-Dashboard
Source Code of the VA Dashboard

## Demo environment
Visit the demo site for testing
https://vatools.net/vman

### Installation
Download the latest release of Verbal Autopsy Management Dashboard. Deploy VMan.war in your tomcat container. Upon successful deployment, under the root folder, find two sql files 1.install_tables and 2.instal_views. Run the two files against your ODK database. The two script files adds necessary tables and views for VMan to operate. Sample code to run the script is shown below. 

```
$ mysql -u <dbuser> -p <dbpass> dbname < install_tables.sql
$ mysql -u <dbuser> -p <dbpass> dbname < install_views_mysql.sql
```
Fix sql errors before proceeding.

### Configure database connection
Navigate to <tomcat>/<webapps>/vman/WEB-INF/classes. Use any text editor to edit the file db.properties. Add database username and password as shown below
```
## Database connection, comment below if postgres db
db.driver=com.mysql.jdbc.Driver
db.url=jdbc:mysql://localhost

## Postgresql Connection, Comment below if mysql db
#db.driver=org.postgresql.Driver
#db.schema=public
#db.url=jdbc:postgresql://localhost:5432/

## Database credentials
db.name=dbname
db.user=dbuser
db.pass=dbpassword
```
### Configure settings file
Navigate to <tomcat>/<webapps>/vman/WEB-INF/classes. Use any text editor to edit the file st.properties.
```
## Settings file
app.name = crvs
app.page_title = 'The Republic of Tanzania'
app.page_sub_title = 'Verbal Autopsy Management Dashboard'
app.page_logo_file = 'crvs.png'

## Type of the VA Data Mapping vile 1 = WHOVA and 2 = SmartVA
app.va_type = 1

## Administration structure levels
app.admin_level1 = 'Region'
app.admin_level2 = 'District'
app.admin_level3 = 'Ward'
app.admin_level4 = 'Village'

## Interviewer's source data
app.interviewers_name_table = '`VAWHOV151_CORE`'
app.interviewers_name_column = '`RESPONDENT_BACKGR_ID10010`'
app.interviewers_phone_column = '`PHONENUMBER`'
```