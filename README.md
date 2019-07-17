# Online Bookstore Sales
## Introduce
　　This project uses Spring + Spring MVC + Hibernate to implement an online mall system.
## Run Environment
    JDK1.7+,Tomcat 8.0+,Maven 3.0+
## Run Step

```shell
# 1.Execute the following command to download the code locally (you need to install the GIT client, if not, choose Download as zip on this page to download it locally)
git clone https://github.com/IcedSoul/Shopping.git

# 2.Execute Shooping SQL statements under Shopping/src/main/resources/properties/paths in local or remote MySQL databases to create databases. MySQL needs to be installed locally. Version 5.7 or less is recommended. High-level connections can cause problems. To execute an SQL statement, you can use command line or Navicat and other tools.)

# 3.Open the database. properties configuration file under the path Shopping/src/main/resources/properties/ and change the database connection address, username and password to your own

# 4.Execute the following Maven command (Maven needs to be installed locally)
mvn clean
mvn package

# 5.In the corresponding Shopping war package can be found in the generated target directory

# 6.Copy the war package to the webapps folder in the Tomcat directory and restart the Tomcat server (Tomcat needs to be downloaded, version 8.0 or more)

# 7.Visit http://localhost:8080/Shopping to see the effect. There is no merchandise, you need to add it manually. Register ordinary users, and then change the user role field to 1 in the database to access the console page, add and delete items.)
```
## Main Technologie
　　JavaEE Frameworks：Spring+SpringMVC+Hibernate<br/>
　　Front-end Framework：Bootstrap<br/>
　　Plug-in unit：Layer.js,ajaxfileupload.js<br/>
　　Database：MySQL<br/>

## Main Function
1. Ordinary users
- Login and Registration Functions

- Browse Commodity Functions

- Search Commodity Function

- Check out the details of the merchandise

- Add shopping cart

- Purchasing function (purchased separately on the commodity details page or in bulk in the shopping cart)

- View order status

- Confirmation of Receiving Function

- Evaluating the Functions of Purchased Commodities

  

2. Administrators:
- Have all the functions of ordinary users

- View and delete all user functions

- View and delete all merchandise functions

- Add new merchandise functions

- Order Processing Function

- Delivery function

## Run-Image

 ![image](https://github.com/zhanwenxun/Online-Bookstore-Sales-System/blob/master/run-image/image1.png)

 ![image](https://github.com/zhanwenxun/Online-Bookstore-Sales-System/blob/master/run-image/image2.png)

 ![image](https://github.com/zhanwenxun/Online-Bookstore-Sales-System/blob/master/run-image/image3.png)

 ![image](https://github.com/zhanwenxun/Online-Bookstore-Sales-System/blob/master/run-image/image4.png)

 ![image](https://github.com/zhanwenxun/Online-Bookstore-Sales-System/blob/master/run-image/image5.png)

## Demo address
　　http://localhost:8080/Shopping
