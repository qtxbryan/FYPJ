import pymysql
import list

COLLECTION_LIST = list.COLLECTIONS

def createMethod(name, class_id, protect_id):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )

    try:
        with connection.cursor() as cursor:
            sql = "INSERT INTO method (`name`, `class_id`, `protect_id`) VALUES (%s,%s,%s)"
            try:
                cursor.execute(sql, (name, class_id, protect_id))
                print("Method successfully added")
            except Exception as e:
                print(e)
                print("Opps something wrong unable to create method")
        connection.commit()

    finally:
        connection.close()


def createPermission(name):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )

    try:
        with connection.cursor() as cursor:
            sql = "INSERT INTO permission (`name`) VALUES(%s)"
            try:
                cursor.execute(sql, name)
                print("Permission added successfully")
            except Exception as e:
                print(e)
                print("Opps Something wrong unable to create permission")
        connection.commit()

    finally:
        connection.close()


def updateAppDetails(app_id, description, title, url, category_id, dev_id):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )

    try:
        with connection.cursor() as cursor:
            sql = "UPDATE app SET `app_id` = %s, `description` = %s, `title` = %s, `url` = %s, `categoryID` = %s, `developerID` =%s WHERE `app_id` = %s)"
            try:
                cursor.execute(sql, (app_id, description, title, url, category_id, dev_id, app_id))
                print("App details updated successfully")
            except Exception as e:
                print(e)
                print("Opps something happened unable to update app details")
        connection.commit()

    finally:
        connection.close()


def createAppDetails(app_id, description, title, url, category_id, dev_id):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )
    try:
        with connection.cursor() as cursor:
            sql = "INSERT INTO app (`app_id`, `description`, `title`, `url`, `categoryID`, `developerID`) VALUES(%s,%s,%s,%s,%s,%s)"
            try:
                cursor.execute(sql, (app_id, description, title, url, category_id, dev_id))
                print("Task added successfully")
            except Exception as e:
                print(e)
                print("Opps! Something wrong unable to create app details")
        connection.commit()
    finally:
        connection.close()


# HERE WE WILL DO SOME CHECKING ON THE LIST THAT IS ON CLIENT SIDE WITH THE LIST IN THE DATABASE
# IF NO SUCH CATEGORY FOUND, WE WILL ADD THE NEW CATEGORY
# ELSE WE WILL PROCEED
def createCategory(catName):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )
    try:
        with connection.cursor() as cursor:
            sql = "INSERT INTO category (`name`) VALUES(%s)"
            try:
                cursor.execute(sql, (catName))
                print("Category added successfully")
            except Exception as e:
                print(e)
                print("Opps! Something wrong unable to create category")
        connection.commit()
    finally:
        connection.close()

def createCollection(collName):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )
    try:
        with connection.cursor() as cursor:
            sql = "INSERT INTO collections (`name`) VALUES(%s)"
            try:
                cursor.execute(sql, (collName))
                print("Collection added successfully")
            except Exception as e:
                print(e)
                print("Opps! Something wrong unable to create category")
        connection.commit()
    finally:
        connection.close()


def createDeveloper(dev_id, name, url, email, address):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )
    try:
        with connection.cursor() as cursor:
            sql = "INSERT INTO developer (`developerID`, `name`, `dev_url`, `email`, `address`) VALUES(%s,%s,%s,%s, %s)"
            try:
                cursor.execute(sql, (dev_id, name, url, email, address))
                print("Developer added successfully")
            except Exception as e:
                print(e)
                print("Opps! Something wrong unable to create developer")
        connection.commit()
    finally:
        connection.close()


def updateDeveloper(dev_id, name, url, email, address):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )
    try:
        with connection.cursor() as cursor:
            sql = "UPDATE developer SET `name` = %s, `dev_url` = %s, `email` = %s, `address` = %s WHERE developerID = %s"
            try:
                cursor.execute(sql, (name, url, email, address, dev_id))
                print("Update developer successful")
                cursor.close()
            except Exception as e:
                print(e)
                print("Opps! Something wrong unable to update developer")
        connection.commit()
    finally:
        connection.close()


def readDeveloper(dev_id):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )
    try:
        with connection.cursor() as cursor:
            sql = "SELECT * FROM developer WHERE `developerID` = %s"
            try:
                cursor.execute(sql, (dev_id))
                result = cursor.fetchall()
                cursor.close()

                print("READ passed")
                print(result)
                return result
            except Exception as e:
                print(e)
                print("Opps something went wrong unable to read category")
        connection.commit()
    finally:
        connection.close()


def readCategory(name):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )
    try:
        with connection.cursor() as cursor:
            sql = "SELECT `categoryID` FROM category WHERE `name` = %s"
            try:
                cursor.execute(sql, (name))
                result = cursor.fetchall()
                cursor.close()
                print("read passed")
                return result
            except Exception as e:
                print(e)
                print("Opps something went wrong unable to read category ")
        connection.commit()
    finally:
        connection.close()


def readAppDetails():
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )
    try:
        with connection.cursor() as cursor:
            sql = "SELECT `id`, `app_id`, `title`, `description`, `dev_id`, `url` FROM app "
            try:
                cursor.execute(sql)
                result = cursor.fetchall()

                print("ID\t\t App_ID\t\t\t\t\t title")
                print("--------------------------------------")
                for row in result:
                    print(str(row[0]) + "\t\t" + row[1] + "\t\t\t" + row[2])
            except Exception as e:
                print(e)
                print("Opps! Something wrong unable to read app details ")

        connection.commit()
    finally:
        connection.close()


def readExistedApp(app_id):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='dbplaystore'
    )
    try:
        with connection.cursor() as cursor:
            sql = "SELECT * FROM app WHERE `app_id` = %s"
            try:
                cursor.execute(sql, (app_id))
                result = cursor.fetchall()
                print(result)
                return result
            except Exception as e:
                print(e)
                print("Opps! Something wrong unable to read app details")

        connection.commit()
    finally:
        connection.close()


